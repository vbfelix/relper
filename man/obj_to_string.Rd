% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/obj_to_string.R
\name{obj_to_string}
\alias{obj_to_string}
\title{Return an object name as a string}
\usage{
obj_to_string(x)
}
\arguments{
\item{x}{An R object}
}
\value{
A character single value with the name of the R object.
}
\description{
Return an object name as a string.
}
\examples{

x <- rnorm(100)

obj_to_string(x)

}
