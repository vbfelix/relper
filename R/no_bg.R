#' Transparent background
#'
#' @description Transparent background for ggplot2
#'
#' @return theme object
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
#' plot + no_bg
#'

no_bg <-
  ggplot2::theme(
    panel.background  = ggplot2::element_rect(fill = "transparent"), # bg of the panel
    plot.background   = ggplot2::element_rect(fill = "transparent", color = NA), # bg of the plot
    legend.background = ggplot2::element_rect(fill = "transparent"), # get rid of legend bg
    legend.box.background = ggplot2::element_rect(fill = "transparent") # get rid of legend panel bg
  )
