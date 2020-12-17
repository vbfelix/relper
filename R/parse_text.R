#' Parse text
#'
#' @description Extract only text from a string
#'
#' @param x char vector
#'
#' @return prints a image
#' @export
#'
#' @examples
#'
#'parse_text("1ABCF45Z89")
#'
#'

parse_text <- function(x){
  gsub("[^a-zA-Z]", "", x)
}
