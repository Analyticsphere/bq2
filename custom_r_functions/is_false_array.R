#' Check if a column is "false array"
#'
#' This function checks if a column is "false_array" based on the specified 
#' valid values.
#' 
#' An exceptional column is defined by the following criteria:
#' 1. It contains at most three unique values (excluding NA).
#' 2. All unique values are included in the specified valid values.
#' 3. It contains at most one unique CID enclosed in square brackets "[...]".

#' @param x A vector to check for exceptional values.
#' @param valid_values A character vector of valid values, including those enclosed in square brackets.
#' @return TRUE if the column is exceptional, FALSE otherwise.
#' 
is_false_array <- function(x, 
                           valid_values = 
                             c(NA, "[]", "[178420302]", "[958239616]")) {
  unique_values <- unique(x)
  num_unique_values <- length(unique_values[!is.na(unique_values)])
  
  # Check if there are at most 3 unique values (excluding NA) and 
  # at most one unique concept ID
  check <- num_unique_values <= 3 && 
           all(unique_values %in% valid_values) &&
           (sum(grepl("\\[\\d{9}\\]", unique_values)) <= 1)
  
  return(check)
}

## Usage example: --------------------------------------------------------------

# # Create a sample dataframe
# df <- data.frame(
#   col1 = c(NA, "[]", "[178420302]", "[178420302]", "[178420302]", NA),
#   col2 = c("[]", "[]", "invalid", "[987654321]", "[327986541]", "[]"),
#   col3 = c("[123456789]", "[123456789]", "[123456789]", "[987654321]",
#            "[327986541]", "[123456789]"),
#   col4 = c("[]", NA, "[958239616]", NA, "[958239616]", "[958239616]"),
#   col5 = c("[]", NA, "[958239616]", NA, "[178420302]", "[958239616]")
# )
# 
# lapply(df, is_false_array)