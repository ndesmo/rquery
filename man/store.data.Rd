% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/store.data.R
\name{store.data}
\alias{store.data}
\title{Store data}
\usage{
store.data(data, name, subs = NULL, data.dir = "data")
}
\arguments{
\item{data}{Query results as a data frame.}

\item{name}{Name of the query}

\item{data.dir}{Query results directory. Stores the results of the SQL queries as RDS files.}
}
\description{
Store the query results to the filesystem.
}

