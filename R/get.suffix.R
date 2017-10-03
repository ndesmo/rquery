#' @import digest
NULL
#' Get suffix
#'
#' @description Get the file suffix as a hash of the subs list if it is provided. Required to keep uniqueness of various queries.
#'
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#'
#' @export

get.suffix <- function(subs) {
  if (!is.null(subs)) { return(paste0('_', digest::digest(subs)))}
}
