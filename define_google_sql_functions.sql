# Initialize user-defined GoogleSQL functions to be used in BQ2 queries


/* unbracket: 
Description: 
    Handle "false array" survey variables
GH Issue: 
    https://github.com/Analyticsphere/bq2/issues/6
Usage:
    SELECT BQ2.unbracket(CID) AS CID FROM BQ2.table
*/
CREATE OR REPLACE FUNCTION BQ2.unbracket(col_name STRING) AS (
  CASE
    WHEN col_name = "[]" THEN NULL
    ELSE REGEXP_REPLACE(col_name, r'\[(\d{9})\]', r'\1')
  END
);


/* yesorno
Description:
    Convert 0/1 to 353358909/104430631 for select-all-that-apply variables
GH Issue: 
    https://github.com/Analyticsphere/bq2/issues/5
Usage:
    SELECT BQ2.yesorno(CID) AS CID FROM BQ2.table
*/
CREATE OR REPLACE FUNCTION BQ2.yesorno(col_name STRING) AS (
  CASE
    WHEN col_name = "1" THEN "353358909"
    WHEN col_name = "0" THEN "104430631"
  END
);