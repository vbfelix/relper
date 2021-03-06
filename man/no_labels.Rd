% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/no_labels.r
\docType{data}
\name{no_labels}
\alias{no_labels}
\title{No labels in ggplot2}
\format{
An object of class \code{labels} of length 6.
}
\usage{
no_labels
}
\value{
ggplot2 object
}
\description{
Object, that clears ggplot2 labels
}
\examples{

library(ggplot2)

plot <-
  ggplot(mtcars,aes(hp,drat))+
  geom_point()

plot

plot + no_labels

}
\keyword{datasets}
