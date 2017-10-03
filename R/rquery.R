#' RQuery
#'
#' @description Query the database efficiently and cache data appropriately in subdirectories
#'
#' @param sql SQL query to run
#' @param name name of query
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#' @param data.dir Query results directory. Stores the results of the SQL queries as RDS files.
#' @param sql.dir SQL query directory. Stores all the SQL used. If subs were provided, it saves the query before the subs were inserted.
#' @param subs.dir Subs directory. Stores all the individual subs for each query as a data frame.
#' @param daily Boolean to indicate whether to force a rerun of the query on first execution each day.
#' @param overwrite Boolean to indicate whether to force a rerun of the query.
#'
#' @return Data frame of the query results
#'
#' @export
#' @examples
#'
#' sys.setenv(
#'   'db_dsn' = 'mydb',
#'   'db_username' = 'myuser',
#'   'db_password' = 'password'
#' )
#'
#' sql <- "select 1 as a from dual where 1 = XnumberX"
#' subs <- data.frame('XnumberX' = 1)
#'
#' rquery(sql, 'myquery', subs)


rquery <- function(sql = NULL, name, subs = NULL,
                   data.dir = 'data', sql.dir = 'sql', subs.dir = 'subs',
                   daily = FALSE, overwrite = FALSE) {

  # Ensure directories are created
  create.directories(data.dir = data.dir, sql.dir = sql.dir, subs.dir = subs.dir)

  # Save the sql statements
  store.sql(name, sql, sql.dir = sql.dir)
  sql <- load.sql(name, sql.dir = sql.dir)

  # Save the subs
  store.subs(name, subs, subs.dir = subs.dir)

  # Check whether it's necessary to run the query
  refresh <- should.refresh.data(name, subs, data.dir = data.dir,
                                 daily = daily, overwrite = overwrite)

  # If we don't need to run the query then get it from the filesystem
  data <- NULL
  if (!refresh) {
    data <- load.data(name, subs, data.dir = data.dir)
  }

  # If we do need to run the query, or the filesystem provided a null value, run the query
  if (refresh | is.null(data)) {
    data <- query(sql, subs)
  }

  store.data(data, name, subs, data.dir = data.dir)

  return(data)
}
