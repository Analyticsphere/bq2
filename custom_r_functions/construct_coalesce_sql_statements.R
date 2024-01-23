#' Construct SQL Statements for Coalescing Variables
#'
#' Constructs a SQL query that coalesces variables based on their grouped standardized names.
#'
#' @param grouped_variables A list of variable names grouped by their standardized form (output from `group_variables`).
#' @param table_name A string representing the name of the SQL table.
#' @return A string representing the SQL statements (not a full query)
#' @examples
#' grouped_vars <- group_variables(variable_names)
#' construct_coalesce_sql_statements(grouped_vars, "project.dataset.table")
#' @export
construct_coalesce_sql_statements <- function(grouped_variables) {
  query_parts <- lapply(names(grouped_variables), function(name) {
    vars <- grouped_variables[[name]]
    coalesce_str <- paste(vars, collapse = ", ")
    glue("COALESCE({coalesce_str}) AS {name}")
  })
  
  sql_statements <- paste(query_parts, collapse = ",\n")
  
  return(sql_statements)
}