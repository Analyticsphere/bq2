```mermaid

flowchart  LR

    subgraph Operational
        Firestore
      subgraph BQ1
          RC[RawConnect]
          FC[FlatConnect]
          CC[CleanConnect]
      end
    end

    subgraph Researcher-facing
        direction LR

        subgraph BQ2 [BQ2: Registered]
          
          RD[Registered Dataset]
          AG[Aggregate Dataset]
        end
        BQ3[BQ3: Controlled]
        BQ4[BQ4: Participant]
    end

Firestore --"scheduled \n transfer"--> RC

RC --flatten--> FC
FC --"structural \n cleaning"--> CC

CC --"masking/\n coursening/\n de-identification"--> RD
RD --"aggregation"--> AG
RD --> BQ3
RD --"transform"--> BQ4
```

## Operational

##### Firestore
- item 1
- item 2

##### BQ1: 
- item 1
- item 2

## Researcher-facing

##### BQ2: Registered
- item 1
- item 2

##### BQ3: Controlled
- item 1
- item 2

##### BQ4: Participant Return of Results
- item 1
- item 2
