#' @title Check if data is in Qualtrics format
#'
#' @description
#' This function reads a csv file according to the standard Qualtric format
#'
#' @param path File path to csv being imported
#' @param heuristics Logical to determine if function should try identify and class likert questions
#'
#' @export

read_qualtrics <- function(path, heuristics = TRUE) {
  is_qualtrics(read.csv(path)) # checks to see if csv follows Qualtrics formatting

  data <- read.csv(path, skip = 3, header = FALSE)
  # saves actual data observations, excluding the first three rows of meta-data

  meta_data <- read.csv(path, nrows = 1)
  # saves meta-data as data frame with first row as header

  names(data) <- names(meta_data)
  # applies header names from meta data to be header for data set


  data <- clean_names(data) # makes column names snake case

  # adds survey question text as attr to each variable in df
  data <- do.call(labelVector::set_label, c(list(data), lapply(meta_data, `[`, 1)))

  if (heuristics) { # re-classes data frame according to Likert heuristics
    data <- make_likert(data)
  }

  data <- new_qualtrics(data)
  data <- validate_qualtrics(data)

  return(data)
}


# temporarily included since we haven't put in the data yet
data <- read.csv("~/Documents/qualtrics/data-raw/SDS270_November 17, 2023_13.49.csv", skip = 3, header = FALSE)
meta_data <- read.csv("~/Documents/qualtrics/data-raw/SDS270_November 17, 2023_13.49.csv", nrows = 1)

names(data) <- names(meta_data)

data_ex <- read.csv("~/Documents/qualtrics/inst/extdata/SDS270_ex_November 27, 2023_18.19.csv")


#' @title Check if data frame is in unedited Qualtrics format
#'
#' @description
#' This function checks if the data to be tidied is in the format of unedited Qualtrics
#' data. If the data does not appear to be be from Qualtrics, it will signal a condition.
#'
#' @param data Data attempting to be tidied
#'
#' @export

is_qualtrics <- function(data) {

  if (!is.data.frame(data)) { # checks if data is a data frame
    stop("Data must be of class `df`") # if not df, throws error
  }

  if ((data[1, 1] != "Start Date") & (!startsWith(data[2,1], '{\"ImportId\"'))) {
    # checks if first two rows of first column have expected values
    message("Provided csv does not follow Qualtrics formatting; calling function may not return intended result")
    # throws message if entries are not what is expected
  }
}
