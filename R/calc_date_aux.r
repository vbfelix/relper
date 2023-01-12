#' @import dplyr
#' @import lubridate
#'
#' @title Create auxiliar variables from a date
#' @description Create auxiliar variables from a date, such as: year, month, day, etc.
#'
#' @eval arg_df("df")
#' @eval arg_df_var("dt_var","date")
#'
#' @return data.frame
#' @export calc_date_aux
#'
#' @examples
#'
#' df <- data.frame(dt = lubridate::dmy("01/01/01"))
#'
#' calc_date_aux(df,dt)
#'

calc_date_aux <- function(df,dt_var){

  if(!is.data.frame(df)){stop("'df' must be a data.frame.")}

  df %>%
    dplyr::mutate(
      mon_abb = lubridate::month({{dt_var}},label = TRUE,abbr = TRUE),
      mon_lbl = lubridate::month({{dt_var}},label = TRUE,abbr = FALSE),
      mon_num = lubridate::month({{dt_var}}),
      day_num = lubridate::day({{dt_var}}),
      year_num = lubridate::year({{dt_var}}),
      year_lbl = as.factor(year_num),
      week_num = lubridate::week({{dt_var}}),
      epiweek_num = lubridate::epiweek({{dt_var}}),
      isoweek_num = lubridate::isoweek({{dt_var}}),
      wday_abb = lubridate::wday({{dt_var}},label = TRUE,abbr = TRUE),
      wday_lbl = lubridate::wday({{dt_var}},label = TRUE,abbr = FALSE)
    )
}
