stop_function <- function(arg,type){

  arg_name <- rlang::get_expr(enquo(arg))

  type_msg <- paste0("argument '",arg_name,"' must be ",type,".")

  condition <-
  switch(type,
         numeric = !is.numeric(arg),
         logical = !is.logical(arg)
         )

  if(condition){stop(type_msg)}

}



# func <- function(x){
  # stop_function(x,"numeric")

  # return(T)
# }

# func(2)

# func <- function(x){
#
# }
#
# a <- func(x = y)
# a
# class(a)
# a)
