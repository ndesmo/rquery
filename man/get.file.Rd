% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.file.R
\name{get.file}
\alias{get.file}
\title{Get file}
\usage{
get.file(name, type = c("data", "sql", "subs"), subs = NULL,
  data.dir = "data", sql.dir = "sql", subs.dir = "params")
}
\arguments{
\item{name}{Name of the query}

\item{type}{Type of file to save.}

\item{subs}{One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.}
}
\value{
Path of the file
}
\description{
Get the correct file path to use.
}

