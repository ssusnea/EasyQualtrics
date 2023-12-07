#' @title Re-class columns with Qualtrics likert-scale presets
#'
#' @description
#' This function iterates over each column of class character in a data frame and
#' compares its unique responses to Qualtrics preset Likert scale labels, called
#' [`heuristics`]. If the responses correspond with a given heuristic, the function

#' will re-lass the column as a factor with the same levels as the heuristic.
#'
#' @param data Data frame to iterate over in search of Likert scale responses
#'
#' @return Returns the same data frame updated with re-classed Likert scale columns
#' Will display a message listing which (if any) columns were re-classed
#'
#' @importFrom purrr modify_if
#' @importFrom purrr map_lgl
#'
#' @export

make_likert <- function(data) { # takes the data frame being imported

  if (!is.data.frame(data)) {
    stop("`data` must be of class dataframe")
  }

 new_data <- purrr::modify_if(
    .x = data, # will return a data frame because using modify
    .p = is.character, # only looks at columns that are chr
    .f = detect_likert # runs fx to detect likert heuristic
    )

 old_classes <- purrr::map_lgl( # logical vector that marks if column is class chr
   .x = data, # unmodified data
   .f = is.character
 )

 new_classes <- purrr::map_lgl( # logical vector that marks if column is class chr
   .x = new_data, # data post likert modification
   .f = is.character
 )

 # logical vector of which classes changed after likert detection
 changed_classes <- names(data[old_classes & !new_classes])

 if (any(old_classes & !new_classes)) { # if any class changed with detect_likert()

   message("Coerced following columns into Likert factors:")
   message(paste(changed_classes, "\n")) # list of columns with class changes
 }

 return(new_data) # returns modified df
}

detect_likert <- function(col) { # looks at a single chr vector

  # confirms that col is of type chr (for when users call the function directly)
  if (!(is.character(col))) {
    stop("Column must be of class chr to be detectable as likert")
  }

  col <- as.factor(col) # coerces col to be a factor

  if (length(levels(col)) > 9) { # if number of unique values is greater than nine, cannot be a Qualtrics default likert
    return(as.character(col)) # re classes col as chr and returns
  }


  if (TRUE %in% any(grepl("agree", levels(col)))) { # looks for key string (ex "agree")
    heuristics <- heuristics[1:2] # selects for heuristics with key word and assigns
    for (i in heuristics) { # iterates over new subset heuristic possibilities
      if (all((levels(col) %in% levels(i)))) { # checks to see if levels of col are in the heuristic being compared
        col <- factor(col, levels = levels(i), ordered = TRUE) # reclasses col with correct factor
        return(col)} # return reclassed col
    }
    }


  if (TRUE %in% any(grepl("satisfied", levels(col)))) { # new key word: "satisfied"
    heuristics <- heuristics[3:6]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }


  if (TRUE %in% any(grepl("appropriate", levels(col)))) { # new key word: "appropriate"
    heuristics <- heuristics[7:8]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if (all((levels(col) %in% levels(gender)))) { # only one possible scale for gender
        col <- factor(col, levels = levels(gender)) # unordered factor
        return(col)}

  if (TRUE %in% any(grepl("true", levels(col)))) { # new key word: "true"
    heuristics <- heuristics[10:12]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if ((TRUE %in% any(grepl("yes", levels(col))))) { # new key words: "yes" or "not"
    heuristics <- heuristics[13:15]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if ((TRUE %in% any(grepl("average", levels(col))))) { # new key word: "average"
    heuristics <- heuristics[16:18]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if ((TRUE %in% any(grepl("worse", levels(col))))) { # new key word: "worse"
    heuristics <- heuristics[19:20]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if ((TRUE %in% any(grepl("easy", levels(col))))) { # new key word: "easy"
    heuristics <- heuristics[21:22]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  if (all((levels(col) %in% levels(heuristics[20])))) { # only one possible scale for effective
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}

  if ((TRUE %in% any(grepl("good", levels(col))))) { # new key word: "good"
    heuristics <- heuristics[24:25]
    for (i in heuristics) {
      if (all((levels(col) %in% levels(i)))) {
        col <- factor(col, levels = levels(i), ordered = TRUE)
        return(col)}
    }
  }

  col <- as.character(col) # reclasses col as chr if no matching heuristic

  return(col) # returns col of class chr
}

