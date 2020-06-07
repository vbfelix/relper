#' Table plot
#'
#' @description Plot a table as an image
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

tbl_plot <- function(tbl,header_col = "grey75",base_size = 15){

  if(sum(stringr::str_detect(class(tbl),
                             paste(c("tbl_df","tbl","data.frame","tabyl","grouped_df","data.table"),
                                   collapse = "|"))) ==  0){
    stop("tbl must be a data.frame/tibble")
  }

  if(nrow(tbl) > 25){
    warning("numbers of rows is to long")
  }

  if(ncol(tbl) > 8){
    warning("numbers of columns is to long")
  }

  plot(1)

  dev.off()

  n <- nrow(tbl)

  tbl_theme <-
    gridExtra::ttheme_default(
      base_size = base_size,
      colhead = list(bg_params = list(fill = header_col, col=NA)),
      core = list(bg_params = list(fill = NA))
    )

  out <- gridExtra::tableGrob(tbl,rows = NULL, theme = tbl_theme)

  grid::grid.draw(out)

}

