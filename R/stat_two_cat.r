#' Summary table for comparative analysis between two categorical variables
#'
#' @description Create a frequency table with chi-square statistic, p-value, cramer's v.
#'
#' @eval arg_df("df")
#' @eval arg_df_var("grp_var","character")
#' @param vars One or more variables from a data.frame
#' @eval arg_value("filter","character",default = "''", action = "will be the value to filter the variables")
#'#'
#' @return A gt table.
#'
#' @export
#'
#' @examples
#'
#'
#' mtcars %>%
#'  dplyr::mutate(vs = paste0("vs = ",vs)) %>%
#'  stat_two_cat(grp_var = vs,vars = c(am,cyl))


stat_two_cat <-
  function(
    df,
    grp_var,
    vars,
    filter = ""
  ){

    stopifnot(is.data.frame(df))

    stopifnot(is.character(filter), length(filter) == 1)

    pivotted_data <-
      df %>%
      dplyr::select(grp_var = {{grp_var}},{{vars}}) %>%
      tidyr::pivot_longer(cols = -grp_var) %>%
      dplyr::filter(
        !is.na(grp_var),
        !is.na(value),
        value != filter,
        grp_var != filter
        )

    chi_square_test  <-
      pivotted_data %>%
      tidyr::nest(-name) %>%
      dplyr::mutate(
        id = 0,
        chi_square = purrr::map(.x = data,.f = ~stats::chisq.test(.$grp_var,.$value)),
        cramers_v = purrr::map(
          .x = data,
          .f = ~relper::calc_association(x = .$grp_var,y = .$value,type = "cramers-v")),
        chi_square = purrr::map(.x = chi_square,.f = broom::tidy)
      ) %>%
      tidyr::unnest(c(chi_square, cramers_v)) %>%
      dplyr::select(id,name,statistic,p_value = p.value,cramers_v) %>%
      dplyr::mutate(
        statistic = relper::format_num(statistic,digits = 4),
        p_value =  dplyr::if_else(p_value < 0.001,"<0.001",relper::format_num(p_value,digits = 4)),
        cramers_v =  relper::format_num(cramers_v,digits = 4)
      )

    pivotted_data %>%
      dplyr::count(name,grp_var,value) %>%
      dplyr::group_by(name,grp_var) %>%
      dplyr::add_count(name,wt = n,name = "N") %>%
      dplyr::mutate(
        perc = 100*n/N,
        n =  relper::format_num(n,0),
        N =  relper::format_num(N,0),
        perc =  relper::format_num(perc,2),
        label = stringr::str_c(perc, "% (",n,"/",N,")")
      ) %>%
      dplyr::select(-n,-N,-perc) %>%
      tidyr::pivot_wider(names_from = grp_var,values_from = label) %>%
      dplyr::group_by(name) %>%
      dplyr::mutate(id = dplyr::row_number()) %>%
      dplyr::ungroup() %>%
      dplyr::full_join(chi_square_test,by = c("name","id")) %>%
      dplyr::arrange(name,id) %>%
      dplyr::mutate(
        name = dplyr::if_else(id == 0,name,""),
        dplyr::across(.fns = ~dplyr::if_else(is.na(.),"-",as.character(.) ))
      ) %>%
      dplyr::select(-id) %>%
      gt::gt(rowname_col = "name") %>%
      gt::cols_align(
        align = c("center"),
        columns = tidyselect::everything()
      ) %>%
      gt::cols_label(
        statistic = "Statistic",
        p_value = "P-value",
        value = "Levels",
        cramers_v = "Cramer's V",
        name = "Variables"
      ) %>%
      gt::cols_width(
        name ~ px(120),
        statistic ~ px(100),
        cramers_v ~ px(90),
        tidyselect::everything() ~ px(70)
      )

  }

