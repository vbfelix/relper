#' ggplot2: Add a single point with two lines in a ggplot2
#'
#' @description Add a single point in a ggplot2 scatter plot.
#'
#' @eval arg_value("x","numeric")
#' @eval arg_value("y","numeric")
#' @eval arg_value("size","numeric",default = "3", action = "will be the point size")
#' @eval arg_value("color","character",default = "'firebrick3'", action = "will be the point color")
#' @eval arg_boolean("add_line",default = "TRUE", action = "add lines that intercept the point")
#' @eval arg_value("linetype","character",default = "'dashed'", action = "will be the line type")
#' @eval arg_value("linewidth","numeric",default = "0.75", action = "will be the line width")
#' @eval arg_value("label","character",default = "NULL", action = "will add a label on top of the point")

#'
#' @return A ggplot2 object.
#'
#' @export
#'
#' @examples
#'
#' library(ggplot2)
#'
#' plot <-
#'   ggplot(mtcars,aes(qsec,mpg))+
#'   geom_point()
#'
#' plot
#'
#' plot + plt_pinpoint(x = 18,y = 25)
#'

plt_pinpoint <- function(x,y,color = "firebrick3",size = 3, add_line = TRUE, linetype = "dashed",linewidth = .75,label = NULL){

  stopifnot(is.numeric(x))

  stopifnot(is.numeric(y))

  stopifnot(length(x) == length(y))

  stopifnot(is.numeric(size), length(size) == 1, size > 0)

  stopifnot(is.character(color), length(color) == 1)

  stopifnot(is.character(linetype), length(linetype) == 1)

  stopifnot(is.numeric(linewidth), length(linewidth) == 1, linewidth > 0)

  output <-
    list(
      ggplot2::annotate(
        geom = "point",
        x = x,
        y = y,
        color = color,
        size = size
      )
    )

  if(add_line){

    output <-
      list(
        output,
        ggplot2::geom_vline(
          xintercept = x,color = color,linetype = linetype, linewidth = linewidth
        ),
        ggplot2::geom_hline(
          yintercept = y,color = color,linetype = linetype, linewidth = linewidth
        )
      )
  }

  if(!is.null(label)){
    output <-
      list(
        output,
        ggplot2::annotate(
          geom = "text",
          x = x,
          y = 1.05*y,
          label = label,
          color = color
        )
      )
  }

  return(output)

}
