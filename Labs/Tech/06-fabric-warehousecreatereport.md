# Exercise 6 - Configuring the Default Semantic Model and Creating a Report

In this exercise, you will configure the **default semantic model** for the warehouse endpoint from the **`lh_staging`** lakehouse. This will allow you to create a Power BI report directly from the lakehouse data using the semantic model.

**Duration:** 20 minutes

---

## Objectives

- Configure the default semantic model for a warehouse endpoint in **Microsoft Fabric**.
- Create a Power BI report using the configured semantic model.

---

## Pre-requisites

Ensure you have the following:

1. Access to a **Fabric Analytics Workspace** with the **`lh_staging`** lakehouse created.
2. Data loaded into **`lh_staging`**.

---

## Step 1 - Navigate to the Lakehouse

1. Open your **Analytics Workspace** .
2. Select the **`lh_staging`** SQL Endpoint.

   ![SQL Endpoint](<../../media/Warehouse Create report/manage default semantic model - (0).png>)

---

## Step 2 - Configure the Default Semantic Model

1. Inside the **`lh_staging`** lakehouse, locate the **Default Semantic Model** option in the toolbar.

   ![Default Semantic Model](<../../media/Warehouse Create report/manage default semantic model - (1).png>)


2. Select All  **`Tables`** or the ones you want to include in the semantic model. For example:
   
   ![Configure Semantic Model](<../../media/Warehouse Create report/manage default semantic model - (2).png>)
   

5. Confirm.

   > **Note:** Once published, this semantic model will act as the foundation for Power BI reporting.

---

## Step 3 - Test the Semantic Model in Power BI

1. Without leaving this section, click on new report.
   
   ![New Report](<../../media/Warehouse Create report/manage default semantic model - (3).png>)

2. Enable the trial license if required.

   ![Trial](<../../media/Warehouse Create report/manage default semantic model - (4).png>)

3. Drag and drop fields from the semantic model tables into the canvas to create visualizations. 

   ![Semantic Model](<../../media/Warehouse Create report/manage default semantic model - (5).png>)

4. Save the report as **`Report_lh_staging`**.

---

## Key Benefits of Using Semantic Models

1. **Ease of Use:** Semantic models simplify the process of creating reports by predefining relationships and measures.
2. **Efficiency:** Analysts can focus on building insights rather than preparing datasets.
3. **Scalability:** Semantic models enable a consistent reporting structure across multiple users and tools.

---

## Summary

In this exercise, you:

1. Configured the **default semantic model** for the **`lh_staging`** lakehouse.
2. Created a Power BI report using the semantic model.

Semantic models streamline the reporting process, allowing for faster and more consistent insights from your lakehouse data.
