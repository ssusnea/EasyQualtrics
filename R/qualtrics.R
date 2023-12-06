#' Create an object of class `qualtrics`
#'
#' Given a data frame object, this function adds the class `qualtrics` to the object
#'
#' @param data A data set exported from Qualtrics
#'
#' @return An object of class `qualtrics` and class `data.frame`
#'
#' @export
new_qualtrics <- function(data) {

  stopifnot(is.data.frame(data))

  structure(data, class = c("qualtrics", "data.frame"))
}


#' Validate an object of class `qualtrics`
#'
#' Given a object of class `qualtrics`, this function will check that
#' the object satisfies all of the necessary conditions to be an object of this class.
#'
#' It checks:
#' * if the object is a data frame
#' * if the data frame has labels
#' * if the data frame's first two columns are named "start_date" and "end_date"
#'
#' @return A data frame of class `qualtrics`
#'
#' @importFrom labelVector get_label
#' @importFrom stringr str_detect
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



#' Subset a `qualtrics` data frame
#'
#' Given an object of class `qualtrics`, this subsetting method allows the user to subset a data frame while preserving its labels.
#'
#' @rawNamespace S3method(`[`,qualtrics)
#' @param data a data frame of class `qualtrics`
#' @param ... additional arguments used by `[`
#'
#' @importFrom labelVector get_label
#' @importFrom labelVector set_label
#'
#' @note
#' This subsetting method does not allow for dimensions to be dropped. Thus, to
#' subset a single column of a data frame use either `$` or `[[`.

`[.qualtrics` <- function(x, i, j, ..., drop = FALSE) {

  class(x) <- "data.frame" # reclass as df so can use subsetting operators
  labels <- as.list(labelVector::get_label(x)) # save the labels of the df as a list
  names(labels) <- names(x) # save the names of the df and make them the names of the labels

  newdata <- x[i, j, ..., drop = FALSE] # hard code that the method does not drop dimensions
  # newdata <- NextMethod()
  # if (is.data.frame(newdata)) {
  #   labels <- labels[names(newdata)]
  #
  #   newdata <- do.call(labelVector::set_label, c(list(newdata), labels))
  #   newdata <- new_qualtrics(newdata)
  # } else {
  #   newdata <- labelVector::set_label(newdata, labels[[i]])
  # }
  return(newdata)
}



#' Subset a `qualtrics` data frame
#'
#' @rawNamespace S3method(`[[`,qualtrics)
#' @description Given an object of class `qualtrics`, this subsetting method allows the user to subset a data frame while preserving its labels.
#'
#' @param data a data frame of class `qualtrics`
#' @param ... additional arguments used by `[[`
#'
#' @importFrom labelVector get_label
#' @importFrom labelVector set_label
`[[.qualtrics` <- function(x, i, j, ...) {

  class(x) <- "data.frame"# reclass as df so can use subsetting operators
  labels <- as.list(labelVector::get_label(x)) # save the labels of the df as a list
  names(labels) <- names(x) # save the names of the df and make them the names of the labels

  newdata <- NextMethod() # uses the `[[` method for data.frame

  newdata <- labelVector::set_label(newdata, labels[[i]]) # sets new labels based on index

  return(newdata) # returns a single labelled vector because selected for a single column
}



#' Subset a `qualtrics` data frame
#'
#' Given an object of class `qualtrics`, this subsetting method allows the user to subset a data frame while preserving its labels.
#'
#' @rawNamespace S3method(`$`,qualtrics)
#' @param data a data frame of class `qualtrics`
#' @param ... additional arguments used by `$`
#'
#' @importFrom labelVector get_label
#' @importFrom labelVector set_label
#'
#'
`$.qualtrics` <- function(data, ...) {

  class(x) <- "data.frame"  # reclass as df so can use subsetting operators
  labels <- as.list(labelVector::get_label(x)) # save the labels of the df as a list
  names(labels) <- names(x) # save the names of the df and make them the names of the labels

  newdata <- NextMethod() # uses the `[[` method for data.frame

  newdata <- labelVector::set_label(newdata, labels[[i]]) # sets new labels based on index

  return(newdata)  # returns a single labelled vector because selected for a single column
}
