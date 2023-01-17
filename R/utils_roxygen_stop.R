stop_function <- function(
    arg,
    type,
    null = FALSE,
    length_bigger = NULL,
    range = NULL,
    bigger_than = NULL,
    single_value = NULL
    ){

  arg_name <- rlang::get_expr(rlang::enquo(arg))

  # type --------------------------------------------------------------------

  condition <-
    switch(
      EXPR = type,
      numeric = !is.numeric(arg),
      logical = !is.logical(arg),
      list = !is.list(arg),
      dataframe = !is.data.frame(arg),
      date = !lubridate::is.Date(arg),
      integer = !relper::is_integer(arg),
      character = !is.character(arg),
      string = !relper::is_string(arg),
      datetime = !relper::is_datetime(arg)
    )

  a_type <- c("list","dataframe","date","integer","string","character")

  if(type %in% a_type){type <- paste0("a ", type)}

  if(null){
    type <- paste0(type, " or NULL")
    if(is.null(arg)){
      condition <- FALSE
    }
  }

  msg <- paste0("argument '",arg_name,"' must be ",type,".")

  if(condition){stop(msg)}

  # length_bigger --------------------------------------------------------------------

  if(!is.null(length_bigger)){

    condition <- length(arg) <= length_bigger

    msg <- paste0("argument '",arg_name,"' must have length > ",length_bigger,".")

    if(condition){stop(msg)}

  }

  # range --------------------------------------------------------------------

  if(!is.null(range)){

    condition <- (min(arg) < range[1]) | (max(arg) > range[2])

    msg <- paste0("argument '",arg_name,"' must be in [",range[1],"; ",range[2] ,"]")

    if(condition){stop(msg)}

  }

  # bigger_than --------------------------------------------------------------------

  if(!is.null(bigger_than)){

    condition <- arg < bigger_than

    msg <- paste0("argument '",arg_name,"' must be >= ", bigger_than)

    if(condition){stop(msg)}

  }

  # single_value --------------------------------------------------------------------

  if(!is.null(single_value)){

    condition <- length(arg) > 1

    msg <- paste0("argument '",arg_name,"' must be a single value")

    if(condition){stop(msg)}

  }

}

stop_two_args <-
  function(
    arg1,
    arg2,
    null = FALSE,
    equal_length = NULL,
    bigger_than = FALSE){

  arg1_name <- rlang::get_expr(rlang::enquo(arg1))
  arg2_name <- rlang::get_expr(rlang::enquo(arg2))

  if(null){
    if(is.null(arg1) | is.null(arg2)){
      null <- TRUE
    }else {
      null <- FALSE
    }

  }

  # equal_length --------------------------------------------------------------------


  if(!null & !is.null(equal_length)){

    condition <- length(arg1) != length(arg2)

    msg <- paste0("arguments '",arg1_name,"' and '",arg2_name,"' must have the same length")

    if(condition){stop(msg)}

  }


  # bigger_than --------------------------------------------------------------------

  if(!null & bigger_than){

    condition <- arg1 >= arg2

    msg <- paste0("argument '",arg2_name,"' must be > '",arg1_name,"'")

    if(condition){stop(msg)}

  }

}

stop_one_of <- function(arg,one_of){

  arg_name <- rlang::get_expr(rlang::enquo(arg))

  arg <- tolower(arg)

  condition <- relper::isnot_in(arg,one_of)

  msg <- paste0("argument '",arg_name,"' must be one of: ",
                paste(one_of, collapse = ", "))

  if(condition){stop(msg)}

}
