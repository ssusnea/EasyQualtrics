
# temporarily included since we haven't put in the data yet
data <- read.csv("~/Desktop/SDS270_November 17, 2023_13.49.csv")

#' @title Check if data is in Qualtrics format
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
    message("Data frame does not follow Qualtrics formatting; calling function may not return intended result")
    # throws message if entries are not what is expected
  }
}

#' @title Tidy Qualtrics data frame
#'
#' @description
#' This function puts data imported from Qualtrics into "tidy" format by removing
#' the first two rows, as they do not contain actual observations. In addition,
#' it takes the first of these unnecessary rows and creates a new object of class
#' `list` that contains every question in the survey in the form of character vectors.
#'
#' @param data A data frame to be tidied
#'
#' @return The tidied data frame and a list of all the questions as character vectors
#'
#' @export

tidy_data <- function(data) {

  is_qualtrics(data) # checks if data is in unedited Qualtrics form

  questions <- as.list(data[1, ]) # creates list of survey questions
  data <- data[-c(1, 2), ] # removes rows that are not observations

  questions # returns list of questions
  data # returns tidied data frame

  }
