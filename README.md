# bq2

SQL query development for Connect for Cancer Preventions' BQ2 database.

## Contents

-   `generate_bq2_queries.qmd` is an R notebook that generates SQL
    queries for each BQ2 table
-   Queries are written to a `.sql` file in the `sql/` subdirectory.
-   Custom GoogleSQL functions are written to `.sql` files in the
    `custom_sql_functions/` sub-directory. Each function is written for
    a particular use case that is described in the header comment of the
    file.

## Intention for this repository

All members of the BQ2 team can clone the "main" branch of this repo.
Pull requests should be limited to improvements to the code that are
well documented and will work in everyone's environment. Once CI/CD
protocols are required to push this code to GCP, we can set up a 'dev',
'stg' and 'prod' branch. Documentation for all transformations performed 
will be documented below.


--------------------------------------------------------------------
# Documentation of Transformations from BQ1 to BQ2

Below we will document transformations that are (A) planned, (B) in-progress, 
and (C) finalized, for each dataset. This will serve to organize the bq2 team
and help us communicate with leadership about problems we identify and solutions
that we implement.

These generic transformations will be applied to each table:

- Filter out PII-variables
- Filter out participants (verification status, consent)
- Merge multiple versions of tables (or of variables)
- QC check and correct variable names
- QC check and correct values

  
## Module 1

#### (A) Planned

#### (B) In-Progress
* Partition YEAR and AGE into seperate columns [CID: d_317093647]  https://github.com/Analyticsphere/bq2/issues/8
  - Problem: 
  - Solution:
  - Files:
* Correct/consolidate CIDs for <SURGERY_AGE> AND <SURGERY_YEAR>    https://github.com/Analyticsphere/bq2/issues/4
* Convert 0/1 to yes/no (CIDs: 104430631/353358909) for Select-all-that-apply-variables     https://github.com/Analyticsphere/bq2/issues/5
* Remove unnecessary brackets from "false array" viarables - [CID1], [CID2], [], NULL --> CID1, CID2, NULL    https://github.com/Analyticsphere/bq2/issues/6
* Consolidate loop variables w/ similar "CID2\_N\_CID3\_N" naming patterns     https://github.com/Analyticsphere/bq2/issues/7

#### (C) Finalized


## Module 2

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Module 3

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Module 4

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Clinical Biospecimen Survey

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Participants Table


## Biospecimen Table


## Biospecimen Survey

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Covid-19 Survey

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


## Menstrual Survey

#### (A) Planned

#### (B) In-Progress

#### (C) Finalized


