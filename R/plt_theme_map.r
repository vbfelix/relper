#' ggplot2: A clean black and white theme for maps
#'
#' @description Removal of grid, border, background, title, text and ticks for ggplot2 plot.
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
#' plot + plt_theme_map()
#'

plt_theme_map <-
  function(base_size = 14, base_family = "", margin = .35){

    stop_function(arg = base_size,type = "numeric",single_value = TRUE)

    stop_function(arg = base_family,type = "character",single_value = TRUE)

    stop_function(arg = margin,type = "numeric",single_value = TRUE)

    '%+replace%' <- ggplot2::'%+replace%'

    ggplot2::theme_bw(
      base_size = base_size,
      base_family = base_family
    ) %+replace%
      ggplot2::theme(
        legend.text = ggplot2::element_text(size = 12),
        panel.grid.major = ggplot2::element_blank(),
        panel.grid.minor = ggplot2::element_blank(),
        axis.text = ggplot2::element_blank(),
        axis.ticks = ggplot2::element_blank(),
        axis.title = ggplot2::element_blank(),
        panel.background = ggplot2::element_blank(),
        panel.border = ggplot2::element_blank(),
        plot.margin = ggplot2::unit(rep(margin,4), "cm")
      )
  }
