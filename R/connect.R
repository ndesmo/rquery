#' @import RODBC
NULL
#' Connect
#'
#' @description Connect to the database. Uses the db_dsn, db_username and db_password environment variables. Use Sys.setenv() to set them.
#'
#' @return ODBC connection object
#' @export
#'
#' @examples
#'
#' sys.setenv(
#'   'db_dsn' = 'mydb',
#'   'db_username' = 'myuser',
#'   'db_password' = 'password'
#' )
#'
#' conn <- connect()

connect <- function() {
  dsn <- Sys.getenv('db_dsn')
  uid <- Sys.getenv('db_username')
  pwd <- Sys.getenv('db_password')
  conn <- RODBC::odbcConnect(dsn, uid, pwd)
  return(conn)
}
