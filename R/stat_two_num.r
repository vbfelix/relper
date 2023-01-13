#' Summary table for comparative analysis between two numeric variables
#'
#' @description Create a summary table with t.test: statistic, p-value and IC(95%).
#'
#' @eval arg_df("df")
#' @eval arg_df_var("grp_var","character")
#' @param num_vars One or more variables from a data.frame
#' @param method Method of summary and test (default = 'auto')
#'
#' @return A gt table.
#'
#' @export
#'
#' @examples
#'
#'set.seed(123);df <-
#'  data.frame(
#'    grp_var = sample(paste("group", letters[1:2]),size = 100,replace = TRUE),
#'    num_var1 = rnorm(100),
#'    num_var2 = rpois(100,2),
#'    num_var3 = rexp(100,2),
#'   num_var4 = abs(rnorm(100))
#'  )
#'
#'stat_two_num(df,grp_var,c(num_var1,num_var2,num_var3,num_var4),method = c("mean","median","median","mean"))



stat_two_num <-
  function(
    df,
    grp_var,
    num_vars,
    method = "auto"
  ){

    stop_function(arg = df,type = "dataframe")

    stop_function(arg = method,type = "character")

    # utils -------------------------------------------------------------------

    format_metric <- function(x,y){
      paste0(
        relper::format_num(x, decimal_mark = ".",thousand_mark = ","),
        " (",
        relper::format_num(y, decimal_mark = ".",thousand_mark = ","),
        ")"
      )
    }

    test_comparison <-
      function(df,method){
        if(method == "mean"){
          out <- broom::tidy(t.test(formula = value ~ grp_var,data = df))
        }else{
          out <- broom::tidy(wilcox.test(formula = value ~ grp_var,data = df,conf.level = .95,conf.int = TRUE))
        }
        out %>%
          dplyr::mutate(
            statistic = relper::format_num(statistic, digits = 3, decimal_mark = ".",thousand_mark = ","),
            p_value = dplyr::if_else(
              condition = p.value < 0.001,
              true =  "<0.001",
              false = relper::format_num(p.value,digits = 4, decimal_mark = ".",thousand_mark = ",")
            ),
            IC = paste0(
              "(",
              relper::format_num(conf.low,3, decimal_mark = ".",thousand_mark = ","),
              "; ",
              relper::format_num(conf.high,3, decimal_mark = ".",thousand_mark = ","),
              ")")
          ) %>%
          dplyr::select(statistic,p_value,IC)

      }


# pivot data --------------------------------------------------------------

    pivotted_data <-
      df %>%
      dplyr::select(grp_var = {{grp_var}},{{num_vars}}) %>%
      dplyr::add_count(grp_var) %>%
      dplyr::mutate(
        grp_var = paste0(
          grp_var,
          " n = ",
          relper::format_num(n,digits = 0, decimal_mark = ".",thousand_mark = ","))
      ) %>%
      dplyr::select(-n) %>%
      tidyr::pivot_longer(cols = -grp_var)

# method ------------------------------------------------------------------


    method <- tolower(method)

    if(sum(!(method %in% c("mean","median","auto"))) > 0 ){
      stop("'method' must be 'mean', 'median' or 'auto'.")
    }

    if(length(method) == 1 & sum(method %in% "auto") > 0 ){
      methods_df <-
        pivotted_data %>%
        dplyr::group_by(name) %>%
        dplyr::summarise(p_value = shapiro.test(value)$p.value) %>%
        dplyr::mutate(
          method = if_else(p_value < 0.05,"median","mean")
        ) %>%
        dplyr::ungroup() %>%
        dplyr::select(-p_value)
    }else{
      methods_df <-
        data.frame(
          name = df %>%
            select({{num_vars}}) %>%
            # select(-grp_var) %>%
            names(),
          method = method
        )
    }

    pivotted_data <-
      pivotted_data %>%
      dplyr::left_join(methods_df)

    # footnote ----------------------------------------------------------------

    mean_footnote <- "Mean (SD) - Student's t-test"

    median_footnote <- "Median (IQR) - Wilcoxon test"

    methods <- methods_df %>% pull(method)

    if( sum(methods %in% "mean") > 0  & sum(methods %in% "median") > 0 ){
      gt_footnote <-
        function(df){
          gt::tab_footnote(
            data = df,
            footnote = mean_footnote,
            locations = gt::cells_body(
              columns = name,
              rows = which(methods_df$method == "mean")
            )
          ) %>%
            gt::tab_footnote(
              data = .,
              footnote = median_footnote,
              locations = gt::cells_body(
                columns = name,
                rows = which(methods_df$method == "median")
              )
            )
        }
    }
    if( sum(methods %in% "mean") > 0  & sum(methods %in% "median") == 0 ){
      gt_footnote <-
        function(df){
          gt::tab_footnote(
            data = df,
            footnote = mean_footnote,
            locations = gt::cells_column_labels(
              columns = name
            )
          )
        }
    }
    if( sum(methods %in% "mean") == 0 & sum(methods %in% "median") > 0 ){
      gt_footnote <-
        function(df){
          gt::tab_footnote(
            data = df,
            footnote = median_footnote,
            locations = gt::cells_column_labels(
              columns = name
            )
          )
        }
    }


    # table -------------------------------------------------------------------


    pivotted_data %>%
      dplyr::group_by(grp_var,name,method) %>%
      dplyr::summarise(
        mean = mean(value,na.rm = TRUE),
        sd = sd(value,na.rm = TRUE),
        median = median(value,na.rm = TRUE),
        iqr = IQR(value,na.rm = TRUE)
      ) %>%
      dplyr::mutate(
        label = dplyr::case_when(
          method == "mean" ~ format_metric(mean,sd),
          method == "median" ~ format_metric(median,iqr)
        )
      ) %>%
      dplyr::select(grp_var,name,label) %>%
      tidyr::pivot_wider(names_from = grp_var,values_from = label) %>%
      dplyr::left_join(
        pivotted_data %>%
          tidyr::nest(data = c(grp_var, value)) %>%
          dplyr::group_by(data) %>%
          dplyr::mutate(
            t_test = purrr::map(
              .x = data,
              .y = method,
              .f = ~test_comparison(df = .x,method = .y)#broom::tidy(t.test(formula = value ~ grp_var,data = x))
            )
          ) %>%
          dplyr::ungroup() %>%
          tidyr::unnest(t_test) %>%
          dplyr::select(-data,-method)
      )%>%
      dplyr::ungroup() %>%
# gt ----------------------------------------------------------------------
      gt::gt() %>%
      gt::cols_align(
        align = c("center"),
        columns = dplyr::everything()
      ) %>%
      gt_footnote(df = .) %>%
      gt::cols_label(
        statistic = "Statistic",
        p_value = "P-value",
        IC = "CI (95%)",
        name = "Variables"
      ) %>%
      gt::cols_width(
        name ~ px(120),
        IC ~ px(120),
        statistic ~ px(100),
        dplyr::everything() ~ px(70)
      )

  }



