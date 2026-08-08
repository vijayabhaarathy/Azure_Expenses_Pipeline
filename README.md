# MyExpenses AI

Azure-based personal finance data platform that ingests bank and credit card statements (PDF and CSV), stores normalized transactions in Azure SQL, supports categorization workflows, and powers analytics through Power BI.

## Project objective

Create a reliable, automated personal finance platform that:

* Extracts transactions from PDF statements using Azure Document Intelligence.
* Supports bulk CSV imports for historical and manual uploads.
* Stores clean, deduplicated transactions in Azure SQL.
* Enables category and subcategory management.
* Provides analytics and dashboards through Power BI.
* Serves as the foundation for future AI-powered transaction classification.

## Architecture

```text
                 PDF Statements
                        │
                        ▼
                 Azure Logic App
                        │
                        ▼
         Azure Document Intelligence (OCR)
                        │
                        ▼
          Normalized transaction extraction
                        │
                        ▼
                Azure SQL Database
                        ▲
                        │
                Azure Data Factory
                        ▲
                        │
                   CSV Statements

                Azure SQL Database
                        │
                        ▼
                     Power BI
```

## Technology stack

* Azure Logic Apps
* Azure Document Intelligence
* Azure Data Factory (ADF)
* Azure SQL Database
* Power BI
* GitHub

Future:

* Azure OpenAI
* SQL semantic views
* Balance modeling
* AI-assisted categorization

## Current data sources

### Credit cards

* HDFC Millennia
* HDFC Diners
* Axis ACE

### Bank accounts

* HDFC Savings
* SBI Savings

Current dataset size: **~4,800+ transactions**

## Database design

### Primary table

`dbo.Transactions`

Key columns:

| Column              | Purpose                            |
| ------------------- | ---------------------------------- |
| Id                  | Primary key                        |
| TransactionDate     | Transaction date                   |
| Description         | Merchant / transaction description |
| Amount              | Transaction amount                 |
| ExpenseType         | Debit / Credit                     |
| CardName            | Card or account name               |
| AccountType         | Credit Card / Savings              |
| Category            | Expense category                   |
| SubCategory         | Expense subcategory                |
| AccountNo_Ref       | Account reference                  |
| SourceFileName      | Source statement                   |
| ProcessingTimestamp | Ingestion timestamp                |
| StatementDate       | Statement period reference         |

## Ingestion pipelines

### PDF pipeline (Logic App)

Workflow:

1. Trigger on PDF upload.
2. Analyze document using Azure Document Intelligence.
3. Extract transaction fields.
4. Detect Debit/Credit.
5. Normalize data.
6. Insert into Azure SQL.

### HDFC statement handling

HDFC statement formats changed and no longer consistently expose `Cr/Dr`.

Current credit detection uses the **full transaction content** rather than only the Amount field.

Primary detection pattern:

* `+ ₹` → Credit
* Otherwise → Debit

### CSV pipeline (ADF)

Purpose:

* Historical imports
* Manual uploads
* Data corrections

Requirements:

* Dates must be `yyyy-MM-dd`
* Amount must be numeric
* CSV formatting is manual by design

## Deduplication

Current SQL unique constraint:

* TransactionDate
* Description
* Amount
* ExpenseType
* StatementDate
* AccountNo_Ref

Purpose:

* Prevent duplicate uploads.
* Allow transaction reversals.
* Support recurring monthly transactions.

Known enhancement:

Add document row offset / span offset to distinguish identical same-day transactions within a statement.

## Category management

Categories are updated through a controlled workflow.

### Temporary table

`dbo.CategoryUpdates`

Columns:

* Id
* Category
* SubCategory

Workflow:

1. Export uncategorized transactions.
2. Update Category/SubCategory in CSV.
3. Upload CSV to Blob.
4. Execute `pipeline_categoryUpdates`.
5. Run SQL update join.

This preserves the raw transaction table while allowing bulk category updates.

## Power BI

Current dashboards:

* Monthly expense breakdown
* Category distribution
* Subcategory analysis

Current model uses **TransactionDate** for reporting.

## Design principles

This project intentionally follows a data engineering approach rather than a bookkeeping approach.

### Raw data is immutable

Transactions are never deleted or overwritten.

### Analytics is derived

Reporting logic should be implemented through:

* SQL views
* Power BI measures
* Semantic models

not by modifying historical transactions.

### Reversible transformations

All analytical logic should be reversible and should preserve original transaction records.

## Known limitations

### Internal transfers

Transfers between personal accounts currently inflate savings metrics.

Example:

HDFC1 → HDFC2

HDFC2 → RD

The same money can be counted twice.

Planned solution:

Implement a SQL VIEW with `EffectiveAmount` that offsets internal transfers while preserving raw data.

### Bank balances

Current model tracks only transaction flows.

Missing:

* Opening balances
* Closing balances
* Cash holdings

Future work includes a balance table for proper cash and net-worth analysis.

### CSV formatting

ADF is sensitive to date formatting.

Historical debugging lesson:

Large numbers of skipped rows are usually caused by **date format coercion** rather than deduplication logic.

## Future roadmap

### Phase 2

* SQL transfer offset view
* EffectiveAmount calculation
* Transfer classification

### Phase 3

* Azure OpenAI categorization
* Merchant reuse logic
* Confidence scoring
* Review workflow

### Phase 4

* Balance modeling
* Cash vs savings analytics
* Investment tracking
* Trend analysis
* YoY comparisons
* Rolling 3-month metrics

## Repository structure

```text
Azure_Expenses_Pipeline/
│
├── LogicApp/
├── ADF/
│   ├── pipelines/
│   ├── datasets/
│   └── linkedServices/
├── SQL/
│   ├── tables/
│   ├── procedures/
│   └── views/
├── PowerBI/
└── README.md
```

## Current status (v1.0)

Working:
- PDF ingestion
- CSV ingestion
- Azure SQL storage
- Deduplication
- Category update workflow
- Power BI integration

Open work:
1. SQL view for transfer offset logic
2. Power BI monthly comparison metrics
3. Balance modeling (opening/closing balances)
4. AI-assisted categorization using Azure OpenAI
