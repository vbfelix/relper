#' ggplot2 theme
#'
#' @description theme_bw with no minor grid and major x grid
#'
#' @return ggplot2 theme
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
#' plot + theme_y()
#'

theme_y <-
  function(base_size = 14, base_family = "", margin = .25){
    ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
      ggplot2::theme(
        legend.text = element_text(size = 14, face = "bold"),
        panel.grid.major.x = element_blank(),
        panel.grid.minor = element_blank(),
        plot.margin = unit(rep(margin,4), "cm")
      )
  }
