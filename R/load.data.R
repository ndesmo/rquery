#' @import dplyr
NULL
#' Load data
#'
#' @description Load the query results from the filesystem.
#'
#' @param name Name of the query
#' @param data.dir Query results directory. Stores the results of the SQL queries as RDS files.
#'
#' @return Data frame of the query results
#'
#' @export

load.sql <- function(name, subs = NULL, data.dir = 'data') {
  data.file <- get.file(name, 'data', subs, data.dir = data.dir)

  if (file.exists(data.file)) {
    data <- readRDS(data.file)
  } else {
    data <- NULL
  }

  return(data)

}
