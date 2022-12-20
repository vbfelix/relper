#' Water mark
#'
#' @description Import png file as watermark for ggplot2
#'
#' @param png_file png file path
#'
#' @return object to use in ggplot2
#' @export
#'
#' @examples
#'
#'
#' library(ggplot2)
#'
#' #A local png file is necessary
#' logo <- plt_water_mark(path_to_local_png)
#'
#' ggplot()+
#'   annotation_custom(logo)


plt_water_mark <-function(png_file){

  png <- png::readPNG(png_file)

  grid::rasterGrob(image = png, interpolate = FALSE)

}
