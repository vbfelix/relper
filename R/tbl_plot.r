#' Table plot
#'
#' @description Plot table as image
#'
#' @param tbl table data.frame
#' @param header_col color of the header
#' @param base_size table size (default = 20)
#'
#' @return prints a image
#' @export
#'
#' @examples
#'
#' df <- data.frame(grp = c("a","b","c"),
#'                 freq = c(2,4,6))
#'
#' tbl_plot(df)
#'
#'

tbl_plot <- function(tbl,header_col = "grey75",base_size = 20){

  if( !(class(tbl)[1] %in% c("tbl_df","tbl","data.frame"))){
    stop("tbl must be a data.frame/tibble")
  }

  dev.off()

  n <- nrow(tbl)

  tbl_theme <- gridExtra::ttheme_default(
    base_size = base_size,
    colhead = list(bg_params = list(fill = header_col, col=NA)),
    core = list(bg_params = list(fill = NA))
  )

  out <- gridExtra::tableGrob(tbl,rows = NULL, theme = tbl_theme)

  grid::grid.draw(out)

}

