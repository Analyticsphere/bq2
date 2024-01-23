#' Standardize Variable Name
#'
#' This function takes a variable name and standardizes it based on its pattern.
#' The patterns include 'standard', 'long_tail', and 'short_tail'.
#' If a variable does not fit these patterns, the function returns NA.
#'
#' @param variable_name A string representing the variable name to be standardized.
#' @param category A string representing the category of the variable name pattern.
#'
#' @return A standardized form of the variable name or NA if it doesn't match known patterns.
#'
#' @examples
#' standardize_variable_name("D_116065851_1_1_D_206625031_1_1", "long_tail") # returns 'D_116065851_D_206625031_1'
#' standardize_variable_name("D_236590500_3_3_D_236590500_3_3", "short_tail") # returns 'D_236590500_D_236590500_3'
#' standardize_variable_name("Random_Variable_123", NA) # returns NA
#'
#' @export
standardize_variable_name <- function(variable_name, category) {

  # Standardize based on the category
  if (category == "long_tail" || category == "short_tail") {
    parts <- unlist(stringr::str_extract_all(variable_name, '\\d{9}|\\d+'))
    return(glue::glue('D_{parts[1]}_D_{parts[4]}_{parts[2]}'))
  }
  
  # Return NA if the category is 'standard' or 'none'
  return(NA)
}
