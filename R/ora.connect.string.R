#' @import DBI
NULL
#' Oracle connection string
#'
#' @description Generate the connection string environment variable for Oracle environments only. The host, port and sid should be set using Sys.setenv(db_host, db_port, db_sid) respectively.
#'
#' @return Nothing. Sets the environment variables.
#' @export
#'
#' @examples
#'
#' Sys.setenv(db_host = 'myhost', db_port = 123, db_sid = 'mysid')
#'
#' # Sets the "connect.string" environment variable
#' ora.connect.string()
#'

ora.connect.string <- function() {

  host <- Sys.getenv('db_host')
  port <- Sys.getenv('db_port')
  sid <- Sys.getenv('db_sid')

  connect.string <- paste(
    '(DESCRIPTION=',
    '(ADDRESS=(PROTOCOL=tcp)(HOST=', host, ')(PORT=', port, '))',
    '(CONNECT_DATA=(SERVICE_NAME=', sid, ')))', sep = '')

  Sys.setenv(connect.string = connect.string)

}

