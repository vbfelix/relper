#' Water mark
#'
#' @description Import png file as watermark for ggplot2
#'
#' @param png_file png file, already imported in R
#' @param png_path png path to import the png file
#'
#' @return object to use in ggplot2
#' @export
#'
#' @examples
#'#'
#' library(ggplot2)
#'
#' #A local png file is necessary
#'
#' ggplot(mtcars)+
#'   plt_water_mark(file_path = path_to_local_png)


plt_water_mark <-function(png_file = NULL, png_path = NULL){

  if(is.null(png_file) & is.null(png_path)){stop("You must set either 'png_file' or 'png_path'.")}

  if(!is.null(png_file) & !is.null(png_path)){stop("You must set either 'png_file' or 'png_path'.")}

  if(is.null(png_file) & !is.null(png_path)){

    png <- png::readPNG(png_file)

  }

  if(!is.null(png_file) & is.null(png_path)){

    png <- png_file

  }

  ggplot2::annotation_custom(
    grob = grid::rasterGrob(image = png, interpolate = FALSE),
    xmin = -Inf,
    xmax = Inf,
    ymin = -Inf,
    ymax = Inf
    )
}
