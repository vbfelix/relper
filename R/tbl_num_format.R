#' Format data.frame
#'
#' @description Apply num_format to all numeric columns in a data.frame
#'
#' @param df data.frame
#' @param digits number of digits
#'
#' @return data.frame
#' @export
#'
#' @examples
#' library(tidyverse)
#' mtcars %>%
#'   count(vs,am) %>%
#'   tbl_num_format(digits = 5)

tbl_num_format <- function(df,digits = 2){

  df %>%
    dplyr::mutate(dplyr::across(where(is.numeric),~relper::num_format(.,digits = digits)))

}
