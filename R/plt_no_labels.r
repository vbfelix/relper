#' ggplot2: Removal of all labels
#'
#' @description Removal of all labels from a ggplot2 plot.
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
#' plot + plt_no_labels
#'

plt_no_labels <-
  ggplot2::labs(
    x = "",
    y = "",
    col = "",
    fill = "",
    size = "",
    alpha = ""
    )
