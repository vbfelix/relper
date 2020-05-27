#' Data for a calendar plot
#'
#' @description Data for a calendar plot, from library ggcal
#'
#' @param dates vector of dates
#' @param fills numeric/character vector
#'
#' @return data.frame
#' @export
#'
#' @examples
#'
#' date <- seq(as.Date("2017-02-01"), as.Date("2017-07-22"), by="1 day")
#'
#' fill <- rnorm(length(date))
#'
#' cal_data(date,fill)
#'

cal_data <- function(dates, fills){

  months <-
    format(seq(as.Date("2016-01-01"), as.Date("2016-12-01"), by = "1 month"), "%B")

  mindate <- as.Date(format(min(dates), "%Y-%m-01"))

  maxdate <- (seq(as.Date(format(max(dates), "%Y-%m-01")), length.out = 2, by = "1 month") - 1)[2]

  filler <- dplyr::tibble(date = seq(mindate, maxdate, by = "1 day"))

  df1 <-
    dplyr::tibble(date = dates, fill = fills) %>%
    dplyr::right_join(filler, by = "date") %>%
    dplyr::mutate(dow = as.numeric(format(date,"%w"))) %>%
    dplyr::mutate(month = format(date, "%B")) %>%
    dplyr::mutate(woy = as.numeric(format(date,"%U"))) %>%
    dplyr::mutate(year = as.numeric(format(date, "%Y"))) %>%
    dplyr::mutate(month = factor(month, levels = months, ordered = TRUE)) %>%
    dplyr::arrange(year, month) %>%
    dplyr::mutate(monlabel = month)

  if (length(unique(df1$year)) > 1) {
    df1$monlabel <- paste(df1$month, df1$year)
  }

  out <-
    df1 %>%
    dplyr::mutate(monlabel = factor(monlabel, ordered = TRUE)) %>%
    dplyr::mutate(monlabel = forcats::fct_inorder(stringr::str_to_title(monlabel))) %>%
    dplyr::mutate(monthweek = woy - min(woy), y = max(monthweek) - monthweek + 1) %>%
    dplyr::mutate(wday = lubridate::wday(date,label = T, abbr = T)) %>%
    dplyr::rename(x = dow) %>%
    dplyr::select(-woy,-monthweek)

  levels(out$wday) <- stringr::str_to_title(levels(out$wday))

  return(out)

}

