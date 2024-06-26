# bq2

SQL query development for Connect for Cancer Preventions' BQ2 database.

## Contents

-   The `query_generators/` subdirectory contains functions that generate a sql query to clean each table
-   Queries are written to a `.sql` file in the `sql/` subdirectory.
-   Custom GoogleSQL functions are written to `.sql` files in the `custom_sql_functions/` sub-directory. Each function is written for a particular use case that is described in the header comment of the file.
-   Custom R functions reference in the query_generators are stored in `custom_r_funnctions/`

## Intention for this repository

All members of the BQ2 team can clone the "main" branch of this repo. Pull requests should be limited to improvements to the code that are well documented and will work in everyone's environment. Once CI/CD protocols are required to push this code to GCP, we can set up a 'dev', 'stg' and 'prod' branch. Documentation for all transformations performed will be documented below.

------------------------------------------------------------------------

# Documentation of Transformations from BQ1 to BQ2

For each query_generator (i.e., for each table), our process will be: 1. Generate list of **all** variables from BQ schema 2. Remove **all** PII 3. Remove **all** Deprecated vars 4. Remove **all** variables that are not in data dictionary 5. Explicitly add exceptions to he above removals with appropriate handling (e.g., COALESCE) - Assign each specific case to an issue and document separately - Use seperate custom_r_functions for each use case

**NOTE:** - Each inclusion, exclusion or transformation criterion should be associated with a seperate function - Each function should generate a mini-report that lists all varaibles that were affected so that these decisions can be documented and reviewed by non-technical Connect folks.

``` mermaid
flowchart LR

 subgraph BQ1["BQ1"]
    C[("Connect")]
    FC[("FlatConnect")]
    CC[("CleanConnect")]
    DC[("DeIdConnnect")]
  end
  
 subgraph BQ2["BQ2"]
    DID[("Individual\nLevel\nData")]
    SD[("Sensitive Data")]
    DASHVIEW[("Aggregated\nData")]
  end
  
 subgraph Users["IAM User Groups"]
    USERA[["External A"]]
    USERB[["External B"]]
    USERC[["Internal A"]]
    USERD[["Internal B"]]
  end
  
 subgraph POSIT["Posit-Connect"]
    DASH["Stakeholder \nMetrics \nDashboard"]
  end

    DID -- Aggregate --> DASHVIEW
    DASH -. Access .-> USERA
    DASHVIEW -. Access .-> USERB
    C -- Flatten --> FC
    FC -- Clean --> CC
    CC -- De-identify --> DC
    CC -- "Scheduled\nTransfer" --> SD
    DC == "Scheduled\nTransfer" ==> DID
    F("Firestore") == "Scheduled\nTransfer" ==> C
    DID -. Restrictive Access .-> USERC
    SD -. Very Restrictive Access .-> USERD
    DASHVIEW -- API --> DASH

    style F fill:#f5cc84,stroke:#333,stroke-width:2px 
    style BQ1 fill:#D6EAF8,stroke:#333,stroke-width:2px
    style BQ2 fill:#D1F2EB,stroke:#333,stroke-width:2px
    style POSIT fill:#E8DAEF,stroke:#333,stroke-width:2px
    style Users fill:#f4e4e9,stroke:#333,stroke-width:2px
```

======= \## Diagrams

#### For now we will focus on populating `cleanConnect` and `deIdConnect` in BQ1 so that BQ2 will be easy to populate later.

``` mermaid
flowchart LR

 subgraph BQ1["BQ1"]
    C[("Connect")]
    FC[("FlatConnect")]
    CC[("CleanConnect")]
    DC[("deIdConnnect")]
  end

    C -- Flatten --> FC
    FC -- Clean,\nMerge versions,\nFilter --> CC
    CC -- De-identify,\nDerive agregate\nvariables --> DC
    F("Firestore") == "Scheduled\nTransfer" ==> C

    style F fill:#f5cc84,stroke:#333,stroke-width:2px 
    style BQ1 fill:#D6EAF8,stroke:#333,stroke-width:2px
```

#### BQ2 might look something like this.

``` mermaid
flowchart LR

 subgraph BQ1["BQ1"]
    C[("Connect")]
    FC[("FlatConnect")]
    CC[("CleanConnect")]
    DC[("deIdConnnect")]
  end
  
 subgraph BQ2["BQ2"]
    DID[("Individual\nLevel\nData")]
    SD[("Sensitive Data")]
    DASHVIEW[("Aggregated\nData")]
  end
  
 subgraph Users["IAM User Groups"]
    USERA[["External A"]]
    USERB[["External B"]]
    USERC[["Internal A"]]
    USERD[["Internal B"]]
  end
  
 subgraph POSIT["Posit-Connect"]
    DASH["Stakeholder \nMetrics \nDashboard"]
  end

    DID -- Aggregate --> DASHVIEW
    DASH -. Access .-> USERA
    DASHVIEW -. Access .-> USERB
    C -- Flatten --> FC
    FC -- Clean --> CC
    CC -- De-identify --> DC
    CC -- "Scheduled\nTransfer" --> SD
    DC == "Scheduled\nTransfer" ==> DID
    F("Firestore") == "Scheduled\nTransfer" ==> C
    DID -. Restrictive Access .-> USERC
    SD -. Very Restrictive Access .-> USERD
    DASHVIEW -- API --> DASH

    style F fill:#f5cc84,stroke:#333,stroke-width:2px 
    style BQ1 fill:#D6EAF8,stroke:#333,stroke-width:2px
    style BQ2 fill:#D1F2EB,stroke:#333,stroke-width:2px
    style POSIT fill:#E8DAEF,stroke:#333,stroke-width:2px
    style Users fill:#f4e4e9,stroke:#333,stroke-width:2px
```

#### This Lucid Chart diagram is an evolving schematic of the table-level details

![Schematic of transformations from BQ1 to BQ2](images/bq2-setup.png)[Lucid Chart](https://lucid.app/lucidchart/7d4864f5-3e19-4210-8da8-99a6c98ff6b7/edit?viewport_loc=-404%2C-59%2C3328%2C1587%2C0_0&invitationId=inv_45fd4ac7-8213-43b5-951d-240389f6b138)

## Table-specific transformations

Below we will document transformations that are (A) planned, (B! in-progress, and (C) finalized, for each dataset. This will serve to organize the bq2 team and help us communicate with leadership about problems we identify and solutions that we implement.

These generic transformations will be applied to each table:

-   Filter out PII-variables
-   Filter out participants (verification status, consent)
-   Merge multiple versions of tables (or of variables)
-   QC check and correct variable names
-   QC check and correct values

### Module 1

-   Partition YEAR and AGE into seperate columns [CID: d_317093647] <https://github.com/Analyticsphere/bq2/issues/8>
-   Correct/consolidate CIDs for <SURGERY_AGE> and <SURGERY_YEAR> <https://github.com/Analyticsphere/bq2/issues/4>
-   Convert 0/1 to yes/no (CIDs: 104430631/353358909) for *select-all-that-apply* variables <https://github.com/Analyticsphere/bq2/issues/5>
-   Remove unnecessary brackets from "false array" viarables - [CID1], [CID2], [], NULL --\> CID1, CID2, NULL <https://github.com/Analyticsphere/bq2/issues/6>
-   Consolidate loop variables w/ similar "CID2_N_CID3_N" naming patterns <https://github.com/Analyticsphere/bq2/issues/7>

### Module 2

-   update me \_\_\_

# Operational Assumptions

Here we will discuss which reference materials we can use to guide various filters or naming conventions in our ETL for generating the BQ2 queries.

## Column-level filters

### PII

We are operating under the assumptions that

1.  the `PII` column in the data dictionary flags variables with `"Yes"` if they are to be **excluded from BQ2**
2.  the `PII` column in the data dictionary flags variables with `"No"` if they are to be **included in BQ2**

### Deprecated Variables

We are operating under the assumptions that 1. When a variable is listed as `"Deprecated"` in the `Deprecated, New, or Revised` column of the Data Dictionary, it should be **excluded from BQ2**. 2. When a variable is listed as `"New"` or `"Revised"` in the `Deprecated, New, or Revised` column of the Data Dictionary, it should be **included in BQ2** unless other filters apply.

## Row-level Filters

We are operating under the assumptions that 1. Unverified participants should not be included in BQ2 2. Participants that have withdrawn consent should not be included in BQ2 3. When participants have started and/or completed multiple versions of a module, only the responses two the latest version they completed should be included in BQ2.

## Naming Convention Assumptions

### Loop Variables

Loop variables are given `_N` tags by Quest where `N` represents iteration of the question corresponding the Nth child or Nth occurrence that a question is referring to.

We have been told to rename these variables with the form `D_CID2_D_CID3_N`.

### Reporting on these Filters and Naming Conventions

Each column-level filter, row-level filter, transformation or name change in our queries should have an associated report that is generated that explains the filters/transformations applied and which variables or participants were affected.
