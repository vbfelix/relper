#' ggplot2 theme
#'
#' @description theme_bw with no minor grid
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
#' plot + plt_theme_xy()
#'

plt_theme_xy <-
  function(base_size = 14, base_family = "", margin = .35){
    '%+replace%' <- ggplot2::'%+replace%'

    ggplot2::theme_bw(base_size = base_size, base_family = base_family) %+replace%
      ggplot2::theme(
        legend.text = ggplot2::element_text(size = 14, face = "bold"),
        legend.position = "top",
        strip.text = ggplot2::element_text(colour = "white"),
        strip.background = ggplot2::element_rect(fill = "black"),
        panel.grid.minor = ggplot2::element_blank(),
        plot.margin = ggplot2::unit(rep(margin,4), "cm")
      )
  }
