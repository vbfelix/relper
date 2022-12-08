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

    axis <- tolower(axis)

    if(relper::not_in(axis,c("x","y"))){
      stop("Axis must be equal x or y.")
    }

    if(axis == "x"){
      out <-
        ggplot2::scale_x_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_ticks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    if(axis == "y"){
      out <-
        ggplot2::scale_y_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_ticks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    return(out)
  }
