#' Makes a visual representation of a palette
#'
#' @description Makes a visual representation of a palette.
#'
#' @eval arg_vector("palette","character",action = "")
#'
#' @return A ggplot2 plot.
#'
#' @export
#'
#' @examples
#'
#' palette_example(palette = palette_div(name = "arcane"))
#'


palette_example <- function(palette){

  func_name <- rlang::get_expr(rlang::enquo(palette))

  data.frame(x = palette) %>%
    ggplot2::ggplot(ggplot2::aes(x = x, y = 1, fill = as.factor(x) ))+
    ggplot2::geom_tile(col = "black",size = .8)+
    ggplot2::scale_fill_manual(values = palette)+
    ggplot2::scale_x_discrete(expand = c(0,0))+
    ggplot2::scale_y_continuous(expand = c(0,0))+
    relper::plt_theme_map()+
    ggplot2::theme(
      legend.position = "none",
      axis.ticks = ggplot2::element_blank(),
      axis.text.y = ggplot2::element_blank(),
      strip.background = ggplot2::element_blank(),
      strip.text = ggplot2::element_text(face = "bold",size = 15),
      axis.text.x = ggplot2::element_text(color = "black", size = 12)
    )+
    ggplot2::labs(
      subtitle = func_name
    )+
    ggplot2::coord_fixed(ratio = .25)
}

