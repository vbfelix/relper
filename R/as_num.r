#' Numeric vector
#'
#' @description Coerce a character vector to numeric: removing thousand separator, replacing comma with dots and applyting as.numeric()
#'
#' @param x character vector
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' x <- "10.000,50"
#'
#' as_num(x)
#'

as_num <- function(x){

  if(!is.numeric(x)){

    as.numeric(gsub("\\,", "\\.",gsub("\\.", "", x)), na.rm = FALSE)

  }else{
      return(x)
    }

}