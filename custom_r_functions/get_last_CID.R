#' Extract Last CID from Compound Names and Return as Integer
#'
#' This function takes a vector of compound names and returns an integer vector of the 
#' last CIDs (Chemical Identifier) found in each compound name. If no CID is found, 
#' NA is returned for that entry. The function ensures that the output is an unnamed 
#' integer vector.
#'
#' @param compound_cid_names A character vector containing compound names from which the 
#' last CID needs to be extracted.
#' @return An unnamed integer vector of the same length as `compound_cid_names`, 
#' containing the last CID from each compound name as integer values. Returns NA for 
#' entries with no CID.
#' @importFrom dplyr %>%
#' @examples
#' get_last_CID(c("D_108733102_1_1", "D_637540387_2_2", "NoNumber"))
#' # [1] 108733102 637540387       NA
#' @export
get_last_CID <- function(compound_cid_names){
  require(dplyr)

  # Internal function to process a single name and return integer CID
  extract_last_CID <- function(compound_cid_name) {
    cid_vector <- strsplit(compound_cid_name, '[^0-9]+')[[1]] %>%
      .[. != ""] # Remove empty strings
    
    if (length(cid_vector) > 0) {
      return(as.integer(cid_vector[length(cid_vector)]))
    } else {
      return(NA_integer_) # Return NA_integer_ if no numbers are found
    }
  }
  
  # Apply the internal function to each element of the input vector and unname the result
  unname(sapply(compound_cid_names, extract_last_CID))
}
