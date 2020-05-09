#' Water mark
#'
#' @description Import png file as watermark for ggplot2
#'
#' @param png_file png file.
#'
#' @return object to use in ggplot2
#' @export
#'
#' @examples

water_mark<-function(png_file){

  grid::rasterGrob(image = png::readPNG(logo), interpolate = T)

}
