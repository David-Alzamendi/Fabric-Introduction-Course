# Exercise 3 - Using Fabric Pipeline and Copy Wizard to Load Data into the Staging Lakehouse

In this exercise, you will use **Microsoft Fabric Pipeline** and the **Copy Data Wizard** to move data from an **Azure SQL Database** into the **staging Lakehouse (`lh_staging`)**. This process ingests raw data into the Bronze Layer, which is essential for further processing and analysis.

**Duration:** 30 minutes

---

## **Objectives**
- Learn to create a Fabric pipeline.
- Use the Copy Data Wizard to define data movement between an Azure SQL Database and the Lakehouse.
- Configure source and destination connections for efficient data movement.

---

## **Pre-requisites**
1. Ensure you have a **staging Lakehouse (`lh_staging`)** already created in the **Analytics Workspace**.
2. Have access to the following **Azure SQL Database**:

| **Field**                | **Value**                                                       |
|--------------------------|-----------------------------------------------------------------|
| **Fully qualified domain name** | `sql-dataanalytics-aue-dev.database.windows.net`                  |
| **Database name**        | `AdventureWorks`                                             |
| **User name**            | `fabric_login`                                             |
| **Password**             | `F@br1cC0urs3`                               |

3. Ensure you have permissions to create pipelines and access both the source database and destination Lakehouse.

---

## **Step 1 - Create a Fabric Pipeline**

1. Navigate to the **Development Workspace** in **Microsoft Fabric**.

      ![Data Movement Workspace](<../../media/Pipeline Copy AdventureWorks/pipeline - (1).png>)
2. Select **New Item**.
   
   ![Create New Pipeline](<../../media/Pipeline Copy AdventureWorks/pipeline - (3).png>)
3. Select **Pipeline** to create a new pipeline.
   
   ![Create New Pipeline](<../../media/Pipeline Copy AdventureWorks/pipeline - (4).png>)
   
4. Name the pipeline (e.g., `pl_loadadventureworks`) by clicking on the pipeline name at the top of the screen.
   
   ![Name the Pipeline](<../../media/Pipeline Copy AdventureWorks/pipeline - (5).png>)
    

---

## **Step 2 - Add the Copy Data Activity**

1. Use the Copy Assistant

    ![alt text](<../../media/Pipeline Copy AdventureWorks/pipeline - (6).png>)
    


2. In the **Source** tab of the wizard:
   - Select **Azure SQL Database** as the source type.
   - Click **New Connection** to create a linked service for the source:

   | **Field**                | **Value**                                                       |
   |--------------------------|-----------------------------------------------------------------|
   | **Fully qualified domain name** | `sql-dataanalytics-aue-dev.database.windows.net`                  |
   | **Database name**        | `AdventureWorks`                                             |
   | **User name**            | `fabric_login`                                             |
   | **Password**             | `F@br1cC0urs3`     
      
   ![Select Azure SQL Database](<../../media/Pipeline Copy AdventureWorks/pipeline - (7).png>)

   Create connection.

   Once you enter the connection string and database name, a connection might become available in the drop down "adventureworks", use that one.

   - ![Select connection](<../../media/Pipeline Copy AdventureWorks/select-connection-2.png>)
      
   If that's not the case, complete the registration.


   - ![Create connection](<../../media/Pipeline Copy AdventureWorks/create-connection.png>)

   Select all tables.

   - ![Select All Tables](<../../media/Pipeline Copy AdventureWorks/pipeline - (9).png>)



3. In the **Destination** tab:
   - Select **Lakehouse** as the destination type.
   - Choose the staging Lakehouse (`lh_staging`) from the list.

   ![Select destination](<../../media/Pipeline Copy AdventureWorks/pipeline - (10).png>)


4. Click **Next** to preview the mapping.


    ![Mapping](<../../media/Pipeline Copy AdventureWorks/pipeline - (11).png>)

   You will have to wait a few seconds before you can continue so it can map the columns for all the tables.

5. Click **Next** to preview the settings and then **Save and Run** to save the Copy Data activity configuration.

    ![Save and Run](<../../media/Pipeline Copy AdventureWorks/pipeline - (13).png>)

---

## **Step 3 - Test and Debug the Pipeline**

1. Run the pipeline.
    ![Run the pipeline](<../../media/Pipeline Copy AdventureWorks/pipeline - (14).png>)
    

2. Monitor the execution:
   - Navigate to the **Monitor Hub** to view the pipeline run status and debug any errors.

    ![Monitor Pipeline](<../../media/Pipeline Copy AdventureWorks/pipeline - (15).png>)

---


## **Summary**

You have successfully:
1. Created a Fabric pipeline.
2. Used the Copy Data Wizard to configure data movement between an Azure SQL Database and the
