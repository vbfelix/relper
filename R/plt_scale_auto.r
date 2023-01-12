#' Auto scale
#'
#' @description Provide automatic scaling to ggplot2
#'
#' @eval arg_value("axis","character",default = "'x'","will be the axis to scale, must be x, y or xy")
#' @eval arg_number_of("n_breaks",default = "10",number_of = "axis breaks")
#' @eval arg_value("expand","numeric",default = "0.01","will be the expanded margin to the axis")
#' @eval arg_mark("decimal")
#' @eval arg_mark("thousand")
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
#'  plt_scale_auto("x",n_breaks = 10)+
#'  plt_scale_auto("y",n_breaks = 10)
#'
#'

plt_scale_auto <-
  function(
    axis = "x",
    n_breaks = 10,
    expand = .01,
    thousand_mark = ".",
    decimal_mark = ","
  ){

    stop_function(arg = axis,type = "character",single_value = TRUE)

    stop_function(arg = n_breaks,type = "integer",single_value = TRUE,bigger_than = 2)

    stop_function(arg = expand,type = "numeric",single_value = TRUE,bigger_than = 0)

    stop_function(arg = thousand_mark,type = "character",single_value = TRUE)

    stop_function(arg = decimal_mark,type = "character",single_value = TRUE)

    axis_ref <- c("x","y","xy","both")

    stop_one_of(axis,axis_ref)

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
