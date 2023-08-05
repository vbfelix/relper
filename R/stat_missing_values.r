#' Calculate the percentage of missing values
#'
#' @description percentage of missing values for each variable.
#'
#'
#' @eval arg_df("df")
#' @eval arg_boolean("plot",action = "plot the percentage of missing values")
#'
#'
#' @return A tibble.
#' @export
#'
#' @examples
#'
#'
#'vector <- c(1:10,rep(NA,4))
#'
#'set.seed(123);data <-
#' data.frame(
#'  a = sample(x = vector,size = 100,replace = TRUE),
#'  b = sample(x = vector,size = 100,replace = TRUE),
#'  c = sample(x = vector,size = 100,replace = TRUE),
#'  d = sample(x = vector,size = 100,replace = TRUE),
#'  e = sample(x = vector,size = 100,replace = TRUE),
#'  f = sample(x = vector,size = 100,replace = TRUE)
#'  )
#'
#'stat_missing_values(data)
#'

stat_missing_values <- function(df,plot = TRUE){

  stopifnot(is.data.frame(df))

  stopifnot(is.logical(plot), length(plot) == 1)

  output <-
    df %>%
    dplyr::summarise(dplyr::across(.cols = dplyr::everything(),.fns = ~100*sum(is.na(.))/length(.))) %>%
    tidyr::pivot_longer(cols = dplyr::everything()) %>%
    dplyr::arrange(-value) %>%
    dplyr::tibble()

  if(plot){
    output %>%
      dplyr::mutate(name = forcats::fct_reorder(name,value)) %>%
      ggplot2::ggplot(ggplot2::aes(value,name))+
      ggplot2::geom_col()+
      relper::plt_theme_x()+
      ggplot2::geom_text(ggplot2::aes(label = relper::format_num(value),x = value+1.5),fontface = "bold")+
      ggplot2::scale_x_continuous(
        breaks = seq(0,100,5),
        limits = c(0,max(output$value,na.rm = TRUE)+5),
        expand = c(0,0)
      )+
      ggplot2::labs(
        x = "Percentage of missing values",
        y = "Variable"
      )+
      relper::plt_flip_y_title
  }else{
    return(output)
  }


}
