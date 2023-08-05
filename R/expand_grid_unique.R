#' All combinations of inputs without repetitions
#'
#' @description Create a data frame from all combinations of the supplied vectors,
#'  without considering repetitions.
#'
#' @eval arg_vector("x","")
#' @eval arg_vector("y","")
#' @eval arg_boolean("include_equals","ignore the equal pairs")
#'
#' @return A tibble with all the combinations of x and y.
#'
#' @export
#'
#' @examples
#'
#' expand_grid_unique(x = 1:3,y = 1:3)
#'
#' expand_grid_unique(x = 1:3,y = 1:3,include_equals = TRUE)
#'

expand_grid_unique <-
  function(x, y, include_equals = FALSE){

  stopifnot(is.logical(include_equals))

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
