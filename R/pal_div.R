#' List of palettes
#' @export

pals_div <- list(

  arcane =
    c("#7D5449", "#967D6E", "#BEA698", "#3A5C6C", "#2B3548"),

  auto_compadecida =
    c("#5D5D4B","#8E8A76","#C2B09F","#E0A71C","#C76E4A","#A13D20"),

  blue_eye_samurai = c("#214442","#0C696D","#45ABAF","#EBAE5B","#E7422A","#7D2D1E"),

  casa_de_papel =
    c("#6B362B", "#B83C36", "#B38262", "#D4C1A0", "#94A994", "#546A57","#35453B"),

  deadly_class =
    c("#552643", "#A03663", "#AD849C", "#E1B7C2", "#5C5A8A", "#16275D"),

  dexter =
    c("#046382","#12A6C5","#6CC9DE","#EAE0CF","#C69369","#7D3728"),

  godzilla_vs_kong =
    c("#1F191A","#25403F","#2D7A73","#44B4AC","#A0CBBA","#D9996E","#E45A2E","#BB2F10","#6F2014"),

  good_place =
    c("#1C262B","#275D86","#237EB9","#8BA8C1","#E4E8E0","#F1DAA1","#F8D26E","#B08D3F","#775B24"),

  homeland =
    c("#31302D","#655B4D","#8C8274","#B9A791","#D2C5BE","#91B3C7","#7096AC","#4E7890","#3D5460"),

  laura_dean =
    rev(c("#483A3A","#8A6253","#AB8B78","#DBA08B","#F8E8E5","#F5C9CD","#F1A4B1","#DB5E69")),

  racionais =
    c("#3E2C2A", "#75472E", "#9A8365", "#DBC897", "#85BFE4", "#5298D5","#366FC1"),

  sandman =
    c("#876453", "#B7906B", "#E1C688", "#A7B79E", "#70ACA0"),

  scott_pilgrim =
    c("#86141E","#A5262D","#E0413B","#CBA298","#A17267","#5B2E23"),

  the_americans =
    c("#871307", "#D00F05", "#EA8E0F", "#F8CE1D", "#09A8DF", "#2B88AA","#0F2B77"),

  the_expanse =
    c("#521C15", "#A93624", "#B36D4C", "#D6A281", "#E6EBE4", "#9DB7BA","#61777E", "#3E4B4F"),

  the_marvels =
    c("#0C0390","#3F069A","#730AA4","#B43252","#F65B01","#B83601","#7B1102"),

  vox_machina =
    c("#493953", "#746776", "#B1898B", "#CDBAB2", "#B5CCDE", "#9EADBA","#7991A2"),

  wanda_vision =
    c("#501715", "#8F2A1F", "#C14E3E", "#E59177", "#DFCBCC", "#956E83","#266288", "#213E5E", "#181F38"),

  white_lotus =
    c("#486558","#7C836D","#A2A683","#E4DBB1","#F6F2C9","#D1B98F","#C57B69","#934241")

)

#'
#' Palettes for divergent scale
#'
#' @description Palette for a divergent scale, with the following palettes:
#'  \cr
#'  \cr - arcane: 5 colors, inspired by the animation Arcane.
#'  \cr - auto_compadecida: 6 colors, inspired by the movie O Auto da Compadecida.
#'  \cr - blue_eye_samurai: 6 colors, inpired by the TV series Blue Eye Samurai.
#'  \cr - casa_de_papel: 7 colors, inspired by the TV series La Casa de Papel.
#'  \cr - deadly_class: 6 colors, inspired by the TV series Deadly Class.
#'  \cr - dexter: 6 colors, inspired by the TV series Dexter.
#'  \cr - godzilla_vs_kong: 9 colors, inspired by the movie Godzilla vs Kong.
#'  \cr - good_place: X colors, inspired by the TV series The Good Place.
#'  \cr - homeland: 9 colors, inspired by the TV series Homeland.
#'  \cr - laura_dean: 8 colors, inspired by the graphic novel Laura Dean Keeps Breaking Up with Me.
#'  \cr - racionais: 7 colors, inspired by the CD cover
#'  'Nada Como Um Dia Após o Outro Dia' of the brazilian rap group Racionais MC's.
#'  \cr - sandman: 5 colors, inspired by the graphic novel Sandman.
#'  \cr - svott_pilgrim: 6 colors, inspired by the movie Scott Pilgrim vs the World.
#'  \cr - the_americans: 7 colors, inspired by the TV series The Americans.
#'  \cr - the_expanse: 8 colors, inspired by the TV series The Expanse.
#'  \cr - the_marvels: 7 colors, inspired by the movie The Marvels.
#'  \cr - vox_machina: 7 colors, inspired by the animation The Legend of Vox Machina.
#'  \cr - wanda_vision: 9 colors, inspired by the TV series WandaVision.
#'  \cr - white_lotus: 8 colors, inspired by the TV series The White Lotus.
#'
#' @eval arg_value("name","character",action = "is the pallete name")
#' @eval arg_boolean("reverse",action = "reverse the pallete order")
#' @eval arg_boolean("show_palettes",action = "export the names of all the palettes")
#'
#' @return A character vector with the colors hex codes.
#'
#' @export
#'
#' @examples
#'
#' scales::show_col(pal_div("sandman"))
#'


pal_div <-
  function(
    name = "young_sheldon",
    reverse = FALSE,
    show_palettes = FALSE
  ){

    stopifnot(is.character(name), length(name) == 1)

    stopifnot(is.logical(reverse), length(reverse) == 1)

    stopifnot(is.logical(show_palettes), length(show_palettes) == 1)

    if(show_palettes){

      output <- names(pals_div)

    }else{
      output <- pals_div[[name]]

      stopifnot(is.character(output))

      if(reverse){output <- rev(output)}
    }

    return(output)

  }



