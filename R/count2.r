#' Compute the frequency of counts, giving a group variable
#'
#' @description It counts the frequency of the counts, gibing a initial frequency count of the number of occurrences of each group size.
#'
#' @eval arg_df("df")
#' @eval arg_df_var("grp_var","")

#' @return A data.frame
#'
#' @export
#'
#' @examples
#'
#' count2(mtcars,cyl)
#'


count2 <- function(df,grp_var){

  stopifnot(is.data.frame(df))

  df %>%
    dplyr::count({{grp_var}}) %>%
    dplyr::count(n)

}

