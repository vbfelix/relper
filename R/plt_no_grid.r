#' ggplot2: Removal of grid
#'
#' @description Removal of the grid from a ggplot2 plot.
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
#' plot + plt_no_grid
#'

plt_no_grid <-
  ggplot2::theme(
    panel.grid = ggplot2::element_blank()
  )

