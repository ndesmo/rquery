#' Get filename
#'
#' @description Correct conversion of the query name to a filename
#'
#' @param name Name of the query
#'
#' @export
#'
get.filename <- function(name) {
  gsub('[^[:alnum:]]', '_', name)
}
