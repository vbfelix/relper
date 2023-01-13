#' Format p value
#'
#' @description Format p value
#'
#' @eval arg_vector("p_value","numeric")
#' @eval arg_value("lower_bound","numeric",default = "NULL",action = "will be the lower bound")
#'
#' @return A characther vector.
#'
#' @export
#'
#' @examples
#'
#' format_p_value(c(.001,.00000001),lower_bound = 0.001)
#'

format_p_value <-
  function(p_value, lower_bound = NULL){

  stop_function(arg = p_value,type = "numeric")

  stop_function(arg = lower_bound,type = "numeric",null = TRUE,single_value = TRUE)

  if(is.null(lower_bound)){
    relper::format_num(p_value,digits = 4,...)
  }else{
    dplyr::if_else(
      condition = p_value < lower_bound,
      true =  paste0("<",lower_bound),
      false = relper::format_num(p_value,digits = 4)
    )
  }

}


