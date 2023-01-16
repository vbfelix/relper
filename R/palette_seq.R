#' Palettes for sequential scale
#'
#' @description Palettes for a sequential scale, with the following palettes:
#'  \cr
#'  \cr - andor: 6 colors, inspired by the TV series Andor (Star Wars).
#'  \cr - badlands: 5 colors, inspired by the TV series Into the Badlands.
#'  \cr - breaking_bad: 5 colors, inspired by the TV series Breaking Bad.
#'  \cr - clockwork_orange: 8 colors, inspired by the movie Clockwork Orange.
#'  \cr - cyberpunk: 5 colors, inspired by the videogame Cyberpunk 2077.
#'  \cr - fleabag: 6 colors, inspired by the TV series Fleabag.
#'  \cr - house_md: 6 colors, inspired by the TV series House MD.
#'  \cr - house_of_cards: 7 colors, inspired by the TV series House of Cards.
#'  \cr - loki: 7 colors, inspired by the TV series Loki.
#'  \cr - lovecraft_country: 9 colors, inspired by the TV series Lovecraft Country.
#'  \cr - peaky_blinders: 8 colors, inspired by the TV Peaky Blinders.
#'  \cr - raised_by_wolves: 6 colors, inspired by the TV series Raised by Wolves.
#'  \cr - sabrina: 8 colors, inspired by the TV series Sabrina.
#'  \cr - sandman: 6 colors, inspired by the TV series Sandman.
#'  \cr - sucession: 6 colors, inspired by the TV series Sucession.
#'  \cr - the_wire: 6 colors, inspired by the TV series The Wire.
#'  \cr - tiger_king: 7 colors, inspired by the TV series Tiger King.
#'  \cr - westworld1: 7 colors, inspired by the TV series WestWorld.
#'  \cr - westworld2: 8 colors, inspired by the TV series WestWorld.
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
    name = c("andor","badlands","breaking_bad","clockwork_orange","cyberpunk",
             "fleabag","house_md","house_of_cards","loki","lovecraft_country","peaky_blinders","raised_by_wolves",
             "sabrina","sandman","sucession","the_wire","tiger_king","westworld1","westworld2"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    andor <-
      c("#E5CDB5", "#D6965F", "#D16F3A", "#AD4727", "#733527", "#44383A")

    badlands <-
      c("#E4ECED", "#C2B5BA", "#92717B", "#663747", "#131219")

    breaking_bad <-
      c("#BCC49A", "#7F8C5E", "#576437", "#8C8619", "#C5BB2B")

    clockwork_orange <-
      c("#DED4E4","#F4D0B1","#EAAA66","#EF8640","#EE531C","#A9542D","#593A2B","#33221B")

    cyberpunk <-
      c("#C5B1E3", "#C567A9", "#6545B9", "#4A236A", "#1E0E24")

    fleabag <-
      c("#DFBD8B", "#D38C52", "#A25C48", "#7D3323", "#4A0C0D", "#1B0B31")

    house_md <-
      c("#899FA4","#546D72","#324C56","#114D6A","#12232D","#080D13")

    house_of_cards <-
      c("#DBDBDC","#AFAFB3","#85878D","#64666C","#484B52","#29292C","#09090A")

    loki <-
      c("#EDD8C3", "#E3B580", "#CF9854", "#A77852", "#83593C", "#6B3E1F",
        "#4B2613")

    lovecraft_country <-
      c("#D6B8A0","#846751","#F18F15","#C95910","#9E3D0E","#7D270A","#5A1607","#31140D","#150805")

    peaky_blinders <-
      c("#F6F7E5","#D8DBBC","#B1BAA0","#8A9D87","#697C6D","#3F5148","#22322E","#0A1618")

    raised_by_wolves <-
      c("#E9D595", "#C2B476", "#9D925C", "#698065", "#436857", "#0C140B")

    sabrina <-
      c("#FAD0A9","#ECA172","#D06B44","#CD2E28","#903D2E","#AF0506","#510605","#090406")

    sandman <-
      c("#EDDBAC","#C8AD8B","#939696","#5C6B6E","#334347","#162026")

    sucession <-
      c("#E4D9C3","#C5AA92","#9F8571","#87654E","#654B37","#483426")

    the_wire <-
      c("#B0CFD6","#65B1CE","#4085B4","#2E5A90","#2A3B5D","#080A09")

    tiger_king <-
      c("#F6EED6","#D2987A","#F98707","#C6510D","#E32B0D","#5A170B","#1D0B08")

    westworld1 <-
      c("#F9D4B9","#F4AA96","#E7947E","#DD876B","#C07969","#724139","#3A1D1B")

    westworld2 <-
      c("#D0D0D5","#B9BAC2","#9EA1AB","#80848F","#676A75","#504952","#312A31","#761C20")

    output <- eval(parse(text = match.arg(name)))

    if(reverse){output <- rev(output)}

    return(output)

  }

# palette_vignette(palette_seq)
