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
#' df_summary(mtcars)
#'

df_summary <- function(df){

  if(sum(stringr::str_detect(class(df),
                             paste(c("tbl_df","tbl","data.frame","tabyl","grouped_df","data.table"),
                                   collapse = "|"))) ==  0){
    stop("df must be a data.frame/tibble")
  }

  df_num <-
    df %>%
    dplyr::select_if(is.numeric)

  if(ncol(df_num) == 0){

    print("0 numeric variables")

  }else{

    df_num <-
      df_num %>%
      tidyr::gather(var,value) %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::num_summary(value))

   print("Numeric variables")

   print(df_num)
  }

  df_cat <-
    df %>%
    dplyr::select_if(purrr::negate(is.numeric))

  if(ncol(df_cat) == 0){

    print("0 categoric variables")

  }else{

    df_cat <-
      df_cat %>%
      tidyr::gather(var,value) %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::cat_summary(value))

    print("Categoric variables")

    print(df_cat)
  }
}
