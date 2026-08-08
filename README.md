# Azure Expenses Pipeline

This repository stores the version-controlled configuration and code for the MyExpenses AI Azure platform.

## Contents

- `infra/resource-group/main.bicep` — Azure resource-group snapshot, including Storage, Document Intelligence, Logic Apps, Event Grid, SQL server/database settings, and managed connections.
- `adf/` — Azure Data Factory pipeline, dataset, linked-service, and trigger definitions.
- `sql/myexpenses-db/` — schema-only SQL project containing tables, views, stored procedures, and security definitions.

## Security boundary

This repository deliberately excludes bank statements, transaction exports, Power BI files, secrets, connection strings, encrypted credentials, tokens, and database rows. ADF credentials are represented by redacted placeholders and must be configured through Key Vault or deployment parameters.

## Export status

This is a source-control baseline exported from the live `myexpenses-suite-rg` resource group. Review and refactor the generated Bicep before treating it as a clean redeployment template.
