# relper 3 (Calculations all the way)

To improve data analysis, I added functions that compute metrics and other calculations.

## 3.6.7

-   Addition of the parameter `prefix` to the function `dttm_vars`.

## 3.5.0

-   Addition of the function `stat_missing_values`.

## 3.4.0

-   Addition of the function `str_extract_char`.

## 3.3.0

-   Addition of the function `palette_two`.

## 3.2.0

-   Addition of the function `plt_regression_line`.

## 3.1.7

-   Addition of the function `calc_error`.

## 3.0.0

-   Addition of the function `calc_association`.

-   Addition of the function `calc_correlation`.

-   Addition of the function `calc_kurtosis`.

-   Addition of the function `calc_modality`.

-   Addition of the function `calc_skewness`.

-   Addition of the function `is_weekend`.

-   Addition of the function `stat_normality`.

-   Addition of the function `summary_xy`.

-   Renaming of the function `calc_date_aux()` to `dttm_vars`.

-   Renaming of the function `calc_date_diff()` to `dttm_diff`.

# relper 2 (New colors)

I developed a new type of function called `palette_` that contains palettes inspired by movies and TV shows, as well as other functions that improve plot visualization.

## 2.2.0

-   Addition of the function `plt_scale_y_mirror`.

## 2.1.0

-   Addition of more steps to the function `as_num`, such as removing characters.

-   Addition of the dataset `vfx_watermark_white`.

## 2.0.0

-   Addition of the functions `palette_`.

# relper 1 (Rebirth)

I refactored the entire package in this version to use better development practices, such as: vignettes, documentation for all functions, standard naming and unit tests.

## 1.2.0

**Removal:**

-   Datasets: `df_month` and `df_week`.

-   Dependencies: `png`.

-   Functions: `summary_data`.

**Addition:**

-   Dependencies: `glue`, `rlang`, `scales` and `tidyselect`.

-   Documentation: `vfx_watermark`.

## 1.1.0

-   Changed `str_to_abb` argument `n_char` to `n_abb`.

## 1.0.1

-   Added vignettes.
