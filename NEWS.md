# relper 3.0.0 (Calculations All The Way)

> *In this major release, `relper` enhances its data analysis capabilities with a powerful suite of functions for computing various metrics and calculations.*
>
> *These additions transform the package into a comprehensive "Data Insight Toolbox," empowering users to gain deeper insights and perform advanced analyses on their datasets. Additionally, some functions have been renamed for better clarity and consistency.*

**Additions**

-   Functions: `calc_association`,`calc_correlation`, `calc_kurtosis`, `calc_modality`, `calc_skewness`, `is_weekend`, `stat_normality` and `summary_xy`

**Improvements**

-   Renaming of the functions: `calc_date_aux()` to `dttm_vars` and `calc_date_diff()` to `dttm_diff`

## relper 3.1.7

**Additions**

-   Function `calc_error`

## relper 3.2.0

**Additions**

-   Function `plt_regression_line`

## relper 3.3.0

**Additions**

-   Function `palette_two`

## relper 3.4.0

**Additions**

-   Function `str_extract_char`

## relper 3.5.0

**Additions**

-   Function `stat_missing_values`

## relper 3.6.9

**Additions**

-   Parameter `prefix` to the function `dttm_vars`
-   Parameter `...` to the function `plt_scale_y_mirror` to apply the function `format_num` to the breaks labels

# relper 2.0.0 (Visual Delight)

> *In this major release, `relper` introduces a brand-new feature called `palette_`, that contains palettes inspired by movies and TV shows.*
>
> *The `palette_` functions provides users with a rich collection of color palettes carefully curated from popular films and television series, adding a touch of cinematic charm to their data visualizations.*
>
> *Whether it's evoking the nostalgic hues of a beloved classic or the vibrant colors of a contemporary blockbuster, `palette_` allows users to effortlessly infuse visual storytelling into their plots.*

**Additions**

-   Functions: `palette_`

## relper 2.1.0

**Additions**

-   Dataset `vfx_watermark_white`

**Improvements**

-   More steps to the function `as_num`, such as removing characters

## relper 2.2.0

**Additions**

-   Function `plt_scale_y_mirror`

# relper 1.0.0 (Rebirth)

> *The initial release of `relper` lays the groundwork for future development of the library.*
>
> *This version entails a complete refactoring of the entire package in order to comply with better development practices.*
>
> *Significant enhancements include the addition of vignettes to provide comprehensive usage examples, extensive documentation for all functions to assist developers in understanding the library's capabilities, the adoption of standard naming conventions for improved consistency, and the integration of comprehensive unit tests to ensure the codebase's reliability and stability.*

## relper 1.1.1

**Improvements**

-   Renaming of the function `str_to_abb` argument `n_char` to `n_abb`

## relper 1.2.0

**Additions**

-   Dependencies: `glue`, `rlang`, `scales` and `tidyselect`

-   Documentation: `vfx_watermark`

**Removals**

-   Datasets: `df_month` and `df_week`

-   Dependencies: `png`

-   Functions: `summary_data`
