#' Retrieve Schema Information for a BigQuery Table
#'
#' This function queries the Google BigQuery INFORMATION_SCHEMA to retrieve the schema
#' information for a specified table within a given dataset and project.
#'
#' @param project The Google Cloud project ID as a string.
#' @param dataset The BigQuery dataset ID as a string.
#' @param table The BigQuery table name as a string.
#'
#' @return A tibble containing the schema information of the specified table.
#' @export
#'
#' @examples
#' get_schema("your-project-id", "your-dataset", "your-table")
get_schema <- function(project, dataset, table) {
  # Construct the SQL query to retrieve table schema
  query <- glue::glue(
    "SELECT * 
     FROM `{project}.{dataset}.INFORMATION_SCHEMA.COLUMNS` 
     WHERE table_name = '{table}'"
  )
  
  # Execute the query and return the results
  bigrquery::bq_project_query(project, query = query)
}