
#' Standardize column names
#'
#' This function takes column names and tidies them, returning the names in snake case.
#'
#'
#' @param data The data frame containing the column names to be cleaned.
#'
#' @return a data frame with column names in snake case.
#'
#' @importFrom snakecase to_snake_case
#' @export

clean_names <- function(data) {
  col_names <- names(data)
  cleaned <- snakecase::to_snake_case(col_names)
  colnames(data) <- cleaned
  return(data)
}
