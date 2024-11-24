# Exercise 8 - Adding Notebooks to a Fabric Pipeline with Parameters

In this exercise, you will:
1. Integrate the two notebooks, `persistent_staging_area_create_table.ipynb` and `persistent_staging_area_copy_data.ipynb`, into a **Fabric Pipeline**.
2. Use parameters to dynamically configure and execute the pipeline for the following tables:
   - **Person**
   - **Customer**
   - **Territory**
   - **Sales Order Header**
3. Execute the pipeline and validate the results in the **`lh_operations`** Lakehouse.

**Duration:** 30 minutes

---

## **Objectives**
- Learn to configure and execute notebooks in a Fabric Pipeline.
- Use dynamic parameters to process multiple tables.
- Validate results in the `lh_operations` Lakehouse.

---

## **Pre-requisites**
1. Ensure you have:
   - A Fabric workspace named `std-000-datamovement`.
   - Lakehouses: **`lh_staging`** and **`lh_operations`**.
   - The two notebooks already imported:
     - `persistent_staging_area_create_table.ipynb`
     - `persistent_staging_area_copy_data.ipynb`
2. Familiarity with Fabric Pipeline basics.

---

## **Step 1 - Create the Pipeline**

1. Navigate to the data movement workspace.
2. Select **+ New** → **Pipeline**.
3. Name the pipeline as **`pl_loadoperations`** and click **Create**.

    
     ![Load Operations](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (4).png>)
---

## **Step 2 - Add Notebook Activities**

### **Add the Create Table Notebook**

1. Drag and drop a **Notebook** activity into the pipeline canvas.
2. Configure the activity:
   - **Name:** `createPersonTable`
   - **Notebook:** Select `persistent_staging_area_create_table.ipynb`.
   - **Base Parameters:**
     | **Name**               | **Type** | **Value**            |
     |------------------------|----------|----------------------|
     | `source_lakehouse_name` | String   | `lh_staging`         |
     | `source_table_name`     | String   | `Person_Person`      |
     | `destination_lakehouse` | String   | `lh_operations`      |
     | `destination_table_name`| String   | `Person`             |
     | `merge_ID_column`       | String   | `BusinessEntityID`   |

    
    ![Create Person Table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (7).png>)

3. Repeat these steps for each table, changing the parameters accordingly, you can duplicate the task and change the values.

   - **Customer:**
     | **Name**               | **Value**            |
     |------------------------|----------------------|
     | `source_table_name`     | `Sales_Customer`    |
     | `destination_table_name`| `Customer`         |
     | `merge_ID_column`       | `CustomerID`       |

     
      ![Create Customer Table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (8).png>)

   - **Territory:**
     | **Name**               | **Value**              |
     |------------------------|------------------------|
     | `source_table_name`     | `Sales_SalesTerritory`|
     | `destination_table_name`| `Territory`           |
     | `merge_ID_column`       | `TerritoryID`         |

     
      ![Create Territory Table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (10).png>)

      
   - **Sales Order Header:**
     | **Name**               | **Value**                  |
     |------------------------|----------------------------|
     | `source_table_name`     | `Sales_SalesOrderHeader` |
     | `destination_table_name`| `SalesOrderHeader`       |
     | `merge_ID_column`       | `SalesOrderID`           |

     ![Create Sales Table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (12).png>)

---

### **Add the Copy Data Notebook**

1. Drag and drop another **Notebook** activity (or copy an existing task) into the canvas and link it to the corresponding **Create Table** activity.
2. Configure the activity:
   - **Notebook:** `persistent_staging_area_copy_data.ipynb`.
   - **Name:** Follow the same naming pattern as the table (e.g., `CopyPersonTable`).
   - **Base Parameters:** Use the same parameters as the **Create Table** notebook.

   Example for **Person**:
   ![Person Copy](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (6).png>)

3. Repeat these steps for each table:
   - **Customer**:
     
     ![Customer table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (9).png>)
   
   - **Territory**:
     
      ![Territory Tbale](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (11).png>)

   - **Sales Order Header**:
      
      ![Sales Table](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (13).png>)

---

## **Step 3 - Validate Pipeline Execution**

1. Execute the pipeline.
2. Monitor execution in the **Monitor Hub** to ensure all activities complete successfully.

---

## **Step 4 - Validate the Results in the Operations Lakehouse**

1. Navigate to the **`lh_operations`** Lakehouse.
2. Verify the tables:
   - `Customer`
   - `Person`
   - `Territory`
   - `SalesOrderHeader`

   
      ![Validate Tables](<../../media/Notebook Add to Pipeline/Pipeline Add Notebooks - (14).png>)


3. Use the SQL endpoint to query the tables and validate the data:
   ```sql
   SELECT TOP 10 * FROM Customer;
   SELECT TOP 10 * FROM Person;
   SELECT TOP 10 * FROM Territory;
   SELECT TOP 10 * FROM SalesOrderHeader;
