#' Palettes with two constrast colors
#'
#' @description Palette with two constrast colors, with the following palettes:
#'  \cr
#'  \cr - boba_fett: Inspired by the TV series Boba Fett.
#'  \cr - blade_runner_2049: Inspired by the movie Blade Runner 2049.
#'  \cr - dear_white_people: Inspired by the TV series Dear White People.
#'  \cr - emily_in_paris: Inspired by the TV series Emily in Paris.
#'  \cr - good_omens: Inspired by the TV series Good Omens.
#'  \cr - hightown: Inspired by the TV series Hightown.
#'  \cr - jaws: Inspired by the movie Jaws.
#'  \cr - notorious: Inspired by the movie Notorious.
#'  \cr - saint_maud: Inspired by the movie Saint Maud.
#'  \cr - shirley: Inspired by the movie Shirley.
#'  \cr - spirited: Inspired by the movie Spirited.
#'  \cr - the_english: Inspired by the movie The English.
#'  \cr - the_expanse: Inspired by the TV series The Expanse.
#'  \cr - the_gilded_age: Inspired by the TV series The Gilded Age.
#'  \cr - the_help: Inspired by the movie The Help.
#'  \cr - titans: Inspired by the TV series Titans.
#'  \cr - watchmen: Inspired by the TV series Watchmen.
#'  \cr - winning_time: Inspired by the TV series Winning Time.
#'
#' @eval arg_value("name","character",action = "is the pallete name")
#' @eval arg_boolean("reverse",action = "reverse the pallete order")
#'
#' @return A character vector with the colors hex codes.
#'
#' @export
#'
#' @examples
#'
#' palette_example(palette = palette_two(name = "blade_runner_2049"))
#'


palette_two <-
  function(
    name = c(
      "boba_fett","blade_runner_2049","dear_white_people","emily_in_paris","good_omens","hightown",
      "jaws","notorius","saint_maud",
      "shirley","spirited","the_english","the_expanse","the_gilded_age","the_help","titans",
      "watchmen","winning_time"
    ),
    reverse = FALSE
    ){

    stopifnot(is.character(name), length(name) == 1)

    name <- match.arg(name)

    stopifnot(is.logical(reverse), length(reverse) == 1)

    boba_fett <- c("#537654","#c88220")

    blade_runner_2049 <- c("#ee3b2a","#01aca7")

    dear_white_people <- c("#52fcd6","#c66049")

    emily_in_paris <- c("#497e8a","#e7999f")

    good_omens <- c("#437183","#b93210")

    hightown <- c("#cf0e2a","#4f5764")

    jaws <- c("#c1090b","#3170ab")

    notorius <- c("#e7a71d","#4988ab")

    saint_maud <- c("#ed6044","#841525")

    shirley <- c("#807f3f","#f0dba4")

    spirited <- c("#2c6f4c","#aa0700")

    the_english <- c("#cd6c1b","#140f0b")

    the_expanse <- c("#9aa79d","#956b69")

    the_gilded_age <- c("#1c5340","#713a5c")

    the_help <- c("#7c56a1","#f6bb33")

    titans <- c("#b2224f","#096c91")

    watchmen <- c("#fbdf00","#03478b")

    winning_time <- c("#ffcc00","#552683")

    output <- eval(parse(text = match.arg(name)))

    if(reverse){output <- rev(output)}

    return(output)

  }

# palette_vignette(palette_two)


