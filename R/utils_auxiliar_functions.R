palette_create <-
  function(n,orig){

    rgb  <- t(col2rgb(orig))

    temp <- matrix(NA, ncol = 3, nrow = n)

    x <- seq(0, 1, , length(orig))

    xg <- seq(0, 1, , n)

    for (k in 1:3) {
      hold <- spline(x, rgb[, k], n = n)$y
      hold[hold < 0] = 0
      hold[hold > 255] = 255
      temp[, k] <- round(hold)
    }

    palette <- rgb(temp[, 1], temp[, 2], temp[, 3], maxColorValue = 255)

    return(palette)
  }
