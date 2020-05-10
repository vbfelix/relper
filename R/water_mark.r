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
#'
#'
#' library(ggplot2)
#'
#' url <- "https://www.osbsoftware.com.br/admin/upload_produtos/RStudio%20-%20produto.png"
#'
#' logo <- water_mark(RCurl::getURLContent(url))
#'
#' ggplot()+
#'   annotation_custom(logo)
#'
water_mark<-function(png_file){

  grid::rasterGrob(image = png::readPNG(png_file), interpolate = T)

}
