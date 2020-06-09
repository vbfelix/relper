#' Dual axis plot
#'
#' @description Rescale data
#'
#' @param df data.frame
#'
#' @param x_axis name of the x axis variable
#'
#' @param y_left name of the y axis variable for the left side
#'
#' @param y_right name of the y axis variable for the right side
#'
#' @param y_breaks numeric vector of the y axis left breaks
#'
#' @param col_left name of the color for the left side
#'
#' @param col_right name of the color for the right side
#'
#' @param legend_pos legend position
#'
#' @return ggplot2 object
#'
#' @export
#'
#' @examples
#'
#' x <- seq(0,1,l = 100)
#'
#' y <- cumsum(rnorm(100))
#'
#' z <- y^3 + rnorm(100)
#'
#' data <- tibble(x,y,z)
#'
#' dual_plot(data,"x","y","z")
#'

dual_plot <- function(df,
                      x_axis,
                      y_left,
                      y_right,
                      y_breaks = NULL,
                      col_left = "forestgreen",
                      col_right = "chocolate2",
                      legend_pos = "top",...){

  if(sum(stringr::str_detect(class(df),
                             paste(c("tbl_df","tbl","data.frame","tabyl","grouped_df","data.table"),
                                   collapse = "|"))) ==  0){
    stop("tbl must be a data.frame/tibble")
  }

  if(is.numeric(y_breaks) == F & is.null(y_breaks) == F){
    stop("y_breaks must be numeric")
  }

  x <- do.call("c",df[,x_axis])

  y <- unlist(df[,y_left])

  z <- unlist(df[,y_right])

  # if(is.numeric(x) == F){
  #   stop("x_axis must be numeric")
  # }

  if(is.numeric(y) == F){
    stop("y_left must be numeric")
  }

  if(is.numeric(z) == F){
    stop("y_right must be numeric")
  }

  max_y <- max(y,na.rm = T)

  min_y <- min(y,na.rm = T)

  if(max(y_breaks) > max_y ){
    stop("max of y_breaks must be <= max of y_left")
  }

  if(min(y_breaks) < min_y ){
    stop("min of y_breaks must be >= min of y_left")
  }

  mult_max <- (max_y-min_y)/5

  if(mult_max < 1){

    max_seq <-  signif(mult_max,digits = 2)

  }else{

    max_seq <-  round(mult_max)

  }

  y2 <- relper::scale01(z,min_y,max_y)

  if(is.null(y_breaks)){

    y1_seq <- relper::mult_seq(y,max_seq)

  }else{

    y1_seq <- y_breaks

  }

  y2_lbl <- relper::num_format(relper::scale01(c(y1_seq,min_y,max_y), min(z), max(z)),2)

  y2_lbl <- y2_lbl[1:length(y1_seq)]

  dplyr::tibble(x,y,y2) %>%
    tidyr::gather(var,value,-x) %>%
    ggplot2::ggplot(aes(x,value,col = var))+
    ggplot2::geom_line(size = .8)+
    relper::theme_y()+
    ggplot2::scale_y_continuous(breaks = y1_seq,
                                sec.axis = ggplot2::sec_axis(~., breaks = y1_seq, labels = y2_lbl))+
    theme(axis.text.y.left    = ggplot2::element_text(colour = col_left,  face = "bold"))+
    theme(axis.text.y.right   = ggplot2::element_text(colour = col_right, face = "bold"))+
    scale_color_manual(values = c(col_left,col_right))+
    theme(legend.position = legend_pos)+
    labs(
      y = "",
      col = ""
      )

}
