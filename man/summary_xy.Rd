% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_xy.r
\name{summary_xy}
\alias{summary_xy}
\title{Summary of two numeric variables}
\usage{
summary_xy(x, y)
}
\arguments{
\item{x}{A numeric vector}

\item{y}{A numeric vector}
}
\value{
A tibble (1x4) with the computed coefficients.
}
\description{
Computation of the covariance, and Pearson, Kendall and Spearman correlations coefficients.
}
\examples{

x <- rnorm(100)

y <- rnorm(100)

plot(x,y)

summary_xy(x,y)

}
