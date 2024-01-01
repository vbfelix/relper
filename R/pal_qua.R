#' List of palettes
#' @export

pals_qua <- list(

  berlim = c("#0A6D68","#BF2E23","#735738","#CDAE07","#161C15"),

  blue_eye_samurai = c("#214442","#0C696D","#45ABAF","#EBAE5B","#E7422A","#7D2D1E"),

  bojack_horseman =
    c("#EB636B","#9E674C", "#FAC877", "#9464A2","#3C2533"),

  cowboy_bebop =
    c("#1B5260", "#CA301D", "#B7B5A4", "#612023","#219EBF"),

  doctor_who =
    c("#DA4327", "#15406B", "#F8CE6F", "#6F3C37","#C69ABE", "#F79336"),

  elemental =
    c("#f4230c", "#35b2fc", "#286e2b","#886fd9","#ec6a15","#56f1c6"),

  final_space =
    c("#9FFA6F", "#AC1132", "#EDDD30", "#F5D9D2"),

  gurren_lagann =
    c("#9F2B2E", "#424F91", "#F27137", "#DA70C1", "#89646A"),

  heartstopper =
    c("#41A99B","#F7CC99","#103336","#C79274","#A2E0E6"),

  kaleidoscope =
    c("#92313c","#247ebd","#db904f","#5eb05b","#9063c0","#f6ec79","#1a2545"),

  kick_ass =
    c("#F3DD42","#654B6D","#1F8163","#763B16","#A1A289","#040303"),

  killers_flower_moon =
    c("#B0456E","#AE8E6C","#53417A","#DFC8CF","#141633"),

  legion =
    c("#E6318A", "#DAC856","#15729E", "#F8A525", "#625E3C", "#992A89","#F7743D", "#A87040", "#A52830"),

  mario_bros =
    c("#f11e15","#0dd105","#fd4ab5","#0c8cfa","#ffde15","#8310bf","#a3431b"),

  moonlight =
    rev(c("#6B4A83","#17647D","#332E5A","#04BEB8","#8BB0DA")),

  ms_marvel =
    c("#4D2B5A","#52B054","#E3DE38","#DB3D52","#E2BF95","#270D23"),

  omitb =
    c("#A98A1B", "#385A4B", "#911304", "#CDB283","#26211C"),

  pulp_fiction =
    c("#483F5C", "#D5272B", "#847298", "#DD6652", "#E1CAD9", "#F7CF62"),

  red_dead =
    c("#C80710","#080202","#FCA208","#78645C","#FCA208","#E0AC8B"),

  rick_and_morty =
    c("#1A1D3C", "#488A4F", "#F5C7AB", "#D2D964", "#EB8827", "#249FB5","#945B43", "#8DBF4D"),

  ted_lasso =
    c("#094895","#6EA540","#AF453B","#C4AF9C","#596172"),

  this_is_us =
    c("#2E2C33", "#E1AE1D", "#614330", "#968A82", "#E4B999"),

  versace =
    c("#092391","#E87539","#982B52","#FCCE30","#763AA0","#520E34","#F8BD72","#DD518F"),

  ww84 =
    c("#942415","#15D374","#241210","#E8D025","#BE737B","#86EDC9"),

  young_sheldon =
    c("#C51C1E","#3D6B5C","#CB9041","#51828B","#8C4D32")

)

#' Palettes for qualitative scale
#'
#' @description Palettes for a qualitative scale, with the following palettes:
#'  \cr
#'  \cr - berlim: 5 colors, inspired by the TV series Berlim.
#'  \cr - blue_eye_samurai: 6 colors, inpired by the TV series Blue Eye Samurai.
#'  \cr - bojack_horseman: 5 colors, inspired by the animation BoJack Horseman.
#'  \cr - cowboy_bebop: 5 colors, inspired by the animation Cowboy Bebop.
#'  \cr - doctor_who: 6 colors, inspired by the TV series Doctor Who.
#'  \cr - elemental: 6 colors, inspired by the movie Elemental.
#'  \cr - final_space: 4 colors, inspired by the animation Final Space.
#'  \cr - gurren_lagann: 5 colors, inspired by the animation Tengen Toppa Gurren-Lagann.
#'  \cr - heartstopper: 5 colors, inspired by the TV series Heartstopper.
#'  \cr - kaleidoscope: 7 colors, inspired by the TV series Kaleidoscope.
#'  \cr - kick_ass: 6 colors, inspired by the movie Kick-ass.
#'  \cr - killers_flower_moon: 5 colors, inspired byt the movie Killers of the Flower Moon.
#'  \cr - legion: 9 colors, inspired by the TV series Legion.
#'  \cr - mario_bros: 7 colors, inspired by the movie The Super Mario Brothers.
#'  \cr - moonlight: 5 colors, inspired by the movie Moonlight.
#'  \cr - ms_marvel: 6 colors, inspired by the TV Series Ms Marvel.
#'  \cr - omitb: 5 colors, inspired by the TV series Only Murders in the Building.
#'  \cr - pulp_fiction: 8 colors, inspired by the movie Pulp Fiction.
#'  \cr - red_dead: 6 colors, inspired by the video game Red Dead Redemption.
#'  \cr - rick_and_morty: 8 colors, inspired by the animation Rick and Morty.
#'  \cr - ted_lasso: 5 colors, inspired by the TV series Ted Lasso.
#'  \cr - this_is_us: 5 colors, inspired by the TV series This is Us.
#'  \cr - versace: 8 colors, inspired by the TV series Versace.
#'  \cr - ww84: 6 colors, inspired by the movie Wonder Woman 84.
#'  \cr - young_sheldon: 5 colors, inspired by the Tv series Young Sheldon.
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
#' scales::show_col(pal_qua("this_is_us"))
#'


pal_qua <-
  function(
    name = "young_sheldon",
    reverse = FALSE
    ){

    stopifnot(is.character(name), length(name) == 1)

    stopifnot(is.logical(reverse), length(reverse) == 1)

    output <- pals_qua[[name]]

    stopifnot(is.character(output))

    if(reverse){output <- rev(output)}

    return(output)

  }


