#' Format p value
#'
#' @description Format p value
#'
#' @param p_value
#' @param p_value_min number of decimals digits
#'
#' @return formatted data
#' @export
#'
#' @examples
#'
#' format_p_value(c(.001,.00000001),p_value_min = 0.001)
#'

format_p_value <-
  function(p_value, p_value_min = NULL,...){

  if(!is.numeric(p_value)){stop("'p_value' must be numeric.")}

  if(!is.numeric(p_value_min) & !is.null(p_value_min)){stop("'p_value_min' must be numeric or NULL.")}

  if(is.null(p_value_min)){
    relper::format_num(p_value,digits = 4,...)
  }else{
    dplyr::if_else(
      condition = p_value < p_value_min,
      true =  paste0("<",p_value_min),
      false = relper::format_num(p_value,digits = 4,...)
    )
  }

}


