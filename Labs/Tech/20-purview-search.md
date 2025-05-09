# Exercise 1 – Browse and Search the Data Catalog in Microsoft Purview

In this exercise, you will explore Microsoft Purview’s Data Catalog to locate and review metadata for sample data assets. This is an essential step for understanding how data is classified, governed, and discovered in a modern data estate.

**Duration:** 15 minutes

---

## Objectives

- Learn how to navigate the Microsoft Purview portal.
- Use search and filter capabilities to locate data assets.
- Understand how metadata and classifications are displayed.

---

## Pre-requisites

Ensure you have the following:

1. Access to the [Microsoft Purview Portal](https://purview.microsoft.com/home?tid=2de3958c-ed82-45dd-b08b-b30df437cd37)
2. At least one data source registered with assets scanned.
3. Viewer or Data Curator permissions in Purview.


---

## Step 1 – Open Microsoft Purview Portal

1. Go to [https://purview.microsoft.com/home?tid=2de3958c-ed82-45dd-b08b-b30df437cd37](https://purview.microsoft.com/home?tid=2de3958c-ed82-45dd-b08b-b30df437cd37)

   ![Homepage](../../media/Purview/homepage.png)

2. Sign in with your organizational credentials.
3. From the left-hand menu, click **Solutions**->**Unified Catalog** → **Browse assets**.

   ![Unified catalog](../../media/Purview/unified-catalog-open.png)
---

## Step 2 – Use the Search Feature

1. In the **Search bar**, type a keyword such as `Customer`. You can also type it in the search bar at the top.
2. Press **Enter**.
3. Review the list of results.

  ![Purview Search](../../media/Purview/purview-search.png)
---

## Step 3 – Apply Filters

1. On the left-hand side, apply filters to narrow results:
   - **Asset Type**: Table, File, Power BI Dataset, etc.
   - **Data Source**: Select a known source.
   - **Classification**: E.g., All Full Names, “Email Address”.

![Filter options](../../media/Purview/customer-results.png)

1. Click on a search result to view its metadata.

---

## Step 4 – Explore Metadata and Classifications

1. Select any search result and look at the different property options.

![Properties](../../media/Purview/asset-properties.png)

All the properties can be modified, click on Edit for Schema or Contacts options.

This allows you to modify an existing asset to add more metadata.


![Asset Edit](../../media/Purview/asset-edit.png)

## Summary

In this exercise, you:

- Navigated the Microsoft Purview portal.
- Searched and filtered data assets.
- Reviewed metadata, classifications, and glossary terms.
