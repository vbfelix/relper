## code to prepare `vfx_watermark` dataset goes here

vfx_watermark <- png::readPNG(file.path(getwd(),"data-raw","vfx_watermark.png"))

usethis::use_data(vfx_watermark, overwrite = TRUE)
