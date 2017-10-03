#' Create directories
#'
#' @description Create the directories required for storing the query data and metadata locally.
#'
#' @param data.dir Query results directory. Stores the results of the SQL queries as RDS files.
#' @param sql.dir SQL query directory. Stores all the SQL used. If subs were provided, it saves the query before the subs were inserted.
#' @param subs.dir Subs directory. Stores all the individual subs for each query as a data frame.
#'
#' @export
#'
create.directories <- function(data.dir = 'data', sql.dir = 'sql', subs.dir = 'params') {
  dir.create(data.dir, showWarnings = FALSE)
  dir.create(sql.dir, showWarnings = FALSE)
  dir.create(subs.dir, showWarnings = FALSE)
}
