% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/replace_boolean.r
\name{replace_boolean}
\alias{replace_boolean}
\title{Replace a boolean variable}
\usage{
replace_boolean(x, true_value = NULL, false_value = NULL)
}
\arguments{
\item{x}{A boolean vector}

\item{true_value}{A  single value, that will replace TRUE values}

\item{false_value}{A  single value, that will replace FALSE values}
}
\value{
A numeric value
}
\description{
Replace a boolean
}
\examples{

replace_boolean(c(T,T,T,F,F),1,2)

}
