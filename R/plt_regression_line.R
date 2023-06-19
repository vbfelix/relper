#' ggplot2: Add a regression line to a scatter plot
#'
#' @description Add a regression line to a ggplot2 scatter plot.
#'
#' @eval arg_value("color","character",default = "'black'", action = "will be the line color")
#' @eval arg_value("linetype","character",default = "'dashed'", action = "will be the line type")
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
#' plot + plt_regression_line()
#'

plt_regression_line <- function(color = "black", linetype = "dashed",linewidth = .75){
  list(
    ggplot2::geom_smooth(
      method = "lm",
      se = FALSE,
      formula = "y ~ x",
      mapping = ggplot2::aes(alpha = "Regression line"),
      linetype = linetype,
      color = color,
      linewidth = linewidth
    ),
    ggplot2::labs(alpha = ""),
    ggplot2::scale_alpha_manual(values = c(1,1))
  )
}


