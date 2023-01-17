warn_any_na <- function(x, warning = "some values were coerced to NA's"){
  if(any(is.na(x))){warning(warning)}
}

warn_any_logic <- function(x,operator,value, warning){

  if(any(operator(x,value))){warning(warning)}
}

warn_any_zero <- function(x,warning = "at least one value = 0"){

  warn_any_logic(x = x,operator = `==`,value = 0,warning = warning)

}
