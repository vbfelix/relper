#' Format p value
#'
#' @description Format p value
#'
#' @eval arg_vector("p_value","numeric")
#' @eval arg_value("p_value_min","numeric",default = "NULL",action = "will be the lower bound")
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

  stop_function(arg = p_value,type = "numeric")

  stop_function(arg = p_value_min,type = "numeric",null = TRUE)

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


