#' Create SQL COALESCE Query
#'
#' This function generates a string for a SQL COALESCE function call. It takes two or more 
#' variable names and constructs a COALESCE statement with an alias.
#'
#' @param variables A vector of strings representing the names of variables to be coalesced.
#' @param alias A string representing the alias for the COALESCE function in the SQL query.
#' @return A string representing the SQL COALESCE function.
#' @examples
#' create_coalesce_query(c("var1", "var2", "var3"), "alias_name")
#' @export
#'
#' @importFrom utils stop
create_coalesce_query <- function(variables, alias) {
  if (length(variables) < 2) {
    stop("At least two variables are required for coalescing")
  }
  
  coalesceString <- paste("COALESCE(", paste(variables, collapse = ", "), ")", sep = "")
  queryString <- paste(coalesceString, "AS", alias)
  
  return(queryString)
}
