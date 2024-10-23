# README - ABAP Programs Repository

## Overview
This repository contains multiple ABAP programs with distinct functionalities that demonstrate different SAP programming concepts, such as working with BAPIs, reading data from SAP tables, and parameter handling. Below is a brief description of each program in this repository.

---

### Program: **Z_QI_237_FIRSTPROGRAM**
**Description:**
This program collects student details from the user via input parameters (`firstName`, `lastName`, `studentNumber`) and outputs a formatted message with the student's full name and student number.

**Key Features:**
- Uses user-defined types (`str_student`) for structuring student data.
- Demonstrates the use of PARAMETERS for capturing user input.
- Outputs data with the `WRITE` statement.

---

### Program: **Z_QI_237_CUSTOMERS**
**Description:**
This program reads customer data from the `KNA1` table, allowing users to search by a specified search term (customer short name). If records are found, customer details are displayed. If no matching records are found, an appropriate message is shown.

**Key Features:**
- Uses `SELECT` to query customer details.
- Handles search parameters using `PARAMETERS`.
- Outputs customer data or an error message if no data is found.

---

### Program: **Z_QI_237_BAPI**
**Description:**
This program demonstrates how to retrieve customer address details using the BAPI `BAPI_CUSTOMER_GETDETAIL2`. The user provides a customer number, and the program returns address information such as name, street, city, and country.

**Key Features:**
- Makes use of BAPI function calls for retrieving customer details.
- Demonstrates parameter handling for user input.
- Outputs the retrieved customer address information.

---

### Program: **Z_QI_287_BAPI (Improved Version)**
**Description:**
An improved version of the `Z_QI_237_BAPI` program. It uses the same BAPI `BAPI_CUSTOMER_GETDETAIL2` to retrieve and display customer address information. This version corrects minor output formatting issues.

---

### Program: **Z_QI_287_EXERCISETASK1**
**Description:**
This program retrieves detailed information about a sales order using the BAPI `BAPI_SALESORDER_GETDETAIL2`. It fetches sales order header information, line items, scheduling lines, and pricing conditions.

**Key Features:**
- Utilizes a BAPI to retrieve sales order details.
- Displays order header information, line items, quantities, and prices.
- Handles multiple data structures (`bapisdhd`, `bapisditm`, `bapischdl`, `bapicond`).
- Demonstrates how to loop through data retrieved from BAPI calls.

---

### Program: **Z_QI_272_EXERCISETASK2**
**Description:**
This program retrieves sales order information directly from the `VBAK` and `VBAP` tables based on the user's input for sales order number. It displays basic order header information and line items without the use of BAPIs.

**Key Features:**
- Directly accesses SAP tables (`VBAK`, `VBAP`).
- Retrieves and displays order header and line item details.
- Demonstrates simple table querying using `SELECT`.

---

### **Comparison of Task 1 and Task 2**
- **Task 1** (BAPI-based) gathers more detailed information by retrieving scheduling lines and pricing conditions, ensuring data integrity and adherence to business rules. It is ideal for complex business processes.
- **Task 2** (Direct table access) is more efficient for simple requirements or performance-critical scenarios where less overhead is desired. It avoids the complexities and overhead of using BAPIs and is suitable for straightforward tasks.

---

## How to Use
1. **Clone the Repository:**
   ```bash
   git clone <repository-url>
   ```
2. **Program Execution:**
   Each program is designed to be executed within the SAP ABAP environment. To run a program, ensure you:
   - Create a new program in the SAP system.
   - Copy the relevant code from this repository into your ABAP editor.
   - Execute the program in the ABAP runtime environment.

3. **Input Parameters:**
   - Ensure you provide the required input parameters as prompted by each program.

4. **Error Handling:**
   Programs handle errors such as missing records or failed data retrievals by outputting meaningful messages to the user.

---

## License
This project is licensed under the MIT License. Please refer to the LICENSE file for details.

---

Feel free to contribute by adding more ABAP programs or improving the existing code!
