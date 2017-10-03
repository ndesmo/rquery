#' @import dplyr
NULL
#' Load subs
#'
#' @description Load the subs list from the filesystem.
#'
#' @param name Name of the query
#' @param sql.dir SQL query directory. Stores all the SQL used. If subs were provided, it saves the query before the subs were inserted.
#'
#' @return SQL used for the query
#'
#' @export

load.sql <- function(name, sql.dir = 'sql') {
  sql.file <- get.file(name, 'sql', sql.dir = sql.dir)

  if (file.exists(sql.file)) {
    sql <- file(sql.file) %>% readLines() %>% paste(collapse = ' ')
  } else {
    sql <- NULL
  }

  return(sql)

}
