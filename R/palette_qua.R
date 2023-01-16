#' Palettes for qualitative scale
#'
#' @description Palettes for a qualitative scale, with the following palettes:
#'  \cr
#'  \cr - bojack_horseman: 5 colors, inspired by the animation BoJack Horseman.
#'  \cr - cowboy_bebop: 5 colors, inspired by the animation Cowboy Bebop.
#'  \cr - doctor_who: 5 colors, inspired by the TV series Doctor Who.
#'  \cr - final_space: 4 colors, inspired by the animation Final Space.
#'  \cr - gurren_lagann: 5 colors, inspired by the animation Tengen Toppa Gurren-Lagann.
#'  \cr - legion: 9 colors, inspired by the TV series Legion.
#'  \cr - omitb: 5 colors, inspired by the TV series Only Murders in the Building.
#'  \cr - pulp_fiction: 8 colors, inspired by the movie Pulp Fiction.
#'  \cr - rick_and_morty: 8 colors, inspired by the animation Rick and Morty.
#'  \cr - star_trek: 5 colors, inspired by the TV series Star Trek.
#'  \cr - this_is_us: 5 colors, inspired by the TV series This is Us.
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
#' palette_example(palette = palette_qua(name = "this_is_us"))
#'


palette_qua <-
  function(
    name = c("bojack_horseman","cowboy_bebop","doctor_who","final_space","gurren_lagann",
             "legion","omitb","pulp_fiction",
             "rick_and_morty","star_trek","this_is_us"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    bojack_horseman <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(158,148,250,235,060,222),
          green = c(103,100,200,099,037,097),
          blue  = c(076,162,119,107,051,146)
      )

    cowboy_bebop <-
       grDevices::rgb(maxColorValue = 255,
        red   = c(027,202,033,183,097),
        green = c(082,048,158,181,032),
        blue  = c(096,029,191,164,035)
      )

    doctor_who <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(029,218,021,248,111,021,198,247),
          green = c(039,067,064,206,060,064,154,147),
          blue  = c(051,039,107,111,055,107,190,054)
      )

    final_space <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(159,172,237,245),
          green = c(250,017,221,217),
          blue  = c(111,050,048,210)
      )

    legion <-
      grDevices::rgb(maxColorValue = 255,
                     red   = c(230,218,248,021,098,153,247,168,165),
                     green = c(049,200,165,114,094,042,116,112,040),
                     blue  = c(138,086,037,158,060,137,061,064,048)
      )

    gurren_lagann <-
       grDevices::rgb(maxColorValue = 255,
        red   = c(159,066,242,218,137),
        green = c(043,079,113,112,100),
        blue  = c(046,145,055,193,106)
      )

    omitb <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(038,169,056,145,205),
          green = c(033,138,090,019,178),
          blue  = c(028,027,075,004,131)
      )

    pulp_fiction <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(072,213,132,221,225,247),
          green = c(063,039,114,102,202,207),
          blue  = c(092,043,152,082,217,098)
      )

    rick_and_morty <-
       grDevices::rgb(maxColorValue = 255,
        red   = c(026,072,245,210,235,036,148,141),
        green = c(029,138,199,217,136,159,091,191),
        blue  = c(060,079,171,100,039,181,067,077)
      )

    star_trek <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(016,204,036,189,218,108,130,142),
          green = c(013,047,046,116,196,106,061,156),
          blue  = c(027,088,081,116,192,135,076,181)
      )

    this_is_us <-
       grDevices::rgb(maxColorValue = 255,
          red   = c(046,225,097,150,228),
          green = c(044,174,067,138,185),
          blue  = c(051,029,048,130,153)
      )

    name <- match.arg(name)

    orig <- eval(parse(text = name))

    n <- length(orig)

    if(reverse){orig <- rev(orig)}

    palette_create(n = n,orig = orig)

  }

# palette_vignette(palette_qua)


