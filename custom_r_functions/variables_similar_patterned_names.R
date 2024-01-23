#to create the function to identify the variable with the same name patterns: dup.names
#author: Jing Wu 
#' Group Variables which have similar name patterns defined by their CID2, CID3 and numbers of the extensions of digits
#'
#' This function checks and extracts the variable names/column names of a dataset which are #' used in any other variable names to further check these variable sharing the same name 
#' patterns 
#'
#' @param schema  stands for a schema of the dataset .
#' @return A wide table "dupvar.dt2" which contains variables classified by "simple.name_x", "long.name_x" in the columns sharing" with same name patterns  shown in the column as "var.pattern" in a schema of a dataset
#' @examples
#' dupvar_v2 <- dup.names(schem_m1_v2)
#' dupvar_v2[c(1:4,67,68),]
#'  var.pattern                 n longer.name_1                       simple.name_1           longer.name_2
#'   <chr>                   <int> <chr>                               <chr>                   <chr>        
#' 1 D_115616118_D_403180970     1 D_115616118_D_115616118_D_403180970 D_115616118_D_403180970 NA 


dup.names  <- function(schema){
  
  data <- schema
  var.names <- data$column_name
  dupvar.dt <- NULL
  for(i in 1:length(var.names)){
    name <- var.names[i]
    dup_vars <- var.names[grepl(name,var.names)]
    tmpDF <- data.frame(name=name,dup.vars=dup_vars)
    dupvar.dt <- rbind(dupvar.dt,tmpDF)
  }
  names(dupvar.dt) <- c("var.pattern","dup.vars")
  
  dupvar.dt <- dupvar.dt %>% filter(.,var.pattern %in% var.pattern[duplicated(var.pattern)])
  tmp <- dupvar.dt %>%
    filter(.,var.pattern %in% var.pattern[duplicated(var.pattern)]) %>%
    mutate(varname_type = ifelse(var.pattern == dup.vars,"simple.name","longer.name")) %>%
    group_by(var.pattern,varname_type,dup.vars) %>% 
    dplyr::summarise(n =n()) %>% 
    group_by(var.pattern,varname_type) %>% 
    mutate(cum.n=cumsum(n))
  
  dupvar.dt2 <- tmp %>%
    dplyr::group_by(var.pattern,varname_type,cum.n) %>%
    pivot_wider(names_from = c(varname_type,cum.n), values_from = dup.vars, values_fill = NA)
  
  return(dupvar.dt2)
}
