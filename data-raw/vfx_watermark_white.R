## code to prepare `vfx_watermark_white` dataset goes here

vfx_watermark_white <- png::readPNG(file.path(getwd(),"data-raw","vfx_watermark_white.png"))


usethis::use_data(vfx_watermark_white, overwrite = TRUE)
