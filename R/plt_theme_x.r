#' ggplot2: A black and white theme without major grid lines in the y axis
#'
#' @description A theme with no minor grids in both axes and no major grid lines in the y axis.
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
#' plot + plt_theme_x()
#'

plt_theme_x <-
  function(base_size = 14, base_family = "", margin = .35){

    stop_function(arg = base_size,type = "numeric",single_value = TRUE)

    stop_function(arg = base_family,type = "character",single_value = TRUE)

    stop_function(arg = margin,type = "numeric",single_value = TRUE)

    '%+replace%' <- ggplot2::'%+replace%'

    relper::plt_theme_xy(
      base_size = base_size,
      base_family = base_family,
      margin = margin
    ) %+replace%
      ggplot2::theme(
        panel.grid.major.y = ggplot2::element_blank()
      )

  }



