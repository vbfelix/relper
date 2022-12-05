#' @import dplyr
#' @import lubridate
#'
#' @title Create auxiliar variables from a date
#' @description Create auxiliar variables from a date, such as: year, month, day, etc.
#'
#' @param df data.frame
#' @param dt_var date variable
#'
#' @return data.frame
#' @export calc_date_aux
#'
#' @examples
#'
#' create_date_aux(df,dt)
#'

calc_date_aux <- function(df,dt_var){

  df %>%
    dplyr::mutate(
      mon_abb = lubridate::month({{dt_var}},label = TRUE,abbr = TRUE),
      mon_lbl = lubridate::month({{dt_var}},label = TRUE,abbr = FALSE),
      mon_num = lubridate::month({{dt_var}}),
      day_num = lubridate::day({{dt_var}}),
      year_num = lubridate::year({{dt_var}}),
      year_lbl = as.factor(year_num),
      week_num = lubridate::isoweek({{dt_var}}),
      day_week = lubridate::wday({{dt_var}},label = TRUE),
      week_day = paste0(day_num," [",day_week,"]")
    )
}
