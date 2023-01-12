#' Auto scale
#'
#' @description Provide automatic scaling to ggplot2
#'
#' @param axis axis indicator: x or y
#' @param n_ticks number of ticks
#' @param expand expanded space
#'
#'
#' @return ggplot2 object
#' @export
#'
#' @examples
#'library(ggplot2)
#'
#'plot <-
#'ggplot(mtcars,aes(hp,drat))+
#' geom_point()
#'
#'plot+
#'  plt_scale_auto("x",n_ticks = 10)+
#'  plt_scale_auto("y",n_ticks = 10)
#'
#'

plt_scale_auto <-
  function(
    axis = "x",
    n_ticks = 10,
    expand = .01,
    thousand_mark = ".",
    decimal_mark = ","
  ){

    if(!is.character(axis)){"'axis' must be a character."}

    if(!is.numeric(n_ticks)){"'n_ticks' must be numeric."}

    # if(!relper::is_integer(n_ticks)){"'n_ticks' must be numeric."}

    axis <- tolower(axis)

    axis_ref <- c("x","y")

    if(relper::isnot_in(axis,c("x","y"))){stop("'axis' must be equal x or y.")}

    if(axis == "x"){
      output <-
        ggplot2::scale_x_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_ticks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    if(axis == "y"){
      output <-
        ggplot2::scale_y_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_ticks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    return(output)
  }
