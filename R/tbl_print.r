#' Table plot
#'
#' @description Plot a table as an image
#'
#' @param tbl data.frame
#' @param header_color color of the header (default = grey75)
#' @param text_size table size (default = 20)
#' @param bold_last_row bold last row (default = FALSE)
#' @param print print the table (default = TRUE)
#' @param img_save save the table as image (default = FALSE)
#' @param img_path path to save the image (default = working directory)
#' @param img_name name of the image to be saved (default = 'test')
#' @param img_width width of the image to be saved, in centimeters (default = 20)
#' @param img_height height of the image to be saved, in centimeters  (default = 14)
#'
#' @return prints a image
#' @export
#'
#' @examples
#'
#' df <- data.frame(grp = c("a","b","c"),
#'                  freq = c(2,4,6))
#'
#' tbl_print(df,bold_last_row = TRUE,header_color = "red")
#'
#'

tbl_print <-
  function(
    tbl,
    header_color = "grey75",
    text_size = 15,
    bold_last_row = FALSE,
    print = TRUE,
    img_save = FALSE,
    img_path = getwd(),
    img_name = "test",
    img_width = 20,
    img_height = 14
    ){

  if(!is.data.frame(tbl)){stop("'tbl' must be a data.frame.")}

  if(!is.character(header_color)){stop("'header_color' must be a character.")}

  if(!is.numeric(text_size)){stop("'text_size' must be numeric.")}

  if(!is.logical(bold_last_row)){stop("'bold_last_row' must be logical.")}

  if(!is.logical(print)){stop("'print' must be logical.")}

  if(!is.logical(img_save)){stop("'img_save' must be logical.")}

  if(!is.character(img_path)){stop("'img_path' must be a character.")}

  if(!is.character(img_name)){stop("'img_name' must be a character.")}

  if(!is.numeric(img_width)){stop("'img_width' must be numeric.")}

  if(!is.numeric(img_height)){stop("'img_height' must be numeric.")}

  if(nrow(tbl) > 25){warning("numbers of rows is too long.")}

  if(ncol(tbl) > 10){ warning("numbers of columns is too long.")}

  plot(1)

  dev.off()

  n <- nrow(tbl)

  if(bold_last_row == FALSE){
    aux_bold <- "plain"
  }else{
    aux_bold <- "bold.italic"
  }

  tbl_theme <-
    gridExtra::ttheme_default(
      text_size = text_size,
      colhead = list(bg_params = list(fill = header_color, col = NA)),
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
  if(img_save){
    ggplot2::ggimg_save(
      plot = out,
      filename = paste0(img_name,".png"),
      path = img_path,
      width = img_width,
      height = img_height,
      units = "cm"
    )
  }
}

