# Exercise 13: Real-Time Analytics with Fabric

In this exercise, you will explore **Fabric Real-Time Analytics** by creating an **Eventstream** and an **Eventhouse**. These components simulate real-time stock updates and demonstrate how Real-Time Analytics (RTA) can power data-driven applications.

---

## **Duration**: 20 minutes

---

## **Objective**

By the end of this exercise, you will:
- Create an **Eventhouse** for structured and scalable data storage.
- Create an **Eventstream** to capture and process events in real time.
- Create a shortcut to the Eventhouse tables in a Lakehouse for operational reporting.
- Query and analyze real-time stock updates.

---

## **Scenario**

You are managing a warehouse where real-time stock updates are critical for inventory accuracy. This exercise simulates stock movements using Real-Time Analytics, enabling you to track and analyze inventory changes in real time.

---

## **Steps**

### **Step 1: Create an Eventhouse**
1. **Navigate to your Analytics workspace**.
   - Open the Fabric portal and access the **Analytics workspace**.

    ![Eventhouse](<../../media/RTA Stock/RTA stock - (1).png>)  
    *This screenshot shows where to create a new Eventhouse.*

2. **Create a new Eventhouse**.
   - Click **+ New Item** and select **Eventhouse**.
   - Name it `eh_stock` and click **Create**.

    ![Name](<../../media/RTA Stock/RTA stock - (2).png>)  
    *Name the Eventhouse to reflect its purpose, such as tracking stock movements.*

3. **Access the Eventhouse database settings**.
   - Open the Eventhouse and navigate to the database.

    ![Select database](<../../media/RTA Stock/RTA stock - (15).png>)  
    *This image shows where to find the database settings for your Eventhouse.*

4. **Enable OneLake replication**.
   - Toggle the OneLake replication option to allow integration with other Fabric services.

    ![Enable OneLake](<../../media/RTA Stock/RTA stock - (16).png>)  
    *Replication ensures seamless synchronization of data.*

5. **Confirm the setup**.
   - Click **Turn On** to activate OneLake replication.

    ![Turn On](<../../media/RTA Stock/RTA stock - (17).png>)  
    *This ensures the Eventhouse is ready for downstream integrations.*

---

### **Step 2: Create an Eventstream**
1. **Navigate to the Real-Time Analytics experience**.
   - Locate the **RTA** section in the Fabric portal.

    ![Select RTA](<../../media/RTA Stock/RTA stock - (3).png>)  
    *This screenshot shows where to access Real-Time Analytics.*

2. **Select a test data source**.
   - Choose from the available test data options to simulate real-time events.

    ![Test Data](<../../media/RTA Stock/RTA stock - (4).png>)  
    *Test data helps simulate real-time updates for practice.*

3. **Set up the Eventstream**.
   - Name it `es_stock` or `es_rentals` and click **Connect**.

    ![Rename](<../../media/RTA Stock/RTA stock - (6).png>)  
    *The name should reflect the stream's purpose.*

    ![Connect](<../../media/RTA Stock/RTA stock - (7).png>)  
    *Establish the connection to capture data in real time.*

4. **Edit the Eventstream**.
   - Open the Eventstream and click on **Edit mode**.

    ![Open the Eventstream](<../../media/RTA Stock/RTA stock - (8).png>)  
    *This step allows you to configure the Eventstream settings.*

    ![Edit mode](<../../media/RTA Stock/RTA stock - (12).png>)  
    *This image shows how to enable editing mode.*

5. **Define the data destination**.
   - Set the destination as the `eh_stock` Eventhouse created earlier.

    ![Destination](<../../media/RTA Stock/RTA stock - (13).png>)  
    *Ensure the Eventstream sends data to the correct Eventhouse.*

6. **Configure the destination**.
   - Map fields appropriately to ensure compatibility.

    ![Configure](<../../media/RTA Stock/RTA stock - (20).png>)  
    *Accurate configuration ensures smooth data flow.*

7. **Publish the Eventstream**.
   - Once the configuration is complete, click **Publish**.

---

### **Step 3: Validate Your Setup**
1. **Navigate to your Eventhouse and query the table**.
   - Open the Eventhouse and run a query to verify data ingestion.

    ![Query table](<../../media/RTA Stock/RTA stock - (23).png>)  
    *This step confirms that real-time data is being captured and stored.*

---

### **Step 4: Create a Shortcut to the Eventhouse**
1. **Open your operational Lakehouse**.
   - Navigate to your Lakehouse to integrate the Eventhouse data.

    ![Create shortcut](<../../media/RTA Stock/RTA stock - (25).png>)  
    *This step links the Eventhouse data for operational reporting.*

2. **Select OneLake as the shortcut destination**.

    ![Select OneLake](<../../media/RTA Stock/RTA stock - (26).png>)  
    *Choose OneLake to ensure compatibility with Fabric services.*

3. **Select the Eventhouse and confirm**.
   - Identify the Eventhouse table and create the shortcut.

    ![Select Eventhouse](<../../media/RTA Stock/RTA stock - (27).png>)  
    *Ensure the correct Eventhouse is selected.*

    ![Select table](<../../media/RTA Stock/RTA stock - (28).png>)  
    *This screenshot shows how to select the Eventhouse table.*

    ![Create shortcut](<../../media/RTA Stock/RTA stock - (29).png>)  
    *Finalize the shortcut creation.*

4. **Query the SQL endpoint**.
   - Validate that data is accessible via SQL queries.

    ![Query SQL endpoint](<../../media/RTA Stock/RTA stock - (30).png>)  
    *Ensure the SQL endpoint is working as expected.*

5. **Verify the table data**.
   - Check that the data is ready for reporting and analysis.

    ![See table data](<../../media/RTA Stock/RTA stock - (31).png>)  
    *This ensures all data is flowing correctly through the pipeline.*

---

## **Summary**
In this exercise, you:
1. Created an **Eventhouse** to store structured data for analytics.
2. Configured an **Eventstream** to capture and process real-time events.
3. Linked the Eventhouse to a **Lakehouse** for operational reporting.
4. Validated the data pipeline by querying the Eventhouse and Lakehouse.

This process demonstrates the ability of Fabric Real-Time Analytics to handle dynamic data needs, such as inventory tracking, IoT event processing, and financial monitoring.
