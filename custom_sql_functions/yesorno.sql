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