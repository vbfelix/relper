% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plt_no_labels.r
\docType{data}
\name{plt_no_labels}
\alias{plt_no_labels}
\title{ggplot2: Removal of all labels}
\format{
An object of class \code{labels} of length 6.
}
\usage{
plt_no_labels
}
\value{
A ggplot2 object.
}
\description{
Removal of all labels from a ggplot2 plot.
}
\examples{

library(ggplot2)

plot <-
  ggplot(mtcars,aes(hp,drat))+
  geom_point()

plot

plot + plt_no_labels

}
\keyword{datasets}
