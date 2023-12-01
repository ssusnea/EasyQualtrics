new_qualtrics <- function(data) {

  stopifnot(is.data.frame(data))

  structure(data, class = c("qualtrics", "data.frame"))
}



validate_qualtrics <- function(data) {
  if (!is.data.frame(data)) {
    stop("This object is not a data frame")
  }

  label <- labelVector::get_label(data)
  if (is.null(label)) {
    stop("This object is missing its labels")
  }

  col_name <- names(data[,1:2])
  vector <- sum(stringr::str_detect(col_name, pattern = "(start|end)_date"))
  if(vector < 2) {
    stop("This is not a qualtrics data frame")
  }

  return(data)
}
