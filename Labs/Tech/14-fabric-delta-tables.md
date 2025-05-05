# Exercise 3 – Explore Delta Table Capabilities in Microsoft Fabric (Python Version)

In this exercise, you will use Python to explore the capabilities of an existing Delta Lake table in Microsoft Fabric. You’ll inspect the underlying storage, modify a record, view version history, query older versions, and verify that a new Delta log file is created.

**Duration:** 25–30 minutes

---

## Objectives

- Access and query a Delta Lake table using PySpark  
- Modify records using Python  
- Explore time travel and Delta transaction logs  
- Verify log file changes in the Lakehouse storage  

---

## Pre-requisites

- Microsoft Fabric Lakehouse access  
- Connected notebook with PySpark runtime  
- Existing Delta table: `lh_staging.Person_Person`  



## Step 1 – View Underlying Files in the Lakehouse

Navigate to your lakehouse following path in the Lakehouse file explorer:

![Select lakehouse](<../../media/Delta Table/select-lakehouse.png>)

```
lh_staging.Person_Person → View files
```

Confirm that at least one JSON log file exists, such as:

![Click View Files](<../../media/Delta Table/delta-view-files.png>)
---


Files available.
![Files](<../../media/Delta Table/delta-files.png>)

The logs table contains logs related to the operations.
The root folder contains the copy of the data.

## Step 2 – Preview Data from the Delta Table
Create a New Notebook.

![Create notebook](<../../media/Delta Table/new-notebook.png>)

Drag and drop the following table.

![Drag and drop](<../../media/Delta Table/notebook-drag-and-drop.png>)


```python
df = spark.sql("SELECT * FROM lh_staging.Person_Person LIMIT 1000")
display(df)
```

---




## Step 3 – Update Data Using PySpark

Add a new field cand update the following value.

![Add code](<../../media/Delta Table/add-code.png>)

```python
spark.sql(spark.sql("""
    UPDATE lh_staging.Person_Person
    SET MiddleName = 'Test'
    WHERE BusinessEntityID = 293
""")
```

---


## Step 4 – Validate the Update

Add a new cell "code" to visualise the change.

```python
df_check = spark.sql("""
    SELECT BusinessEntityID, FirstName, MiddleName
    FROM lh_staging.Person_Person
    WHERE BusinessEntityID = 293
""")
display(df_check)
```

---

## Step 5 – View Table History
![Add code](<../../media/Delta Table/add-code.png>)


Describe the history of the table.

![Describe history](<../../media/Delta Table/delta-describe-history.png>)

```python
history_df = spark.sql("DESCRIBE HISTORY lh_staging.Person_Person")
display(history_df)
```

---

## Step 6 – Time Travel to a Previous Version

```python
df_old = spark.sql("""
    SELECT BusinessEntityID, FirstName, MiddleName
    FROM lh_staging.Person_Person VERSION AS OF 1
    WHERE BusinessEntityID = 1
""")
display(df_old)
```

---

## Step 7 – Verify New Delta Log File

Navigate again to the Lakehouse to see the files available:

![New files](<../../media/Delta Table/delta-see-new-files.png>)

As well as new logs.


![New logs](<../../media/Delta Table/delta-see-logs.png>)


## Step 8 – Reflect and Document

| Action                   | Result Observed                           |
|--------------------------|--------------------------------------------|
| Table Previewed          | Yes                                        |
| Data Updated             | MiddleName = 'Test' for ID = 1             |
| History Viewed           | Update operation visible                   |
| Time Travel Query Used   | Version 0 showed original MiddleName       |
| Delta Log File Changed   | New JSON file appeared in _delta_log folder |

---

## Summary

- Used PySpark to query and update a Delta table  
- Inspected the physical file layout in the Lakehouse  
- Viewed version history using `DESCRIBE HISTORY`  
- Queried past versions using Delta time travel  
- Confirmed log file creation for transactional traceability  
