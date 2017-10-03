#' Should refresh data
#'
#' @description Ascertain whether the SQL query should be rerun
#'
#' @param name name of query
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#' @param data.dir Query results directory. Stores the results of the SQL queries as RDS files.
#' @param daily Boolean to indicate whether to force a rerun of the query on first execution each day.
#' @param overwrite Boolean to indicate whether to force a rerun of the query.
#'
#' @return Boolean indicating whether the SQL query should be rerun
#'
#' @export

should.refresh.data <- function(name, subs = NULL, data.dir = 'data',
                                daily = FALSE, overwrite = FALSE) {
  data.file <- get.file(name, 'data', subs, data.dir = data.dir)

  if ((!file.exists(data.file)) | overwrite |
      (daily & as.Date(file.mtime(data.file)) != Sys.Date())) {

    return(TRUE)
  } else {
    return(FALSE)
  }
}
