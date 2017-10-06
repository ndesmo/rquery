#' @import DBI
NULL
#' Connect
#'
#' @description Connect to the database. Uses the db_dsn, db_username and db_password environment variables. Use Sys.setenv() to set them.
#'
#' @param oracle Boolean to indicate whether to automatically generate the connect.string for use with Oracle. Otherwise, you can provide the connect string by doing Sys.setenv('a connection string')
#' @return ODBC connection object
#' @export
#'
#' @examples
#'
#' Sys.setenv(db_driver = 'mydriver',
#'            db_host = 'myhost',
#'            db_port = 123,
#'            db_sid = 'myservicename',
#'            db_username = 'myuser',
#'            db_password = 'mypass')
#'
#' # If using the Oracle method
#' ora.connect.string
#' conn <- connect(oracle = TRUE)
#'
#' # Or if using the connection string method
#' Sys.setenv(connect.string = 'a connection string',
#'            db_username = 'myuser', db_password = 'mypass')
#'
#' conn <- connect()

connect <- function(oracle = FALSE) {

  if (oracle) {
    ora.connect.string()
  }

  drv.name <- Sys.getenv('db_driver')
  drv <- DBI::dbDriver(drv.name)

  uid <- Sys.getenv('db_username')
  pwd <- Sys.getenv('db_password')

  conn <- DBI::dbConnect(drv, connect.string, username = uid, password = pwd)

  return(conn)
}
