/* yesorno
Description:
    Convert 0/1 to 353358909/104430631 for select-all-that-apply variables
GH Issue: 
    https://github.com/Analyticsphere/bq2/issues/5
Usage:
    SELECT yes_or_no(CID) AS CID FROM BQ2.table
*/
CREATE TEMP FUNCTION yes_or_no(col_name STRING) AS (
  CASE
    WHEN col_name = "1" THEN "353358909"
    WHEN col_name = "0" THEN "104430631"
  END
);
