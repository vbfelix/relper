#' Compute a percentage
#'
#' @description Compute  the percentage based on one or multiple variables.
#'
#' @eval arg_df("df")
#' @param grp_var The grouping variable(s) based on which the percentages will be computed
#' @param main_var An optional variable, when provided, will be utilized to compute the percentage for each of its own levels
#'
#' @return A data.frame summarizing the counts and percentages within groups. The output is arranged in descending order of counts within each group.
#'
#' @export
#'
#' @examples
#'
#' #without main_var
#' calc_perc(mtcars,grp_var = c(cyl,vs))
#'
#' #main_var within grp_var
#' calc_perc(mtcars,grp_var = c(cyl,vs),main_var = vs)
#'
#' #main_var not within grp_var
#' calc_perc(mtcars,grp_var = c(cyl),main_var = vs)

calc_perc <- function(df,grp_var, main_var = NULL){

  stopifnot(is.data.frame(df))

  if(is.null(substitute(main_var))){
    output <-
      df %>%
      dplyr::group_by(dplyr::across({{grp_var}})) %>%
      dplyr::summarise(n = dplyr::n(),.groups = 'drop') %>%
      dplyr::ungroup() %>%
      dplyr::mutate(perc = 100*n/sum(n,na.rm = TRUE)) %>%
      dplyr::arrange(-n)

  }else {
    output <-
      df %>%
      dplyr::group_by({{main_var}},across({{grp_var}})) %>%
      dplyr::summarise(n = dplyr::n(),.groups = 'drop') %>%
      dplyr::group_by({{main_var}}) %>%
      dplyr::mutate(perc = 100*n/sum(n,na.rm = TRUE)) %>%
      dplyr::arrange({{main_var}},-n)
  }

  return(output)

}
