#' expand_grid without repetition
#'
#' @description
#'
#' @param x numeric vector
#' @param y numeric vector
#' @param include_equals logical indicator to include equal pairs or not
#'
#' @return
#' @export
#'
#' @examples
#'
#' expand_grid_unique(x = 1:6,y = 1:8)
#'

expand_grid_unique <-
  function(x, y, include_equals = FALSE){

  if(!is.logical(include_equals)){stop("'include_equals' must be logical.")}

  x <- unique(x)

  y <- unique(y)

  g <- function(i)
  {
    z <- setdiff(y, x[seq_len(i-include_equals)])

    if(length(z)) cbind(x[i], z, deparse.level=0)
  }

  suppressWarnings(
    output <- do.call(rbind, lapply(seq_along(x), g)) %>%
      dplyr::as_tibble()
  )

  return(output)
}
