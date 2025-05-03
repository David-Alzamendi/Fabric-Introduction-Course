# Exercise 2 - Microsoft Fabric Data Stores

In this exercise, you will create the required data stores within **Microsoft Fabric** to support future exercises. This involves creating Lakehouses for the **Bronze layer** and a **Data Warehouse** for the **Gold layer** within the Warehouse Analytics Workspace.

**Duration:** 30 minutes

---

## **Overview**

### **Medallion Architecture**
The **Medallion Architecture** is a widely adopted data architecture pattern that organises data into multiple layers for efficient processing, storage, and analysis. The three layers in the architecture are:

- **Bronze Layer:** Stores raw, unprocessed data ingested from various sources. This layer acts as the staging area for incoming data and is not optimised for analytics.
- **Silver Layer (optional):** Contains cleansed and transformed data, typically enriched with business logic or joined datasets. This layer enables intermediate analysis and serves as a bridge between raw and fully processed data.
- **Gold Layer:** Houses the final, refined datasets optimised for analytics and reporting. This layer is used for generating business insights and supporting decision-making processes.

For this exercise:
- You will create the **Bronze Layer** in the form of staging and operations Lakehouses.
- You will create the **Gold Layer** as a **Data Warehouse** for analytical processing and integration with reporting tools such as Power BI.
- The **Silver Layer** is not included in this exercise but is commonly used for data transformations, deduplication, and applying business rules.

---

## **Step 1 - Create Bronze Area Lakehouses**

1. **Navigate to the Workspace:**
   - Open the **Warehouse Analytics Workspace** in **Microsoft Fabric**.

     ![Select Workspace](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(1).png)


2. **Create the Staging Lakehouse (`lh_staging`):**
   - Click **Create Item** in the workspace.
   
     ![Create Item](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(2).png)
   - Select **Lakehouse** from the options.

     ![Lakehouse](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(4).png)
   - Provide the name `lh_staging` for the Lakehouse and click **Create**.

     ![Create Staging Lakehouse](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(4).png)

   - **Purpose:** This Lakehouse will serve as the **Bronze Layer** for staging raw data. It is overwritten each time the data load executes and is not optimised for analytics.

3. **Review the Provisioned SQL Endpoint:**
   - Once the Lakehouse is created, it will automatically provision a **SQL Endpoint**. This endpoint is read-only and can be used for reporting or executing queries.
   
     ![Review Endpoints](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(5).png)

4. **Create the Operations Lakehouse (`lh_operations`):**
   - Click **Create Item** again and select **Lakehouse**.
   - Provide the name `lh_operations` for this Lakehouse and click **Create**.

     ![Operations](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(7).png)

   - **Purpose:** This Lakehouse will also form part of the **Bronze Layer**. It is designed for operational reporting, using a **Slowly Changing Dimension (SCD) Type 2** model to capture changes to data over time.

---

## **Step 2 - Create the Gold Layer Data Warehouse**

1. **Navigate to the Workspace:**
   - Open the **Warehouse Analytics Workspace** in **Microsoft Fabric**.

2. **Create the Data Warehouse (`wh_datawarehouse`):**
   - Click **Create Item** in the workspace.
   
     ![Create Item](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(2).png)
   - Select **Warehouse** from the options.

     ![Select Warehouse](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(9).png)
   - Provide the name `wh_datawarehouse` and click **Create**.

     ![Warehouse](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(10).png)

3. **Purpose of the Gold Layer:**
   - The Data Warehouse represents the **Gold Layer** in the Medallion Architecture.
   - It houses fully transformed, cleansed, and optimised datasets for reporting and business intelligence.
   - It is directly integrated with Power BI for generating insights.

4. **Review Settings and Connection String:**
   - Navigate to the **Settings** section of the Data Warehouse to explore its configuration options.

     ![Settings](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(11).png)
   - Review the **connection string**, which can be used to connect external tools or processes.

     ![Connection String](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(12).png)

5. **Sync Tables to a Semantic Model:**
   - In the Data Warehouse, you can sync all the tables to a **semantic data model** for integration with Power BI reports.
   
     ![Sync to Semantic Model](../../media/Create%20Data%20Stores/create%20data%20stores%20-%20(13).png)

---

## **Summary**

You have successfully:
1. Created a **staging Lakehouse (`lh_staging`)** for the Bronze Layer to handle raw data ingestion.
2. Created an **operations Lakehouse (`lh_operations`)** for the Bronze Layer to handle persistent operational reporting.
3. Provisioned a **Data Warehouse (`wh_datawarehouse`)** as the Gold Layer for refined and optimised datasets, supporting Power BI reporting.

This setup adheres to the **Medallion Architecture** principles and establishes the foundation for building a modern data integration pipeline in **Microsoft Fabric**.
