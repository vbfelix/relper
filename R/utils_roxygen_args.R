# Functions to help reduce duplication and increase consistency in the docs

arg_mark <- function(type,default = NULL){
  output <-
    glue::glue("
    @param {type}_mark \\
    A character single value to use as the {type} mark
    ")
  if(!is.null(default)){
    output <-
      glue::glue(
        output," (default = {default})"
      )
  }
  return(output)
}




arg_name <- function(name,type = "",structure,default = NULL, action = NULL){
  output <-
  glue::glue("
    @param {name} \\
    A {type} {structure}
    ")
  if(!is.null(default)){
    output <-
      glue::glue(
        output," (default = {default})"
      )
  }
  if(!is.null(action)){
    output <-
      glue::glue(
        output,", that {action}"
      )
  }
  return(output)
}

arg_vector <- function(name,type,default = NULL, action = NULL){
  arg_name(structure = "vector",
           name = name,type = type,default = default,action = action)
}

arg_value <- function(name,type,default = NULL, action = NULL){
  arg_name(structure = "single value",
           name = name,type = type,default = default,action = action)
}


arg_number_of <- function(name,default = NULL, number_of = NULL){

  action <- glue::glue("will be the number of {number_of}")

  output <- arg_name(
    structure = "single value",
    type = "numeric integer",
    name = name,default = default,action = action)

  return(output)
}

arg_boolean <- function(name, action, default = "FALSE"){
  glue::glue("
    @param {name} \\
    A boolean value, if TRUE the function will {action} (default = {default})
    ")
}

arg_df <- function(name){
  glue::glue("@param {name} \\
             A single data.frame")
}

arg_df_var <- function(name,type){
  glue::glue("@param {name} \\
             A {type} variable from a data.frame")
}

arg_date_unit <- function(name){
  glue::glue("
    @param {name} \\
    A character single value with the unit of the date result (secs, mins, hours, days, weeks)
    ")
}
