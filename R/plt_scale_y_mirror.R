#' ggplot2: Mirror the y axis on the right side
#'
#' @description Mirror the ticks and text from the y axis on the right side.
#'
#' @eval arg_vector("breaks","numeric",action = "will be the breaks in the y axis")
#' @eval arg_vector("labels","",default = "NULL",action = "will be the labels in the axis, if not provided 'breaks' will be used instead")
#' @eval arg_vector("expand","numeric",default = "c(0.01,0)","is the range expansion used to add some space between the data and the plot border")
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
#' plot + plt_scale_y_mirror(breaks = seq(0,40,4))
#'


plt_scale_y_mirror <-
  function(
    breaks,
    labels = NULL,
    expand = c(.01,0),
    ...
  ){

    stopifnot(is.numeric(breaks))

    stopifnot(is.null(labels) | length(labels) == length(breaks))

    stopifnot(is.numeric(expand), length(expand) == 2)

    if(is.numeric(breaks)){

      output <-
        ggplot2::scale_y_continuous(
          breaks = breaks,
          expand = expand,
          labels = labels,
          sec.axis = ggplot2::sec_axis(
            trans = ~ .,
            breaks = breaks,
            labels = labels
          )
        )
    }

    if(relper::is_string(breaks)){

      output <-
        ggplot2::scale_y_discrete(
          breaks = breaks,
          expand = expand,
          labels = labels,
          sec.axis = ggplot2::sec_axis(
            trans = ~ .,
            breaks = breaks,
            labels = labels
          )
        )
    }

    return(output)

  }


