rquery <- function(sql = NULL, name, subs = NULL,
                   data.dir = 'data', sql.dir = 'sql', subs.dir = 'params',
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
}
