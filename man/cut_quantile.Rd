% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cut_quantile.r
\name{cut_quantile}
\alias{cut_quantile}
\title{Breaks data by quantile}
\usage{
cut_quantile(x, q = seq(0, 1, by = 0.2), ...)
}
\arguments{
\item{x}{numeric vector.}

\item{q}{numeric vector of quantiles.}
}
\value{
breaks
}
\description{
Breaks data by quantile
}
\examples{
x <- rnorm(100)
cut_quantile(x)

}
