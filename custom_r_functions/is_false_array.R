#' Check if a Column is a "False Array"
#'
#' This function assesses if a given column can be classified as a "false array" 
#' based on specific criteria and a set of predefined valid values. A column is 
#' considered a "false array" if it meets the following conditions:
#' 1. Contains at most three unique values (excluding NA).
#' 2. All unique values must be included in the specified valid values.
#' 3. Contains at most one unique CID (Concept ID) enclosed in square brackets "[...]".
#'
#' @param x A vector representing the column to be checked.
#' @param valid_values A character vector of valid values, including potential CIDs 
#'        enclosed in square brackets. Default values are NA, "[]", "[178420302]", 
#'        and "[958239616]".
#' 
#' @return A logical value: TRUE if the column meets the criteria for being a "false array", 
#'         FALSE otherwise.
#'
#' @examples
#' df <- data.frame(
#'   col1 = c(NA, "[]", "[178420302]", "[178420302]", "[178420302]", NA),
#'   col2 = c("[]", "[]", "invalid", "[987654321]", "[327986541]", "[]"),
#'   col3 = c("[123456789]", "[123456789]", "[123456789]", "[987654321]",
#'            "[327986541]", "[123456789]"),
#'   col4 = c("[]", NA, "[958239616]", NA, "[958239616]", "[958239616]"),
#'   col5 = c("[]", NA, "[958239616]", NA, "[178420302]", "[958239616]")
#' )
#' 
#' # Apply the function to each column of the dataframe
#' lapply(df, is_false_array)
#'
#' @export
is_false_array <- function(x, 
                           valid_values =
                             c(NA, "[]", "[178420302]", "[958239616]")) {
  unique_values <- unique(x)
  num_unique_values <- length(unique_values[!is.na(unique_values)])
  
  # Criteria for being a false array
  check <- num_unique_values <= 3 && 
    all(unique_values %in% valid_values) &&
    sum(grepl("\\[\\d{9}\\]", unique_values)) <= 1
  
  return(check)
}
