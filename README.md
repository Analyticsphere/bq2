---
editor_options: 
  markdown: 
    wrap: 72
---

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

## Contributions

Jing wrote the originial script and Jake has been editing for clarity
and reproducibility.

## Intention for this repository

All members of the BQ2 team can clone the "main" branch of this repo.
Pull requests should be limited to improvements to the code that are
well documented and will work in everyone's environment. Once CI/CD
protocols are required to push this code to GCP, we can set up a 'dev',
'stg' and 'prod' branch.
