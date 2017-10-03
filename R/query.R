#' @import RODBC
NULL
#' Query
#'
#' @description Query the database
#'
#' @param sql SQL query to run
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#'
#' @export
#' @examples
#'
#' sys.setenv(
#'   'db_dsn' = 'mydb',
#'   'db_username' = 'myuser',
#'   'db_password' = 'password'
#' )
#'
#' sql <- "select 1 as a from dual where 1 = _number_"
#' subs <- data.frame('_number_' = 1)
#'
#' query(sql, subs)

query <- function(sql, subs = NULL) {
  conn <- connect()
  if (!is.null(subs)) {
    for (i in 1:ncol(subs)) {
      sql <- gsub(names(subs)[i], subs[1,i], sql)
    }
  }
  results <- RODBC::sqlQuery(conn, sql)
  disconnect()
  return(results)
}