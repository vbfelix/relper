#' Palettes for qualitative scale
#'
#' @description Palettes for a qualitative scale, with the following palettes:
#'  \cr
#'  \cr - bojack_horseman: 5 colors, inspired by the animation BoJack Horseman.
#'  \cr - cowboy_bebop: 5 colors, inspired by the animation Cowboy Bebop.
#'  \cr - doctor_who: 5 colors, inspired by the TV series Doctor Who.
#'  \cr - final_space: 4 colors, inspired by the animation Final Space.
#'  \cr - gurren_lagann: 5 colors, inspired by the animation Tengen Toppa Gurren-Lagann.
#'  \cr - homeland: 5 colors, inspired by the TV series Homeland.
#'  \cr - legion: 9 colors, inspired by the TV series Legion.
#'  \cr - moonlight: 6 colors, inspired by the movie Moonlight..
#'  \cr - omitb: 5 colors, inspired by the TV series Only Murders in the Building.
#'  \cr - pulp_fiction: 8 colors, inspired by the movie Pulp Fiction.
#'  \cr - red_dead: 6 colors, inspired by the video game Red Dead Redemption.
#'  \cr - rick_and_morty: 8 colors, inspired by the animation Rick and Morty.
#'  \cr - star_trek: 5 colors, inspired by the TV series Star Trek.
#'  \cr - this_is_us: 5 colors, inspired by the TV series This is Us.
#'  \cr - versace: 8 colors, inspired by the TV series Versace.
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
    name = c("bojack_horseman","cowboy_bebop",
             "doctor_who","final_space","gurren_lagann","homeland",
             "legion","omitb","moonlight","pulp_fiction","red_dead",
             "rick_and_morty","star_trek","this_is_us","versace"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    bojack_horseman <-
      c("#9E674C", "#9464A2", "#FAC877", "#EB636B", "#3C2533", "#DE6192")

    cowboy_bebop <-
      c("#1B5260", "#CA301D", "#219EBF", "#B7B5A4", "#612023")

    doctor_who <-
      c("#1D2733", "#DA4327", "#15406B", "#F8CE6F", "#6F3C37", "#15406B",
        "#C69ABE", "#F79336")

    final_space <-
      c("#9FFA6F", "#AC1132", "#EDDD30", "#F5D9D2")

    gurren_lagann <-
      c("#9F2B2E", "#424F91", "#F27137", "#DA70C1", "#89646A")

    homeland <-
      c("#A29088", "#515B98", "#905448", "#7A7982", "#42342E")

    legion <-
      c("#E6318A", "#DAC856", "#F8A525", "#15729E", "#625E3C", "#992A89",
        "#F7743D", "#A87040", "#A52830")

    moonlight <-
      rev(c("#6B4A83","#17647D","#332E5A","#04BEB8","#8BB0DA","#9074AF"))

    omitb <-
      c("#26211C", "#A98A1B", "#385A4B", "#911304", "#CDB283")

    pulp_fiction <-
      c("#483F5C", "#D5272B", "#847298", "#DD6652", "#E1CAD9", "#F7CF62")

    red_dead <-
      c("#C80710","#080202","#FCA208","#78645C","#FCA208","#E0AC8B")

    rick_and_morty <-
      c("#1A1D3C", "#488A4F", "#F5C7AB", "#D2D964", "#EB8827", "#249FB5",
        "#945B43", "#8DBF4D")

    star_trek <-
      c("#100D1B", "#CC2F58", "#242E51", "#BD7474", "#DAC4C0", "#6C6A87",
        "#823D4C", "#8E9CB5")

    this_is_us <-
      c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999")

    versace <-
      c("#092391","#982B52","#DD518F","#FCCE30","#763AA0","#520E34","#E87539","#F8BD72")


    output <- eval(parse(text = match.arg(name)))

    if(reverse){output <- rev(output)}

    return(output)

  }

# palette_vignette(palette_qua)

