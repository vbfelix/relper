#' Source with utf-8
#'
#' @description
#'
#' @param r_file r file
#'
#' @return
#' @export
#'
#' @examples
#' source_utf8("import_data.r")
#'

source_utf8 <- function(r_file) {
  l <- readLines(r_file, encoding="UTF-8")
  eval(parse(text=l),envir=.GlobalEnv)
}
