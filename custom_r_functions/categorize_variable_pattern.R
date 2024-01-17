#' Categorize Variable Names by String Patterns
#'
#' This function categorizes variable names based on specific string patterns. 
#' It identifies three types of patterns: 'standard', 'long_tail', and 'short_tail'. 
#' If a variable does not match any of these patterns, it is categorized as 'none'.
#'
#' @param variable_name A string representing the variable name to be categorized.
#'
#' @return A string representing the category of the pattern: 'standard', 'long_tail', 
#' 'short_tail', or 'none'.
#'
#' @examples
#' categorize_variable_pattern("D_207494582") # returns 'standard'
#' categorize_variable_pattern("D_207025341_D_207025341_D_990501908") # returns 'standard'
#' categorize_variable_pattern("D_158354252_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1") # returns 'long_tail'
#' categorize_variable_pattern("D_236590500_3_3_D_236590500_3_3") # returns 'short_tail'
#' categorize_variable_pattern("Random_Variable_123") # returns 'none'
#'
#' @details
#' The function uses regular expressions to identify the following patterns:
#' - 'standard': Variable names with up to 3 CIDs separated by 'D_'. 
#'   Example: 'D_207494582', 'D_207025341_D_207025341_D_990501908'.
#' - 'long_tail': Variable names following a specific repetitive structure, 
#'   with a pattern repeating 24 times.
#'   Example: 'D_158354252_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1'.
#' - 'short_tail': Variable names with a shorter repetitive structure.
#'   Example: 'D_236590500_3_3_D_236590500_3_3', 'D_236590500_6_6_D_182786508_6'.
#'
#' @export
categorize_variable_pattern <- function(variable_name) {
  # Define regular expression patterns
  standard_pattern   <- '^D_\\d{9}(?:_D_\\d{9}){0,2}$'
  long_tail_pattern  <- '^D_\\d{9}_(\\d)_(\\d)_D_\\d{9}(?:_\\1){23}$'
  short_tail_pattern <- '^D_\\d{9}_(\\d+)_\\1_D_\\d{9}_(\\1)(?:_\\1)?$'
  # how could we find a string pattern that matched D_CID_D_TUBLIG_D_CID
  
  # Categorize the variable name
  category <- dplyr::case_when(
    stringr::str_detect(variable_name, standard_pattern)   ~ "standard",
    stringr::str_detect(variable_name, long_tail_pattern)  ~ "long_tail",
    stringr::str_detect(variable_name, short_tail_pattern) ~ "short_tail",
    TRUE ~ "none"
  )
  
  return(category)
}
