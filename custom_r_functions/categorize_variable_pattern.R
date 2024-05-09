#' Categorize Variable Names by Dynamic String Patterns
#'
#' This function categorizes variable names based on custom string patterns 
#' passed as parameters. It enhances flexibility by allowing any set of 
#' patterns and corresponding labels to be used for categorization.
#'
#' @param variable_name A string representing the variable name to be categorized.
#' @param patterns A named list of regular expression patterns where each name 
#' corresponds to a category label (e.g., 'standard', 'long_tail') and each value 
#' is the regex pattern to match for that category.
#'
#' @return A string representing the category of the pattern based on the 
#' provided patterns. If a variable name does not match any of the provided 
#' patterns, it returns 'none'.
#'
#' @examples
#' patterns <- list(
#'   standard = '^D_\\d{9}(?:_D_\\d{9}){0,2}$',
#'   long_tail = '^D_\\d{9}_(\\d)_(\\d)_D_\\d{9}(?:_\\1){23}$',
#'   short_tail = '^D_\\d{9}_(\\d+)_\\1_D_\\d{9}_(\\1)(?:_\\1)?$'
#' )
#' categorize_variable_pattern("D_207494582", patterns) # returns 'standard'
#' categorize_variable_pattern("D_158354252_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1", patterns) # returns 'long_tail'
#' categorize_variable_pattern("D_236590500_3_3_D_236590500_3_3", patterns) # returns 'short_tail'
#' categorize_variable_pattern("Random_Variable_123", patterns) # returns 'none'
#'
#' @details
#' The function iterates over the provided patterns list, checking each pattern
#' against the variable name. The first matching pattern's label is returned as 
#' the category. If no pattern matches, 'none' is returned. This function can 
#' be easily extended or modified by changing the patterns list, making it 
#' versatile for different use cases.
#'
#' @export
#' 
categorize_variable_pattern <- function(
    variable_name, 
    patterns = 
      list(standard   = '^D_\\d{9}(?:_D_\\d{9}){0,2}$',
           long_tail  = '^D_\\d{9}_(\\d)_(\\d)_D_\\d{9}(?:_\\1){23}$',
           short_tail = '^D_\\d{9}_(\\d+)_\\1_D_\\d{9}_(\\1)(?:_\\1)?$')
    ) {
  
    # Validate input
    if (!is.list(patterns) || length(patterns) == 0) {
      stop("Patterns must be a non-empty named list")
    }
    
    # Default category
    category <- "none"
    
    # Check each pattern
    for (label in names(patterns)) {
      if (stringr::str_detect(variable_name, patterns[[label]])) {
        category <- label
        break
      }
    }
    
    return(category)
}
    
# Example usage
patterns <- list(
  standard   = '^D_\\d{9}(?:_D_\\d{9}){0,2}$',
  long_tail  = '^D_\\d{9}(?:_\\d)_D_\\d{9}(?:_\\d){22,}$',
  short_tail = '^D_\\d{9}_(\\d+)_\\1_D_\\d{9}_(\\1)(?:_\\1)?$'
)
    
categorize_variable_pattern("D_207494582", patterns) # returns 'standard'
categorize_variable_pattern("D_158354252_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1", patterns) # returns 'long_tail'
categorize_variable_pattern("D_236590500_3_3_D_236590500_3_3", patterns) # returns 'short_tail'
categorize_variable_pattern("Random_Variable_123", patterns) # returns 'none'
