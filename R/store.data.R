#' @import dplyr
NULL
#' Store data
#'
#' @description Store the query results to the filesystem.
#'
#' @param name Name of the query
#' @param data Query results as a data frame.
#' @param data.dir Query results directory. Stores the results of the SQL queries as RDS files.
#'
#' @export

store.data <- function(data, name, subs = NULL, data.dir = 'data') {

  data.file <- get.file(name, 'data', subs, data.dir = data.dir)
  saveRDS(data, data.file)

}
