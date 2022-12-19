#' Water mark
#'
#' @description Import png file as watermark for ggplot2
#'
#' @param png_file png file path
#' @param local_file if is a local file, local = T (default), if it is a url local = F
#'
#'
#'
#' @return object to use in ggplot2
#' @export
#'
#' @examples
#'
#'
#' library(ggplot2)
#'
#' url <- "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/R_logo.svg/1200px-R_logo.svg.png"
#'
#' logo <- plt_water_mark(url,local_file = FALSE)
#'
#' ggplot()+
#'   annotation_custom(logo)


plt_water_mark <-function(png_file,local_file = TRUE){

  if(!is.logical(local_file)){stop("'local_file' must be logical.")}

  if(local_file){
    png <- png::readPNG(png_file)
  }else{
    png <- png::readPNG(RCurl::getURLContent(png_file))
  }

  grid::rasterGrob(image = png, interpolate = FALSE)

}
