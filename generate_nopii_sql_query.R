#participants table 
generate_nonpii_sql_query <- function(project, tier, table){

  #download DD
  dd_url <- "https://raw.githubusercontent.com/episphere/conceptGithubActions/master/csv/masterFile.csv" 
  dd <- read.csv(dd_url) 
  non_pii_variables <- dd[dd$PII=="No",]$conceptId.3#I only want the NON PII variables

  sql <- 
    glue("SELECT * 
            FROM `{project}.FlatConnect`.INFORMATION_SCHEMA.COLUMN_FIELD_PATHS 
            WHERE table_name='{table}'")
  query <- bq_project_query(project, query = sql)
  
  #extract 3rd CID
  schema <- bq_table_download(query, bigint="integer64", n_max = Inf, page_size = 500, quiet = TRUE)
  schema$last.CID <- lapply(schema$field_path, get_last_cid)
  #keep non PII
  table_non_pii_variables <- schema[(schema$last.CID %in% non_pii_variables),]$column_name
  table_non_pii_variables <- c(paste0("t.", table_non_pii_variables), "t.Connect_ID") #SQL join syntax

  if(length(table_non_pii_variables) == 0){
    select      <- ""
  }else 
    select      <- paste(table_non_pii_variables,collapse=",\n")
  query       <- glue("SELECT {select} 
                     FROM  `{project}.FlatConnect.{table}` t
                     INNER JOIN `nih-nci-dceg-connect-dev.FlatConnect.participants_JP` p
                     ON cast(t.Connect_ID as int64) = cast(p.Connect_ID as int64)
                    WHERE 
                    p.d_821247024 = '197316935' 
                    AND p.d_747006172 != '353358909'")
  write.table(query,file=paste("/sql", tier, "/", table, ".txt", sep=""), row.names = FALSE, col.names = FALSE, quote = FALSE)
  #write.table(query,file=paste("/Users/sansalerj/Desktop/", "/", table, ".txt", sep=""), row.names = FALSE, col.names = FALSE, quote = FALSE)
  print(paste0(table, "sql query has been written to:", "/sql", tier, "/", table, ".txt"))
}

get_last_cid <- function(compound_cid_name) {
  require(dplyr)
  # get vector of string fragments that are numbers, i.e, no "D_" or "_d_" etc.
  cid_vector <- strsplit(compound_cid_name, '[^0-9]') %>%
    lapply(function(x) {x[!x == ""]} ) %>% # remove empty strings
    unlist()                               # convert from list to character
  last_cid <- cid_vector[length(cid_vector)] 
}