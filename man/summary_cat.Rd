% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/summary_cat.r
\name{summary_cat}
\alias{summary_cat}
\title{Summary of categorical variables}
\usage{
summary_cat(x)
}
\arguments{
\item{x}{A character vector}
}
\value{
A tibble with:
\cr
\cr - n: the number of observations;
\cr - na: the number of missing values;
\cr - blank_space: the number of values blank ("");
\cr - n_distinct: the number of distinct levels;
\cr - mode: the mode.
}
\description{
Summary statistics for categoric variables.
}
\examples{

x <- c(sample(letters,100,replace = TRUE),NA)

x

summary_cat(x)

}
