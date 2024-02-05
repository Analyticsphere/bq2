#' Retrieve Schema Information for a Specific Table
#'
#' This function queries the Google BigQuery INFORMATION_SCHEMA.COLUMN_FIELD_PATHS view to retrieve the schema
#' information for a specific table within a given project and dataset. It uses the `bigrquery` library to execute
#' the query and download the results.
#'
#' @param project A string specifying the Google Cloud project ID.
#' @param dataset A string specifying the dataset ID within the project.
#' @param table A string specifying the name of the table for which to retrieve the schema information.
#'
#' @return A data frame containing the schema information of the specified table, with columns for each field path
#'         and its corresponding attributes.
#'
#' @examples
#' # Assuming you have appropriate Google Cloud credentials set:
#' project_id <- "nih-nci-dceg-connect-prod-6d04"
#' dataset_id <- "FlatConnect"
#' table_name <- "module1_v1_JP"
#' schema_info <- get_schema(project_id, dataset_id, table_name)
#' print(schema_info)
#'
#' @export
get_schema <- function(project, dataset, table) {
library(bigrquery)
library(glue)
  
sql <- glue("SELECT * 
               FROM `{project}.{dataset}`.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS 
               WHERE table_name='{table}'")
  
query <- bq_project_query(project, query = sql)
  
schema <- bq_table_download(query, 
                              bigint="integer64", n_max = Inf, 
                              page_size = 500, quiet = TRUE)
  
return(schema)
}
