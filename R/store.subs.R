#' @import dplyr
NULL
#' Store subs
#'
#' @description Store the subs list to the filesystem.
#'
#' @param name Name of the query
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#' @param subs.dir Subs directory. Stores all the individual subs for each query as a data frame.
#'
#' @export

store.subs <- function(name, subs = NULL, subs.dir = 'subs') {
  subs.file <- get.file(name, 'subs', subs.dir = subs.dir)

  # Ensure that we are saving a dataframe
  if (is.null(subs)) {
    subs <- data.frame(NULL)
  }

  # Get the previously saved subs for this query if they exist
  if (file.exists(subs.file)) {
    stored.subs <- readRDS(subs.file)
  } else {
    stored.subs <- subs %>% dplyr::filter(1==0)
  }

  stored.subs <- dplyr::union(subs, stored.subs)
  saveRDS(stored.subs, subs.file)

}
