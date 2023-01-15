#' ggplot2: A black and white theme without minor grid lines
#'
#' @description A theme with no minor grids in both axes
#'
#' @eval arg_value("base_size","numeric",default = "14","will be the base font size")
#' @eval arg_value("base_family","character",default = "''","will be the base font family")
#' @eval arg_value("margin","numeric",default = "0.35","will be the plot margin")
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
