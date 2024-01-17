#' Group Variables by Standardized Name
#'
#' This function takes a list of variable names, categorizes them, standardizes them, 
#' and then groups them by their standardized names. It ignores variable names 
#' whose standardized name is NA.
#'
#' @param variable_names A character vector of variable names to be grouped.
#' @return A list where each element is a vector of variable names grouped by 
#' their standardized form, excluding NAs.
#' @examples
#' variable_names <- c("D_111111111_1_1_D_999999999_1_1", 
#'                     "D_111111111_1_1_D_999999999_1_1_1_1", ...)
#' group_variables_by_standardized_name(variable_names)
#' @export
group_variables_by_standardized_name <- function(variable_names) {
  # Categorize each variable name
  categories <- sapply(variable_names, categorize_variable_pattern)
  
  # Standardize variable names with their categories
  standardized_names <- mapply(standardize_variable_name, 
                               variable_name = variable_names, 
                               category = categories, 
                               SIMPLIFY = FALSE)
  
  # Remove NA values
  valid_indices <- !is.na(standardized_names)
  variable_names <- variable_names[valid_indices]
  standardized_names <- standardized_names[valid_indices]
  
  # Group variable names by their standardized names
  grouped_variables <- split(variable_names, unlist(standardized_names))
  return(grouped_variables)
}
