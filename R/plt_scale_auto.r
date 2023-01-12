#' Auto scale
#'
#' @description Provide automatic scaling to ggplot2
#'
#' @param axis axis indicator: x (default), y or xy
#' @param n_ticks number of ticks
#' @param expand expanded space
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

    if(!relper::is_integer(n_ticks)){"'n_ticks' must be a integer."}

    if(relper::is_negative(n_ticks)){"'n_ticks' must be > 0."}

    if(!is.numeric(expand)){"'expand' must be numeric."}

    if(relper::is_negative(expand)){"'expand' must be > 0."}

    if(!is.character(thousand_mark)){"'thousand_mark' must be a character."}

    if(!is.character(decimal_mark)){"'decimal_mark' must be a character."}

    axis <- tolower(axis)

    axis_ref <- c("x","y","xy","both")

    if(relper::isnot_in(axis,axis_ref)){stop("'axis' must be one of: x, y or xy.")}

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

    if(axis %in% c("xy","both") ){
      output <-
        list(
          ggplot2::scale_y_continuous(
            expand = c(expand,0),
            breaks = scales::breaks_extended(n_ticks),
            labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
          ),
          ggplot2::scale_x_continuous(
            expand = c(expand,0),
            breaks = scales::breaks_extended(n_ticks),
            labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
          )
        )

    }

    return(output)
  }


# plot <-
# ggplot(mtcars,aes(hp,drat))+
# geom_point()
#
# plot+
#  plt_scale_auto("xy",n_ticks = 10)
#
#  plt_scale_auto("x",n_ticks = 10)+
#  plt_scale_auto("y",n_ticks = 10)
