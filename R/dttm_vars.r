#' @title Create auxiliars variables for a date variable
#'
#' @description Computation of auxiliar date variables:
#'  \cr
#'  \cr - mon_abb: a factor with the abbreviated name of the month;
#'  \cr - mon_lbl: a factor with the complete name of the month;
#'  \cr - mon_num: the number of the month;
#'  \cr - day_num: the number of the day within the month;
#'  \cr - year_num: the number of the year;
#'  \cr - week_num: the number of complete seven day periods that have occurred between the date and January 1st, plus one;
#'  \cr - epiweek_num: the US CDC version of epidemiological week. Starts on Sunday;
#'  \cr - isoweek_num:  the week as it would appear in the ISO 8601 system, which uses a reoccurring leap week. Starts on Monday;
#'  \cr - wday_abb: a factor with the week day abbreviated name;
#'  \cr - wday_lbl: a factor with the week day complete name.
#'
#' @eval arg_df("df")
#' @eval arg_df_var("dt_var","date")
#'
#' @return A tibble with the original data and the new computed variables.
#'
#' @export dttm_vars
#'
#' @examples
#'
#' df <- data.frame(dt = lubridate::dmy("01/01/01"))
#'
#' dplyr::glimpse(dttm_vars(df,dt))
#'

dttm_vars <- function(df,dt_var, prefix = NULL){

  stop_function(arg = df,type = "dataframe")

  stop_function(arg = prefix,type = "character",null = TRUE)

  output <-
    df %>%
    tibble::as_tibble() %>%
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

  if(!is.null(prefix)){

    output <-
      dplyr::rename_with(
        .data = output,
        .fn = ~paste0(prefix,"_",.),
        .cols = mon_abb:wday_lbl
      )

  }

  return(output)
}


