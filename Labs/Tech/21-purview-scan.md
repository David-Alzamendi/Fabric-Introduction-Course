# Exercise 2 – Scan an Azure SQL Database and Review Metadata in Microsoft Purview

In this exercise, you will scan an Azure SQL Database using your own account, and then review the discovered metadata within Microsoft Purview. This demonstrates how metadata is automatically ingested and cataloged from traditional data sources.

**Duration:** 20–25 minutes

---

## Objectives

- Connect Microsoft Purview to an Azure SQL Database.
- Trigger a scan of selected schemas and tables.
- Review discovered metadata in the Purview Data Map.

---

## Pre-requisites

Ensure the following are in place:

1. Access to the [Microsoft Purview Portal](https://purview.microsoft.com)
2. Viewer or Data Curator role in Microsoft Purview
3. Access to an Azure SQL Database with metadata to scan
4. The Azure SQL Database must be registered as a data source in Purview
5. A valid Microsoft Entra ID (formerly Azure AD) account for authentication

---

## Step 1 – Navigate to the Microsoft Purview Data Map

1. Open the [Purview portal](https://purview.microsoft.com)
2. From the left-hand menu, select **Data Map** → **Sources**
3. Click on your registered **Azure SQL Database** source
4. Click **+ New Scan**

---

## Step 2 – Configure and Run a Scan

1. Enter a **scan name** (e.g., `AzureSQLScan01`)
2. Choose **Microsoft Entra ID** as the authentication method
3. Select the **database** and **schemas** or **tables** you want to scan
4. Leave the default **scan rule set** selected (or choose a custom one if available)
5. Review the configuration and click **Run**

> *Note: Scans may take a few minutes depending on the size of the database.*

---

## Step 3 – View Discovered Assets

1. Once the scan completes, return to the **Data Map**
2. Use **Browse Assets** or the **Search bar** to locate newly scanned database objects
3. Click on a scanned asset (e.g., a table) to explore:
   - Metadata (name, type, schema)
   - Classifications (e.g., Email Address, Phone Number)
   - Column-level details
   - Related glossary terms (if applicable)

---

## Step 4 – Reflect and Document

Fill in the following table for one asset discovered during the scan:

| **Field**               | **Example Value**         |
|------------------------|---------------------------|
| Asset Name             | customers_table           |
| Asset Type             | Table                     |
| Source System          | Azure SQL Database        |
| Classification Applied | Email Address             |
| Description Available  | Yes / No                  |

---

## Summary

In this exercise, you:

- Connected Microsoft Purview to an Azure SQL Database
- Ran a scan to discover and ingest metadata
- Explored and documented asset details using the Data Map
- Observed how Purview automatically classifies sensitive data
