#' Calendar plot
#'
#' @description Calendar plot, from library ggcal
#'
#' @param df data.frame from cal_data function
#'
#' @return ggplot2 plot
#' @export
#'
#' @examples
#'
#' library(tidyverse)
#'
#' # Calendar
#'
#' date <- seq(as.Date("2017-02-01"), as.Date("2017-07-22"), by="1 day")
#'
#' fill <- rnorm(length(date))
#'
#' cal_plot(cal_data(date,fill))
#'
#' # Calendar + a variable
#'
#' date <- seq(as.Date("2016-01-01"), as.Date("2016-02-28"),by = "1 day")
#'
#' tibble(dates = rep(date, 3),
#'       value = rnorm(3*length(date)),
#'       grp = rep(c("A","B","C"), each = length(date))) %>%
#'  nest(-grp) %>%
#'  mutate(aux = map(data,~cal_data(.$dates,.$value))) %>%
#'  select(-data) %>%
#'  unnest() %>%
#'  cal_plot(facet = grp)
#'

cal_plot <- function(df, facet = ""){

  wday_lbl <- toupper(substr(levels(df$wday),1,1))

  plot <-
    ggplot2::ggplot(df,ggplot2::aes(x, y, fill = fill)) +
    ggplot2::geom_tile(color = "gray80", size = .8) +
    ggplot2::theme_minimal(18)+
    ggplot2::scale_x_continuous(position = "top",
                                breaks = 0:6,
                                labels = wday_lbl,
                                expand = c(0,0))+
    ggplot2::scale_y_continuous(expand = c(0,0)) +
    ggplot2::theme(panel.background = ggplot2::element_rect(fill = NA, color = NA),
                   strip.background = ggplot2::element_rect(fill = NA, color = NA),
                   panel.grid = ggplot2::element_blank(),
                   strip.text.x = ggplot2::element_text(hjust = 0, face = "bold"),
                   axis.title = ggplot2::element_blank(),
                   axis.text.y = ggplot2::element_blank(),
                   strip.placement = "outsite")

  if(rlang::expr(facet) == ""){
    plot <-
      plot +
      ggplot2::facet_wrap(~monlabel,
                          ncol = 3,
                          scales = "free")
  }

  if(rlang::expr(facet) != ""){
    plot <- plot + ggplot2::facet_wrap(facets = dplyr::vars(monlabel,{{facet}}),
                                       ncol = 3,
                                       scales = "free")
  }

  plot(plot)
}
