#' No labels in ggplot2
#'
#' @description Object, that clears ggplot2 labels
#'
#'
#' @return ggplot2 object
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
#' plot + no_labels
#'

no_labels <- ggplot2::labs(x = "",
                           y = "",
                           col = "",
                           fill = "",
                           size = "",
                           alpha = "")
