#' ggplot2: Add an automatic scale to a plot
#'
#' @description Create a automatic scale to a ggplot2 plot.
#'
#' @eval arg_value("axis","character",default = "'x'","will be the axis to scale, must be x, y or xy")
#' @eval arg_number_of("n_breaks",default = "10",number_of = "axis breaks")
#' @eval arg_value("expand","numeric",default = "0.01","will be the expanded margin to the axis")
#' @eval arg_mark("decimal")
#' @eval arg_mark("thousand")
#'
#' @return A ggplot2 object.
#'
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
#'  plt_scale_auto("x",n_breaks = 10)+
#'  plt_scale_auto("y",n_breaks = 10)
#'
#'

plt_scale_auto <-
  function(
    axis = c("x","y","xy","both"),
    n_breaks = 10,
    expand = .01,
    thousand_mark = ".",
    decimal_mark = ","
  ){

    stopifnot(is.character(axis), length(axis) == 1)

    axis <- tolower(axis)

    axis_ref <- c("x","y","xy","both")

    stopifnot(axis %in% axis_ref)

    stopifnot(is.numeric(n_breaks), length(n_breaks) == 1, n_breaks > 1)

    n_breaks <- as.integer(n_breaks)

    stopifnot(is.numeric(expand), length(expand) == 1, expand > 0)

    stopifnot(is.character(thousand_mark), length(thousand_mark) == 1)

    stopifnot(is.character(decimal_mark), length(decimal_mark) == 1)

    if(axis == "x"){
      output <-
        ggplot2::scale_x_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_breaks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    if(axis == "y"){
      output <-
        ggplot2::scale_y_continuous(
          expand = c(expand,0),
          breaks = scales::breaks_extended(n_breaks),
          labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
        )
    }

    if(axis %in% c("xy","both")){
      output <-
        list(
          ggplot2::scale_y_continuous(
            expand = c(expand,0),
            breaks = scales::breaks_extended(n_breaks),
            labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
          ),
          ggplot2::scale_x_continuous(
            expand = c(expand,0),
            breaks = scales::breaks_extended(n_breaks),
            labels = scales::label_number(thousand_mark = ".",decimal_mark = ",")
          )
        )

    }

    return(output)
  }


# library(ggplot2)
# plot <-
# ggplot(mtcars,aes(hp,drat))+
# geom_point()
#
# plot+
#  plt_scale_auto("xy",n_breaks = 3,expand = 0)
#
# plot+
#  plt_scale_auto("x",n_breaks = 10)+
#  plt_scale_auto("y",n_breaks = 10)
