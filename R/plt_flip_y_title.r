#' ggplot2: Flip y axis title
#'
#' @description The y axis title with horizontal rotation.
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
#' plot + plt_flip_y_title
#'

plt_flip_y_title <-
  ggplot2::theme(axis.title.y = ggplot2::element_text(hjust = 1, angle = 360))
