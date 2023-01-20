#' Palettes for divergent scale
#'
#' @description Palette for a divergent scale, with the following palettes:
#'  \cr
#'  \cr - arcane: 5 colors, inspired by the animation Arcane.
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
#'  \cr - vox_machina: 7 colors, inspired by the animation The Legend of Vox Machina.
#'  \cr - wanda_vision: 9 colors, inspired by the TV series WandaVision.
#'  \cr - white_lotus: 8 colors, inspired by the TV series The White Lotus.
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
    name = c("arcane","casa_de_papel","deadly_class","dexter","godzilla_vs_kong","good_place",
             "homeland",
             "laura_dean","racionais","sandman","scott_pilgrim",
             "the_americans","the_expanse","vox_machina","wanda_vision","white_lotus"),
    reverse = FALSE
    ){

    stop_function(arg = name,type = "character",single_value = TRUE)

    stop_function(arg = reverse,type = "logical",single_value = TRUE)

    arcane <-
      c("#7D5449", "#967D6E", "#BEA698", "#3A5C6C", "#2B3548")

    casa_de_papel <-
      c("#6B362B", "#B83C36", "#B38262", "#D4C1A0", "#94A994", "#546A57","#35453B")

    deadly_class <-
      c("#552643", "#A03663", "#AD849C", "#E1B7C2", "#5C5A8A", "#16275D")

    dexter <-
      c("#046382","#12A6C5","#6CC9DE","#EAE0CF","#C69369","#7D3728")

    godzilla_vs_kong <-
      c("#1F191A","#25403F","#2D7A73","#44B4AC","#A0CBBA","#D9996E","#E45A2E","#BB2F10","#6F2014")

    good_place <-
      c("#1C262B","#275D86","#237EB9","#8BA8C1","#E4E8E0","#F1DAA1","#F8D26E","#B08D3F","#775B24")

    homeland <-
      c("#31302D","#655B4D","#8C8274","#B9A791","#D2C5BE","#91B3C7","#7096AC","#4E7890","#3D5460")

    laura_dean <-
      rev(c("#483A3A","#8A6253","#AB8B78","#DBA08B","#F8E8E5","#F5C9CD","#F1A4B1","#DB5E69"))

    racionais <-
      c("#3E2C2A", "#75472E", "#9A8365", "#DBC897", "#85BFE4", "#5298D5",
        "#366FC1")

    sandman <-
      c("#876453", "#B7906B", "#E1C688", "#A7B79E", "#70ACA0")

    scott_pilgrim <-
      c("#86141E","#A5262D","#E0413B","#CBA298","#A17267","#5B2E23")

    the_americans <-
      c("#871307", "#D00F05", "#EA8E0F", "#F8CE1D", "#09A8DF", "#2B88AA",
        "#0F2B77")

    the_expanse <-
      c("#521C15", "#A93624", "#B36D4C", "#D6A281", "#E6EBE4", "#9DB7BA",
        "#61777E", "#3E4B4F")

    vox_machina <-
      c("#493953", "#746776", "#B1898B", "#CDBAB2", "#B5CCDE", "#9EADBA",
                     "#7991A2")

    wanda_vision <-
      c("#501715", "#8F2A1F", "#C14E3E", "#E59177", "#DFCBCC", "#956E83",
        "#266288", "#213E5E", "#181F38")

    white_lotus <-
      c("#486558","#7C836D","#A2A683","#E4DBB1","#F6F2C9","#D1B98F","#C57B69","#934241")

    output <- eval(parse(text = match.arg(name)))

    if(reverse){output <- rev(output)}

    return(output)

  }

# palette_vignette(palette_div)


