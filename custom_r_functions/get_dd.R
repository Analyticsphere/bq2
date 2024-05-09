#' Retrieve Data Dictionary from URL
#'
#' This function downloads a data dictionary from a given URL. It has an option to 
#' remove personally identifiable information (PII) if required. The current 
#' implementation does not yet handle the PII removal and this is marked as a TODO item.
#'
#' @param remove_pii A logical parameter. If TRUE, the function should remove PII 
#' from the data dictionary. Currently, this feature is not implemented (marked as TODO).
#' @return A dataframe containing the data dictionary downloaded from the URL.
#' @importFrom utils read.csv
#' @examples
#' data_dictionary <- get_dd()
#' data_dictionary_no_pii <- get_dd(remove_pii = TRUE) # Not yet implemented
#' @export
get_dd <- function(remove_pii = FALSE){
    # Get updated data dictionary
    urlfile <-  "https://raw.githubusercontent.com/episphere/conceptGithubActions/master/csv/masterFile.csv" 
    rename_array <- c("primary_source_cid" = "concept_id",
                      "secondary_source_cid" = "concept_id_1",
                      "source_question_cid" = "concept_id_2",
                      "question_cid" = "concept_id_3",
                      "variable_cid" = "concept_id_4",
                      "source_question" = "current_source_question",
                      "question_text" = "current_question_text",
                      "format_value" = "current_format_value")
    dd <- read.csv(urlfile) %>%
      janitor::clean_names() %>%
      dplyr::rename(any_of(rename_array)) %>%
      dplyr::select(primary_source_cid,
                    primary_source,
                    secondary_source_cid,
                    secondary_source,
                    source_question_cid,
                    source_question,
                    deprecated_new_or_revised,
                    question_cid,
                    question_text,
                    variable_cid,
                    variable_name,
                    variable_label,
                    variable_type,
                    variable_length,
                    format_value,
                    pii)
    
    # Placeholder for PII removal code
    # if (remove_pii) {
    #   # Code to remove PII goes here
    # }
    return(dd)
}
