#' Create an object of class `qualtrics`
#'
#' Given a data frame object, this function adds the class `qualtrics` to the object
#'
#' @param data A data set exported from Qualtrics
#'
#' @return An object of class `qualtrics` and `data.frame`
#'
#' @export
new_qualtrics <- function(data) {

  stopifnot(is.data.frame(data))

  structure(data, class = c("qualtrics", "data.frame"))
}


#' Validate an object of class `qualtrics`
#'
#' Given a object of class `qualtrics`, this function will check that
#' the object satisfies all of the conditions necessary to be an object of class `qualtrics`.
#' It checks:
#' * if the object is a data frame
#' * if the data frame has labels
#' * if the data frame's first two columns are named "start_date" and "end_date"
#'
#' @return A data frame of class `qualtrics`
#'
#' @export
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
