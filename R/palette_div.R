#' Palettes for divergent scale
#'
#' @description Palette for a divergent scale, with the following palettes:
#'  \cr
#'  \cr - arcane: 5 colors, inspired by the animation Arcane.
#'  \cr - casa_de_papel: 7 colors, inspired by the TV series La Casa de Papel.
#'  \cr - racionais: 7 colors, inspired by the CD cover
#'  'Nada Como Um Dia Após o Outro Dia' of the brazilian rap group Racionais MC's.
#'  \cr - sandman: 5 colors, inspired by the graphic novel Sandman.
#'  \cr - the_americans: 7 colors, inspired by the TV series The Americans.
#'  \cr - the_expanse: 8 colors, inspired by the TV series The Expanse.
#'  \cr - vox_machina: 7 colors, inspired by the animation The Legend of Vox Machina.
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
#' palette_example(palette = palette_div(name = "sandman"))
#'


palette_div <-
  function(
    name = c("arcane","casa_de_papel","racionais","sandman","the_americans","the_expanse","vox_machina"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    arcane <-
      rgb(maxColorValue = 255,
          red   = c(125,150,190,058,043),
          green = c(084,125,166,092,053),
          blue  = c(073,110,152,108,072)
      )

    casa_de_papel <-
      rgb(maxColorValue = 255,
          red   = c(107,184,179,212,148,084,053),
          green = c(054,060,130,193,169,106,069),
          blue  = c(043,054,098,160,148,087,059)
      )

    racionais <-
      rgb(maxColorValue = 255,
          red   = c(062,117,154,219,133,082,054),
          green = c(044,071,131,200,191,152,111),
          blue  = c(042,046,101,151,228,213,193)
      )

    sandman <-
      rgb(maxColorValue = 255,
        red   = c(135,183,225,167,112),
        green = c(100,144,198,183,172),
        blue  = c(083,107,136,158,160)
      )

    the_americans <-
      rgb(maxColorValue = 255,
          red   = c(135,208,234,248,009,043,015),
          green = c(019,015,142,206,168,136,043),
          blue  = c(007,005,015,029,223,170,119)
      )

    the_expanse <-
      rgb(maxColorValue = 255,
          red   = c(082,169,179,214,230,157,097,062),
          green = c(028,054,109,162,235,183,119,075),
          blue  = c(021,036,076,129,228,186,126,079)
      )

    vox_machina <-
      rgb(maxColorValue = 255,
          red   = c(073,116,177,205,181,158,121),
          green = c(057,103,137,186,204,173,145),
          blue  = c(083,118,139,178,222,186,162)
      )

    name <- match.arg(name)

    orig <- eval(parse(text = name))

    n <- length(orig)

    if(reverse){orig <- rev(orig)}

    palette_create(n = n,orig = orig)

  }

# palette_vignette(palette_div)


