#' @import RODBC
NULL
#' Disconnect
#'
#' @description Disconnect from the database
#'
#' @return Nothing
#' @export

disconnect <- function() {
  RODBC::odbcCloseAll()
}
