#' Flip y axis title
#'
#' @description axis.title.y rotated
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
#' plot + flip_y_title

flip_y_title <-
  ggplot2::theme(axis.title.y = ggplot2::element_text(hjust = 1, angle = 360))
