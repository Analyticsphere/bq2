CREATE TEMP FUNCTION combine_and_rename(variables ARRAY<STRING>) AS (
  ARRAY(
    SELECT 
      value
    FROM UNNEST(variables) AS value
    WHERE value IS NOT NULL
  )[OFFSET(0)]
);

SELECT 
  Connect_ID,
  D_116065851_1_1_D_206625031_1_1,
  D_116065851_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1,
  combine_and_rename([D_116065851_1_1_D_206625031_1_1,
                      D_116065851_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1])
                      AS D_116065851_D_206625031_1
FROM FlatConnect.merged_module1 
WHERE D_116065851_1_1_D_206625031_1_1 IS NOT NULL 
OR D_116065851_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1_1 IS NOT NULL;