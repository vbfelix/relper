#' Numeric vector
#'
#' @description Coerce a character vector to numeric: removing thousand separator, replace comma with dots and applytins as.numeric()
#'
#' @param x character vector
#'
#'
#' @return Numeric vector
#' @export
#'
#' @examples
#'
#' x <- "10.000,50"
#'
#' num_convert(x)
#'

num_convert <- function(x){

  if(!is.numeric(x)){

    as.numeric(gsub("\\,", "\\.",gsub("\\.", "", x)), na.rm = F)

  }else{
      return(x)
    }

}
