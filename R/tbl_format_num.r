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
#'
#' library(dplyr)
#'
#' mtcars %>%
#'   count(vs,am) %>%
#'   tbl_format_num(digits = 5)

tbl_format_num <- function(df,digits = 2){

  if(!is.data.frame(df)){stop("'df' must be a data.frame.")}

  if(!is.numeric(digits)){stop("'digits' must be numeric.")}

  df %>%
    dplyr::mutate(dplyr::across(tidyselect::where(is.numeric),~relper::format_num(.,digits = digits)))

}
