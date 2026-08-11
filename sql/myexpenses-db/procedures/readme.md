# MyExpenses DB backend

## Overview

The MyExpenses backend processes bank and credit card statements through an Azure Logic App ETL pipeline and classifies transactions using a SQL-based merchant mapping and category derivation workflow.

The architecture is designed to be incremental: once a transaction is finalized, it is never reprocessed.

## Architecture

PDF / Excel statement
↓
Azure Logic App
↓
Azure SQL - Transactions
↓
usp_NormalizeDescriptions
↓
MerchantMapping
↓
MerchantName
↓
usp_DeriveCategories
↓
DerivedCategory / DerivedSubCategory
↓
Manual approval
↓
usp_ApplyApprovedCategories
↓
Category / SubCategory
↓
Status = DONE

## Core tables

### Transactions

Main transaction table containing:

* raw transaction details
* normalized description
* merchant name
* derived category and subcategory
* confidence score
* workflow status

### MerchantMapping

Maps normalized transaction descriptions to merchant names.

NormalizedDescription → MerchantName

This is the primary table that will be updated as new merchants are encountered.

### MerchantMaster

Stores merchant-level category rules.

MerchantName → Category, SubCategory

Supports both:

* general merchant rules
* amount-specific rules

## Status workflow

The `Status` column controls the transaction processing lifecycle.

| Status           | Meaning                                 |
| ---------------- | --------------------------------------- |
| PIPELINE_SUCCESS | Transaction extracted successfully      |
| PIPELINE_REVIEW  | Low-confidence or incomplete extraction |
| MERCHANT_REVIEW  | Merchant mapping not found              |
| CATEGORY_REVIEW  | Derived category requires approval      |
| APPROVED         | User approved derived values            |
| DONE             | Category/SubCategory finalized          |

### Workflow transitions

PIPELINE_SUCCESS
↓
usp_ClassifyTransactions
↓
MERCHANT_REVIEW
↓
Merchant mapping added
↓
CATEGORY_REVIEW
↓
Manual approval
↓
APPROVED
↓
usp_ApplyApprovedCategories
↓
DONE

`DONE` is a terminal state.

All normalization and derivation procedures skip transactions with:

Status = 'DONE'

## Stored procedures

### usp_InsertTransaction

Purpose:

* insert new transactions
* store confidence score
* assign initial pipeline status

Logic App sets:

* PIPELINE_SUCCESS
* PIPELINE_REVIEW

### usp_NormalizeDescriptions

Purpose:

* standardize descriptions
* remove payment prefixes
* remove city names
* normalize merchant patterns
* generate NormalizedDescription

Runs only for transactions where:

Status <> 'DONE'

### usp_DeriveCategories

Purpose:

* derive merchant categories
* apply amount-specific rules
* apply general merchant rules
* assign review statuses

Outputs:

* DerivedCategory
* DerivedSubCategory
* MERCHANT_REVIEW
* CATEGORY_REVIEW

### usp_ApplyApprovedCategories

Purpose:

* copy derived values into final values
* set Status = 'DONE'

Updates:

Category = DerivedCategory

SubCategory = DerivedSubCategory

Status = 'DONE'

## Daily process

1. Upload PDF statement.
2. Logic App extracts transactions.
3. Transactions inserted into SQL.
4. Run classification procedures.
5. Review CATEGORY_REVIEW transactions.
6. Review MERCHANT_REVIEW transactions.
7. Approve derived categories.
8. Apply approved categories.
9. Transactions become DONE.

## Future Power App

The frontend will operate directly on the `Status` workflow.

Dashboard:

* PIPELINE_REVIEW
* MERCHANT_REVIEW
* CATEGORY_REVIEW

Actions:

* approve category
* edit category
* add merchant mapping
* apply changes

The Power App will become the primary review interface.

## Important operational note

If any ETL pipeline fails unexpectedly, first verify the **MerchantMaster pipeline source connection**.

A source connection may have been rewritten during pipeline modifications, which can affect downstream merchant mapping and category derivation.

This should be the first troubleshooting step before investigating SQL procedures or Logic App logic.
