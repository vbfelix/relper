#' Add a identity line to ggplot2 scatter plot
#'
#' @description Add a identity line to ggplot2 scatter plot
#'
#' @eval arg_value("color","character",default = "black", action = "will be the line color")
#' @eval arg_value("linetype","character",default = "dashed", action = "will be the line type")
#'
#' @return ggplot2 theme
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

plt_identity_line <- function(color = "black", linetype = "dashed"){
  list(
    ggplot2::geom_abline(
      mapping = ggplot2::aes(slope = 1, intercept = 0,alpha = "Identity line"),
      linetype = linetype,
      color = color),
    ggplot2::labs(alpha = ""),
    ggplot2::scale_alpha_manual(values = c(1,1))
  )
}


