#' @import dplyr
#' @import lubridate
#'
#' @title Criação de variáveis derivadas de data
#' @description Cria variáveis a partir de uma data, como: ano, mês e dia.
#'
#' @param df data.frame
#' @param date_var variável de data
#'
#' @return data.frame
#' @export date_vars
#'
#' @examples
#'
#' date_vars(df,dt_saida)
#'

date_vars <- function(df,date_var){

  df %>%
    dplyr::mutate(
      mes_abb = lubridate::month({{date_var}},label = TRUE,abbr = TRUE),
      mes_lbl = lubridate::month({{date_var}},label = TRUE,abbr = FALSE),
      mes_num = lubridate::month({{date_var}}),
      dia_num = lubridate::day({{date_var}}),
      ano_num = lubridate::year({{date_var}}),
      ano_lbl = as.factor(ano_num),
      sem_num = lubridate::isoweek({{date_var}}),
      dia_sem = lubridate::wday({{date_var}},label = TRUE),
      dia_lbl = paste0(dia_num," [",dia_sem,"]")
    )
}
