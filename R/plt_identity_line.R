#' ggplot2: Add a identity line to a scatter plot
#'
#' @description Add a identity line to a ggplot2 scatter plot.
#'
#' @eval arg_value("color","character",default = "'black'", action = "will be the line color")
#' @eval arg_value("linetype","character",default = "'dashed'", action = "will be the line type")
#' @eval arg_value("linewidth","numeric",default = "0.75", action = "will be the line width")
#' @eval arg_value("label","character",default = "'Identity line'", action = "will be the line label")
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
#' plot + plt_identity_line()
#'

plt_identity_line <-
  function(color = "black", linetype = "dashed",linewidth = .75, label = "Identity line"){

  stopifnot(is.character(color), length(color) == 1)

  stopifnot(is.character(linetype), length(linetype) == 1)

  stopifnot(is.numeric(linewidth), length(linewidth) == 1, linewidth > 0)

  list(
    ggplot2::geom_abline(
      mapping = ggplot2::aes(slope = 1, intercept = 0,linewidth = label),
      linetype = linetype,
      color = color
    ),
    ggplot2::labs(linewidth = ""),
    ggplot2::scale_linewidth_manual(values = c(linewidth,linewidth))
  )
}


