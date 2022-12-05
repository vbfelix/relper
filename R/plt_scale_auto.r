#' Auto scale
#'
#' @description Provide automatic scaling to ggplot2
#'
#' @param axis axis indicator: x or y
#' @param n number of ticks
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
#'  plt_scale_auto("x",n = 10)+
#'  plt_scale_auto("y",n = 10)
#'
#'

plt_scale_auto <- function(axis = "x",n = 10, expand = .01){

  axis <- tolower(axis)

  if(relper::not_in(axis,c("x","y"))){
    stop("Axis must be equal x or y.")
  }

  if(axis == "x"){
    out <-
      ggplot2::scale_x_continuous(
        expand = c(expand,0),
        breaks = scales::breaks_extended(n),
        labels = scales::label_number(big.mark = ".",decimal.mark = ",")
        )
  }

  if(axis == "y"){
    out <-
      ggplot2::scale_y_continuous(
        expand = c(expand,0),
        breaks = scales::breaks_extended(n),
        labels = scales::label_number(big.mark = ".",decimal.mark = ",")
      )
  }

  return(out)
}
