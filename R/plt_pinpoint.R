#' ggplot2: Add a single point with two lines in a ggplot2
#'
#' @description Add a single point in a ggplot2 scatter plot.
#'
#' @eval arg_value("x","numeric")
#' @eval arg_value("y","numeric")
#' @eval arg_value("size","numeric",default = "3")
#' @eval arg_value("color","character",default = "'firebrick3'", action = "will be the line color")
#' @eval arg_value("linetype","character",default = "'dashed'", action = "will be the line type")
#' @eval arg_value("linewidth","numeric",default = "0.75", action = "will be the line width")
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

plt_pinpoint <- function(x,y,color = "firebrick3",size = 3, linetype = "dashed",linewidth = .75){

  # stop_function(arg = "x",type = "numeric",single_value = TRUE)

  # stop_function(arg = "y",type = "numeric",single_value = TRUE)

  # stop_function(arg = "size",type = "numeric",single_value = TRUE,bigger_than = 0)

  stop_function(arg = "color",type = "character",single_value = TRUE)

  stop_function(arg = "linetype",type = "character",single_value = TRUE)

  list(
    ggplot2::geom_vline(
      xintercept = x,color = color,linetype = linetype, linewidth = linewidth
    ),
    ggplot2::geom_hline(
      yintercept = y,color = color,linetype = linetype, linewidth = linewidth
    ),
    ggplot2::annotate(
      geom = "point",
      x = x,
      y = y,
      color = color,
      size = size
    )
  )
}
