should.refresh.data <- function(name, subs = NULL, data.dir = 'data',
                                daily = FALSE, overwrite = FALSE) {
  data.file <- get.file(name, 'data', subs, data.dir = data.dir)

  if ((!file.exists(data.file)) | overwrite |
      (daily & as.Date(file.mtime(data.file)) != Sys.Date())) {

    return(TRUE)
  } else {
    return(FALSE)
  }
}
