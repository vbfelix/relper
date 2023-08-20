#' ggplot2: Removal of all text and ticks from both axis
#'
#' @description Removal of all text and ticks from both axis, in a ggplot2 plot.
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
#'   ggplot(mtcars,aes(hp,drat))+
#'   geom_point()
#'
#' plot
#'
#' plot + plt_no_text
#'

plt_no_text <-
  ggplot2::theme(
    axis.text = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_blank()
  )

