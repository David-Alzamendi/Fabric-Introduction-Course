# Exercise 4 - Using Notebooks to Copy Data Between Staging and Operations Lakehouses

In this exercise, you will:
1. Import two notebooks into your Microsoft Fabric workspace:
   - **Notebook 1:** `persistent_staging_area_create_table.ipynb` to create tables in the operations Lakehouse (`lh_operations`).
   - **Notebook 2:** `persistent_staging_area_copy_data.ipynb` to copy data from the staging Lakehouse (`lh_staging`) to the operations Lakehouse (`lh_operations`).
2. Execute the notebooks to move data between the staging and operations Lakehouses, both part of the Bronze Layer.

[Create Table File](<../../media/Import Notebooks/persistent_staging_area_create_table.ipynb>)

[Copy Data File](<../../media/Import Notebooks/persistent_staging_area_copy_data.ipynb>)


**Duration:** 30 minutes

---

## **Objectives**
- Learn to import and execute notebooks in Microsoft Fabric.
- Create tables in the operations Lakehouse using a pre-configured notebook.
- Copy data from the staging Lakehouse to the operations Lakehouse using another pre-configured notebook.

**Make sure youare in the Analytis Workspace when importing the notebooks.**
---

## **Pre-requisites**
1. Ensure you have:
   - A **staging Lakehouse (`lh_staging`)** with raw data.
   - An **operations Lakehouse (`lh_operations`)** created in your analytics workspace.
2. Download the two required notebooks from the following links:
   - [Notebook 1: persistent_staging_area_create_table.ipynb](<../../media/Import Notebooks/persistent_staging_area_copy_data.ipynb>)

   - [Notebook 2: persistent_staging_area_copy_data.ipynb](<../../media/Import Notebooks/persistent_staging_area_copy_data.ipynb>)

---

## **Step 1 - Import the Notebooks**

1. Navigate to the ** Hub** in your **Analytics Workspace**.

   **Make sure youare in the Analytis Workspace when importing the notebooks.**

2. Click **Upload** and select **Browse**.

    ![Import Notebook](<../../media/Import Notebooks/Import Notebook - (1).png>)

3. Click **Import Notebook** in the notebook interface.

    ![Import](<../../media/Import Notebooks/Import Notebook - (2).png>)


5. Repeat the steps to import **Notebook 2: persistent_staging_area_create_table.ipynb**.

---

## **Step 2 - Execute Notebook 1: Create Tables**

1. Open the **Notebook 1: persistent_staging_area_create_table.ipynb**.

   ![Open Notebook](<../../media/Import Notebooks/Import Notebook - (3).png>)

2. Attach the notebook to the **operations Lakehouse (`lh_operations`)**.

      ![existing lakehouses](<../../media/Import Notebooks/existing-lhs.png>)
   

    
    ![alt text](<../../media/Import Notebooks/Import Notebook - (5).png>)

    ![alt text](<../../media/Import Notebooks/Import Notebook - (6).png>)

3. Make sure you define the operations lakehouse as the default lakehouse.

   ![Default Lakehouse](<../../media/Import Notebooks/default-lakehouse.png>)

4. Click **Run All** to execute all cells in the notebook.

    
    ![Run Notebook](<../../media/Import Notebooks/Import Notebook - (8).png>)


5. Verify the tables have been created by navigating to the **operations Lakehouse 



---

## **Step 3 - Execute Notebook 2: Copy Data**

1. Open the **Notebook 2: persistent_staging_area_copy_data.ipynb**.
2. Attach the notebook to both:
   - The **staging Lakehouse (`lh_staging`)** for reading data.
   - The **operations Lakehouse (`lh_operations`)** for writing data.

    ![Attach Lakehouse](<../../media/Import Notebooks/Import Notebook - (4).png>)

    
    ![alt text](<../../media/Import Notebooks/Import Notebook - (5).png>)

    ![alt text](<../../media/Import Notebooks/Import Notebook - (6).png>)


3. Replace the following values with your correct workspaces name

   ![Replace workspace names](<../../media/Import Notebooks/workspaces_name.png>)

4. Make sure you define the operations lakehouse as the default lakehouse.

   ![Default Lakehouse](<../../media/Import Notebooks/default-lakehouse.png>)

5. Click **Run All** to execute all cells in the notebook.


6. Verify the data has been copied by navigating to the **operations Lakehouse (`lh_operations`)** and checking the relevant folders or tables.

---

## **Step 4 - Validation**

1. Navigate to the **Operations Warehouse Hub**:
   - Open the **Operations Lakehouse (`lh_operations`)**.
   - Verify that the data has been successfully copied from the **staging Lakehouse (`lh_staging`)** by checking the tables or data folders.

2. (Optional) Use a SQL endpoint to query the data in the **operations Lakehouse** to validate the data movement.

 
3. (Optional) Cross-check the data in the staging Lakehouse to ensure data consistency.

---

## **Summary**

You have successfully:
1. Imported and executed a notebook to create tables in the operations Lakehouse (`lh_operations`).
2. Imported and executed a notebook to copy data from the staging Lakehouse (`lh_staging`) to the operations Lakehouse.
3. Validated that data has been successfully moved and transformed within the Bronze Layer.

This exercise demonstrates how to manage and automate data movement between Lakehouses in **Microsoft Fabric** using pre-configured notebooks.
