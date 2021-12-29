#' expand_grid without repetition
#'
#' @description
#'
#' @param x
#' @param y
#'
#' @return
#' @export
#'
#' @examples
#'
#'

expand_grid_unique <- function(x, y, include_equals = FALSE)
{
  x <- unique(x)
  y <- unique(y)
  g <- function(i)
  {
    z <- setdiff(y, x[seq_len(i-include_equals)])

    if(length(z)) cbind(x[i], z, deparse.level=0)
  }
  do.call(rbind, lapply(seq_along(x), g)) %>%
    dplyr::as_tibble()
}
