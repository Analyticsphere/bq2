/* combine_and_rename: 
Description: 
  -- Combines variables with a given pattern and renames them
  -- Selects the first non-NULL value from the array, if only one value is given 
     for a given participant, then only the version that the participant 
     answered will be given.
  ** Warning: Unit test this for each use case to guarantee it behaves as 
     expected.
GH Issue: 
    https://github.com/Analyticsphere/bq2/issues/7
Usage:
  SELECT 
      combine_and_rename([D_116065851_1_1_D_206625031_1_1_1_1_1_1_1_1_1_1,
           D_116065851_1_1_D_206625031_1_1]) 
           AS D_116065851_D_206625031_1
      combine_and_rename(
          [D_CID2_4_4_D_CID3_4_4, 
           D_CID2_4_D_CID3_4_4_4,
           D_CID2_4_4_D_CID3_4_4_4_4]) AS D_CID2_D_CID3_4
  FROM my_dataset.my_table
*/
CREATE TEMP FUNCTION combine_and_rename(variables ARRAY<STRING>) AS (
  ARRAY(
    SELECT 
      value
    FROM UNNEST(variables) AS value
    WHERE value IS NOT NULL
  )[OFFSET(0)]
);