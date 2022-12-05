#' Data summary
#'
#' @description Compute summary statistics for data
#'
#' @param df data.frame
#'
#' @return tibble
#' @export
#'
#' @examples
#'
#' mtcars
#'
#' summary_data(mtcars)
#'

summary_data <- function(df){

  if(!is.data.frame(df)){stop("df must be a data.frame/tibble.")}

  df_num <-
    df %>%
    dplyr::select_if(is.numeric)

  if(ncol(df_num) == 0){

    print("0 numeric variables.")

  }else{

    df_num <-
      df_num %>%
      tidyr::gather(var,value) %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::summary_num(value))

   print(paste0(ncol(df_num)," numeric variables."))

   print(df_num)
  }

  df_cat <-
    df %>%
    dplyr::select_if(purrr::negate(is.numeric))

  if(ncol(df_cat) == 0){

    print("0 categoric variables.")

  }else{

    df_cat <-
      df_cat %>%
      tidyr::gather(var,value) %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::summary_cat(value))

    print(paste0(ncol(df_cat)," categoric variables."))

    print(df_cat)
  }
}
