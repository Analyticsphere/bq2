library(bigrquery)
library(data.table)
library(tidyverse)
library(dplyr)
library(reshape)  
library(stringr)
library(plyr)
library(DBI)
library(quarto)
library(arsenal)
library(glue)

#select tier
tier       <- "dev"
outputpath <- "sql"
export_lists_of_variables <- FALSE


# Use switch to select the project based on the tier
project <- switch(tier,
                  prod = "nih-nci-dceg-connect-prod-6d04",
                  stg  = "nih-nci-dceg-connect-stg-5519",
                  dev  = "nih-nci-dceg-connect-dev",
                  "unknown-environment"  # Default value if none of the cases match
)


# Authenticate to BigQuery
bq_auth()

#flat datasets that need to be queried
flatdatasets <- dbListTables(con)
#excluding the tables with special variable issues/structures
special_tables = c("module1_v1_JP", "module1_v2_JP", "module2_v1_JP", "module2_v2_JP", "module3_v1_JP", "module_4_v1_JP")
flatdatasets = flatdatasets[flatdatasets %nin% special_tables]

source("~/Desktop/bq2/bq2/generate_no_pii_sql_query.R", local = TRUE)
#now lets use the query generation function: 
for(i in 1:length(flatdatasets)){
  generate_nonpii_sql_query(project = project, tier = tier, table = flatdatasets[i])
}











#lets compare the current output with the original query generators output
compare_variables <- function(file1, file2) {
  # Function to clean variable names
  clean_vars <- function(vars) {
    vars <- gsub('["]', '', vars)  # Remove quotes
    vars <- gsub('[0-9]+ ', '', vars)  # Remove row numbers and trailing space
    vars <- gsub(',$', '', vars)  # Remove trailing commas
    vars
  }
  
  # Read the variable names from each file
  vars_file1 <- readLines(file1)
  vars_file2 <- readLines(file2)
  
  # Clean the variable names
  vars_file1 <- clean_vars(vars_file1)
  vars_file2 <- clean_vars(vars_file2)
  
  # Remove empty strings, if any
  vars_file1 <- vars_file1[vars_file1 != ""]
  vars_file2 <- vars_file2[vars_file2 != ""]
  
  # Count the number of variables in each file
  count_file1 <- length(vars_file1)
  count_file2 <- length(vars_file2)
  
  # Find overlapping variables
  overlapping_vars <- intersect(vars_file1, vars_file2)
  
  # Find variables unique to each file
  unique_file1 <- setdiff(vars_file1, vars_file2)
  unique_file2 <- setdiff(vars_file2, vars_file1)
  
  # Return the counts, overlapping variables, and unique variables
  list(
    count_file1 = count_file1,
    count_file2 = count_file2,
    overlapping_vars = overlapping_vars,
    unique_to_file1 = unique_file1,
    unique_to_file2 = unique_file2
  )
}


original_bio_survey_path <- "/Users/sansalerj/Desktop/bq2/bq2/updated_bq2_query_gen/bioSurvey_v1_JP.txt"
new_bio_survey_path <- "/Users/sansalerj/Desktop/bq2/bq2/original_bq2_query_gen/bioSurvey"
biosurvey_compare <- compare_variables(original_bio_survey_path, new_bio_survey_path)


original_clin_bio_survey_path <- "/Users/sansalerj/Desktop/bq2/bq2/original_bq2_query_gen/clinicalBioSurvey"
new_clin_bio_survey_path <- "/Users/sansalerj/Desktop/bq2/bq2/updated_bq2_query_gen/clinicalBioSurvey_v1_JP.txt"
clin_biosurvey_compare <- compare_variables(original_clin_bio_survey_path, new_clin_bio_survey_path)


