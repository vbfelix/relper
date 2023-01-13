#' ggplot2: Application of a watermark
#'
#' @description Application of a watermark for a ggplot2 plot.
#'
#' @param obj The name of the R object with the watermark as an array
#'
#' @return A ggplot2 object.
#'
#' @export
#'
#' @examples
#'
#' library(ggplot2)
#'
#' ggplot(mtcars)+
#' plt_water_mark(vfx_watermark)
#'



plt_water_mark <-function(obj){

  # if(!exists(obj,)){stop("argument 'obj' must exist in the global environment.")}

  ggplot2::annotation_custom(
    grob = grid::rasterGrob(image = obj, interpolate = FALSE),
    xmin = -Inf,
    xmax = Inf,
    ymin = -Inf,
    ymax = Inf
    )
}


