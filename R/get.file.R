#' Get file
#'
#' @description Get the correct file path to use.
#'
#' @param name Name of the query
#' @param type Type of file to save.
#' @param subs One row data frame whose column names are the substrings to replace, and whose values are the strings to replace them with.
#'
#' @return Path of the file
#'
#' @export

get.file <- function(name, type = c('data', 'sql', 'subs'), subs = NULL,
                     data.dir = 'data', sql.dir = 'sql', subs.dir = 'params') {

  # Get the correct filename
  filename <- get.filename(name)

  # Get the correct file extension
  if (type %in% c('data', 'subs')) { extension <- '.rds'} else { extension <- '.sql'}

  # Get the correct directory
  if (type == 'data') {dir <- data.dir} else if (type == 'sql') {dir <- sql.dir} else {dir <- subs.dir}

  # Get a unique suffix for the relevant files for when subs lists are present
  if (type == 'data') {suffix <- get.suffix(subs)} else {suffix <- NULL}

  return(paste0(dir, '/', filename, suffix, extension))

}
