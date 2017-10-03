#' @import dplyr
NULL
#' Load subs
#'
#' @description Load the subs list from the filesystem.
#'
#' @param name Name of the query
#' @param subs.dir Subs directory. Stores all the individual subs for each query as a data frame.
#'
#' @return Data frame of all subs used for this query, or NULL if none used
#'
#' @export

load.subs <- function(name, subs.dir = 'subs') {
  subs.file <- get.file(name, 'subs', subs.dir = subs.dir)

  # Get the previously saved subs for this query if they exist
  if (file.exists(subs.file)) {
    stored.subs <- readRDS(subs.file)
  } else {
    stored.subs <- data.frame(NULL)
  }

  if (ncol(stored.subs) == 0) {
    stored.subs <- NULL
  }

  return(stored.subs)

}
