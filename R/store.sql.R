#' Store SQL
#'
#' @description Store the SQL query to the filesystem.
#'
#' @param name Name of the query
#' @param sql SQL query to run
#' @param sql.dir SQL query directory. Stores all the SQL used. If subs were provided, it saves the query before the subs were inserted.
#'
#' @export

store.sql <- function(name, sql = NULL, sql.dir = 'sql') {

  # SQL can be retrieved from previous run
  if (is.null(sql)) {
    sql <- load.sql(name, sql.dir = sql.dir)
  }

  sql.file <- get.file(name, 'sql', sql.dir = sql.dir)

  # Save the file
  sql.file.conn <- file(sql.file)
  writeLines(sql, sql.file.conn)
  close(sql.file.conn)

}
