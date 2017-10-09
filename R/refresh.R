#' Refresh data
#'
#' @description Refresh all applicable data files.
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
#' # Run a daily refresh
#' refresh()
#'
#' # Force a refresh
#' refresh(overwrite = TRUE)

refresh <- function(daily = TRUE, overwrite = FALSE,
                    data.dir = 'data', sql.dir = 'sql', subs.dir = 'subs') {

  # Get the list of things to do by the SQL file name
  sql.file.list <- list.files(sql.dir)

  for (sql.file in sql.file.list) {

    name <- (sql.file %>% tools::file_path_sans_ext())[[1]]

    # Get the subs lists
    subs.df <- readRDS(paste0(subs.dir, '/', name, '.rds'))

    N <- nrow(subs.df)

    # If query has no subs then just process it, otherwise work through all the subs
    if (N == 0) {
      rquery(name = name, subs = NULL, data.dir = data.dir, sql.dir = sql.dir,
             subs.dir = subs.dir, daily = daily, overwrite = overwrite)
    } else {

      for (i in 1:N) {
        subs <- subs.df[1,]
        rquery(name = name, subs = NULL, data.dir = data.dir, sql.dir = sql.dir,
               subs.dir = subs.dir, daily = daily, overwrite = overwrite)
      }
    }

  }

}
