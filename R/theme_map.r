#' ggplot2 theme
#'
#' @description no grid, border, background, title, text and ticks
#'
#' @return theme object
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
#' plot + theme_map()
#'

theme_map <-
  function(base_size = 14, base_family = "", margin = .25){
    ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
      ggplot2::theme(
        legend.text = element_text(size = 14, face = "bold"),
        panel.grid.major = element_blank(),
        panel.grid.minor = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        axis.title = element_blank(),
        panel.background = element_blank(),
        panel.border = element_blank(),
        plot.margin = unit(rep(margin,4), "cm")
      )
  }
