% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scale01.r
\name{scale01}
\alias{scale01}
\title{Scaling data}
\usage{
scale01(x, lim_inf = 0, lim_sup = 1)
}
\arguments{
\item{x}{numeric vector}

\item{lim_inf}{numeric value of the inferior limit (0 by default)}

\item{lim_sup}{numeric value of the superior limit (1 by default)}
}
\value{
numeric vector
}
\description{
Rescale data
}
\examples{

x <- seq(-3,3,l = 100)

range(x)

y <- scale01(x)

range(y)

plot(x,y)

}
