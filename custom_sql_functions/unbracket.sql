/* unbracket: 
Description: 
    Handle "false array" survey variables
GH Issue: 
    https://github.com/Analyticsphere/bq2/issues/6
Usage:
    SELECT unbracket(CID) AS CID FROM BQ2.table
*/
CREATE TEMP FUNCTION BQ2.unbracket(col_name STRING) AS (
  CASE
    WHEN col_name = "[]" THEN NULL
    ELSE REGEXP_REPLACE(col_name, r'\[(\d{9})\]', r'\1')
  END
);