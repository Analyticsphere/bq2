find_variable_patterns <- function(variables) {
    result <- data.frame(variable_pattern = character(), long_variable = character(), stringsAsFactors = FALSE)
    for (i in seq_along(variables)) {
        pattern <- variables[i]
        long_vars <- variables[grepl(pattern, variables) & variables != pattern]# Find variables that contain the current variable
        if (length(long_vars) > 0) {# If long variables are found, add them to the result
            for (long_var in long_vars) {
                result <- rbind(result, data.frame(variable_pattern = pattern, long_variable = long_var, stringsAsFactors = FALSE))
            }}} 
    return(result)}
