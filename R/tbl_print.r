#' Table plot
#'
#' @description Plot a table as an image
#'
#' @param tbl table data.frame
#' @param header_col color of the header (default = grey75)
#' @param base_size table size (default = 20)
#' @param bold_last bold last row (default = F)
#'
#' @return prints a image
#' @export
#'
#' @examples
#'
#'df <- data.frame(grp = c("a","b","c"),
#'                 freq = c(2,4,6))
#'
#' tbl_print(df,bold_last = T,header_col = "red")
#'
#'

tbl_print <-
  function(
    tbl,
    header_col = "grey75",
    base_size = 15,
    bold_last = FALSE,
    print = TRUE,
    save = FALSE,
    img_path = getwd(),
    img_name = "test",
    img_width = 20,
    img_height = 14
    ){

  if(!is.numeric(base_size)){stop("base_size must be numeric.")}

  if(!is.numeric(img_width)){stop("img_width must be numeric.")}

  if(!is.numeric(img_height)){stop("img_height must be numeric.")}

  if(!is.data.frame(tbl)){stop("tbl must be a data.frame/tibble.")}

  if(nrow(tbl) > 25){warning("numbers of rows is too long.")}

  if(ncol(tbl) > 10){ warning("numbers of columns is too long.")}

  plot(1)

  dev.off()

  n <- nrow(tbl)

  if(bold_last == FALSE){
    aux_bold <- "plain"
  }else{
    aux_bold <- "bold.italic"
  }

  tbl_theme <-
    gridExtra::ttheme_default(
      base_size = base_size,
      colhead = list(bg_params = list(fill = header_col, col = NA)),
      core = list(
        bg_params = list(fill = NA),
        fg_params = list(fontface = c(rep("plain", n-1),aux_bold))
        )
    )

  out <- gridExtra::tableGrob(tbl,rows = NULL, theme = tbl_theme)

  if(print){
    grid::grid.draw(out)
  }
  if(print == FALSE){
    return(out)
  }
  if(save){
    ggplot2::ggsave(
      plot = out,
      filename = paste0(img_name,".png"),
      path = img_path,
      width = img_width,
      height = img_height,
      units = "cm"
    )
  }
}

