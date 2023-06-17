#' Test the normality of a numeric variable
#'
#' @description Test the normality of a numeric variable.
#'
#' @eval arg_vector("x","numeric")
#' @eval arg_value("alpha",type = "numeric",default = 0.05,action = "is the significance level to compute the variable 'is_normal'")
#' @eval arg_value("digits",type = "integer",default = "NULL",action = "will be the number used to round the values")
#' @eval arg_boolean("print",action = "print the values in the viewer")
#'
#' @details Apply the following normality tests:
#'
#' \cr - Anderson-Darling
#' \cr - Cramer-Von Mises
#' \cr - Kolmogorov-Smirnov
#' \cr - Lilliefors
#' \cr - Pearson chi-square
#' \cr - Shapiro-Francia
#' \cr - Shapiro-Wilk
#'
#' @return A tibble (7x4) with each test: statistic, p-value and the condicional check of normality, given the alpha.
#' @export
#'
#' @examples
#'
#' x <- rnorm(100)
#'
#' stat_normality(x)

stat_normality <- function(x,alpha = 0.05, digits = NULL,print = FALSE){

  stop_function(arg = x,type = "numeric",length_bigger = 7)

  stop_function(arg = alpha,type = "numeric",single_value = TRUE,range = c(0,1))

  stop_function(arg = digits,type = "integer",single_value = TRUE,null = TRUE)

  stop_function(arg = print,type = "logical",single_value = TRUE)

  output <-
    dplyr::bind_rows(
      broom::glance(stats::ks.test(x = x, "pnorm",mean(x),stats::sd(x))),
      broom::glance(stats::shapiro.test(x = x)),
      broom::glance(nortest::ad.test(x = x)),
      broom::glance(nortest::cvm.test(x = x)),
      broom::glance(nortest::lillie.test(x = x)),
      broom::glance(nortest::pearson.test(x = x)),
      broom::glance(nortest::sf.test(x = x))
    ) %>%
    dplyr::select(test = method,statistic,p_value = p.value) %>%
    dplyr::mutate(
      test = sub(x = test,pattern = " test",""),
      test = sub(x = test,pattern = " normality",""),
      test = sub(x = test,pattern = "One-sample ","")
    ) %>%
    dplyr::arrange(test) %>%
    dplyr::mutate(is_normal = p_value > alpha)

  if(!is.null(digits)){
    output <-
      output %>%
      dplyr::mutate(
        dplyr::across(
          .cols = c(statistic,p_value),
          .fns = ~round(x = .,digits = digits)
        )
      )
  }

  if(print){
    output %>%
      dplyr::select(-is_normal) %>%
      gt::gt() %>%
      gt::cols_align(
        align = c("center"),
        columns = c("statistic","p_value")
      ) %>%
      gt::cols_label(
        test = "Test",
        statistic = "Statistic",
        p_value = "P-value"
      )
  }else{
    return(output)
  }
}
