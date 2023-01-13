#' ggplot2: Apply a transparent background.
#'
#' @description Apply a transparent background for a ggplot2 plot.
#'
#' @return A ggplot2 object.
#'
#' @export
#'
#' @examples
#' library(ggplot2)
#'
#' plot <-
#'   ggplot(mtcars,aes(hp,drat))+
#'   geom_point()
#'
#' plot
#'
#' plot + plt_no_background
#'

plt_no_background <-
  ggplot2::theme(
    # bg of the panel
    panel.background  = ggplot2::element_rect(fill = "transparent"),
    # bg of the plot
    plot.background   = ggplot2::element_rect(fill = "transparent", color = NA),
    # get rid of legend bg
    legend.background = ggplot2::element_rect(fill = "transparent"),
    # get rid of legend panel bg
    legend.box.background = ggplot2::element_rect(fill = "transparent")
  )
