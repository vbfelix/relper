#' Water mark
#'
#' @description Import png file as watermark for ggplot2
#'
#' @param png_obj png obj, already imported in the R global environment
#' @param png_filepath png path to import the png file
#'
#' @return object to use in ggplot2
#' @export
#'
#' @examples
#'#'
#' library(ggplot2)
#'
#' ggplot(mtcars)+
#' plt_water_mark(vfx_watermark)
#'
#' #A local png file is necessary
#'
#' ggplot(mtcars)+
#'   plt_water_mark(png_filepath = path_to_local_png)


plt_water_mark <-function(png_obj = NULL, png_filepath = NULL){

  if(is.null(png_obj) & is.null(png_filepath)){stop("You must set either 'png_obj' or 'png_filepath'.")}

  if(!is.null(png_obj) & !is.null(png_filepath)){stop("You must set either 'png_obj' or 'png_filepath'.")}

  if(is.null(png_obj) & !is.null(png_filepath)){

    png <- png::readPNG(png_obj)

  }

  if(!is.null(png_obj) & is.null(png_filepath)){

    png <- png_obj

  }

  ggplot2::annotation_custom(
    grob = grid::rasterGrob(image = png, interpolate = FALSE),
    xmin = -Inf,
    xmax = Inf,
    ymin = -Inf,
    ymax = Inf
    )
}


