#' ggplot2: A black and white theme without major grid lines in the x axis
#'
#' @description A theme with no minor grids in both axes and no major grid lines in the x axis.
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
#' plot + plt_theme_y()
#'

plt_theme_y <-
  function(base_size = 14, base_family = "", margin = .35){

    stopifnot(is.numeric(base_size), length(base_size) == 1, base_size > 0)

    stopifnot(is.character(base_family), length(base_family) == 1)

    stopifnot(is.numeric(margin), length(margin) == 1, margin > 0)

    '%+replace%' <- ggplot2::'%+replace%'

    relper::plt_theme_xy(
      base_size = base_size,
      base_family = base_family,
      margin = margin
    ) %+replace%
      ggplot2::theme(
        panel.grid.major.x = ggplot2::element_blank()
      )
  }
