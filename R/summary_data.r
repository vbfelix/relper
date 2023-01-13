#' Summary of a data.frame
#'
#' @description Summary statistics of a data.frame, with the summary statistics for the categorical and numeric variables.
#'
#' @eval arg_df("df")
#'
#' @return A diagnostic of the data.frame.
#'
#' @export
#'
#' @examples
#'
#' mtcars
#'
#' summary_data(mtcars)
#'

summary_data <- function(df){

  stop_function(arg = df,type = "dataframe")

  df_num <-
    df %>%
    dplyr::select(where(is.numeric))

  if(ncol(df_num) == 0){

    print("0 numeric variables.")

  }else{

    output <-
      df_num %>%
      tidyr::pivot_longer(cols = everything(),names_to = "var",values_to = "value") %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::summary_num(value))

   print(paste0(ncol(df_num)," numeric variables."))

   print(output)
  }

  df_cat <-
    df %>%
    dplyr::select(where(purrr::negate(is.numeric)))

  if(ncol(df_cat) == 0){

    print("0 categoric variables.")

  }else{

    output <-
      df_cat %>%
      tidyr::pivot_longer(cols = everything(),names_to = "var",values_to = "value") %>%
      dplyr::group_by(var) %>%
      dplyr::summarise(relper::summary_cat(value))

    print(paste0(ncol(df_cat)," categoric variables."))

    print(output)
  }
}
