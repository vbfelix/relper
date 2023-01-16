#' Palettes for sequential scale
#'
#' @description Palettes for a sequential scale, with the following palettes:
#'  \cr
#'  \cr - andor: 6 colors, inspired by the TV series Andor (Star Wars).
#'  \cr - breaking_bad: 5 colors, inspired by the TV series Breaking Bad.
#'  \cr - cyberpunk: 5 colors, inspired by the videogame Cyberpunk 2077.
#'  \cr - fleabag: 6 colors, inspired by the TV series Fleabag.
#'  \cr - loki: 7 colors, inspired by the TV series Loki.
#'  \cr - raised_by_wolves: 6 colors, inspired by the TV series Raised by Wolves.
#'  \cr - sucession: 6 colors, inspired by the TV series Sucession.
#'
#' @eval arg_vector("name","character",action = "is the pallete name")
#' @eval arg_boolean("reverse",action = "reverse the pallete order")
#'
#' @return A character vector with the colors hex codes.
#'
#' @export
#'
#' @examples
#'
#' palette_example(palette = palette_seq(name = "cyberpunk"))
#'


palette_seq <-
  function(
    name = c("andor","breaking_bad","cyberpunk",
             "fleabag","loki","raised_by_wolves","sucession"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    andor <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(229,214,209,173,115,068),
          green = c(205,150,111,071,053,056),
          blue  = c(181,095,058,039,039,058)
      )

    breaking_bad <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(188,127,087,140,197),
          green = c(196,140,100,134,187),
          blue  = c(154,094,055,025,043)
      )

    cyberpunk <-
       grDevices::rgb(maxColorValue = 255,
        red   = c(197,197,101,074,030),
        green = c(177,103,069,035,014),
        blue  = c(227,169,185,106,036)
      )

    fleabag <-
      grDevices::rgb(maxColorValue = 255,
                     red   = c(223,211,162,125,074,027),
                     green = c(189,140,092,051,012,011),
                     blue  = c(139,082,072,035,013,049)
      )

    loki <-
      grDevices::rgb(maxColorValue = 255,
                     red   = c(237,227,207,167,131,107,075),
                     green = c(216,181,152,120,089,062,038),
                     blue  = c(195,128,084,082,060,031,019)
      )

    raised_by_wolves <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(233,194,157,105,067,012),
          green = c(213,180,146,128,104,020),
          blue  = c(149,118,092,101,087,011)
      )

    sucession <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(228,197,159,135,101,072),
          green = c(217,170,133,101,075,052),
          blue  = c(195,146,113,078,055,038)
      )

    name <- match.arg(name)

    orig <- eval(parse(text = name))

    n <- length(orig)

    if(reverse){orig <- rev(orig)}

    palette_create(n = n,orig = orig)

  }

# palette_vignette(palette_seq)

