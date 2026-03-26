# healthcare-analytics-dashboard

# 🏥 Massachusetts General Hospital Analytics Dashboard


## 📌 Project Overview

Healthcare organizations often struggle with fragmented data across patient visits, financial records, and engagement metrics, making it difficult to derive actionable insights.

This project builds a **centralized analytics dashboard** to help stakeholders:

- Monitor patient utilization trends  
- Understand payer contribution and financial performance  
- Identify cost drivers across services  
- Analyze patient engagement and retention  

---

## 🎯 Objective

The objective was to analyze **patient encounters, treatment costs, payer coverage, and behavioral trends** to assist in preparing performance insights for hospital operations.

The analysis was focused on three key areas:

1. **Encounters Overview**  
   Understanding trends in patient visits, encounter types, and duration of care.

2. **Cost & Coverage Insights**  
   Analyzing payer contribution, insurance coverage, and cost distribution across services.

3. **Patient Behavior Analysis**  
   Studying visit frequency, patient engagement, and retention patterns.

The goal was to transform raw healthcare data into **actionable insights** that can support planning, improve care delivery, and optimize operational efficiency.

---

## 🗂️ Data Overview

The dataset consists of structured healthcare data capturing **patient demographics, encounters, procedures, payer information, and hospital organizations**.  
It enables analysis of **patient utilization, cost distribution, and healthcare service patterns**.

### 1. Patients

Contains demographic and personal information of patients.

- **patient_id**: Unique identifier for each patient  
- **first_name**: Patient’s first name  
- **last_name**: Patient’s last name  
- **gender**: Gender of the patient  
- **birth_date**: Date of birth  
- **death_date**: Date of death (if applicable)  
- **age**: Age of the patient  
- **marital_status**: Marital status of the patient  
- **race**: Race classification  
- **ethnicity**: Ethnicity group  
- **city**: City of residence  
- **state**: State of residence  
- **zip_code**: ZIP code  



### 2. Encounters

Captures detailed records of patient visits and healthcare interactions.

- **encounter_id**: Unique identifier for each encounter  
- **patient_id**: Reference to the patient  
- **organization_id**: Hospital or organization identifier  
- **payer_id**: Insurance or payer identifier  
- **encounter_class**: Type of encounter (Ambulatory, Emergency, Inpatient, etc.)  
- **start_date**: Start date of the encounter  
- **end_date**: End date of the encounter  
- **duration_hours**: Duration of visit in hours  
- **base_encounter_cost**: Base cost of the encounter  
- **total_claim_cost**: Total billed cost  
- **payer_coverage**: Amount covered by payer  
- **reason_code**: Code representing reason for visit  
- **reason_description**: Description of the reason  



### 3. Procedures

Contains details of medical procedures performed during encounters.

- **patient_id**: Reference to the patient  
- **encounter_id**: Associated encounter ID  
- **procedure_code**: Code of the medical procedure  
- **procedure_description**: Description of the procedure  
- **base_cost**: Cost of the procedure  
- **reason_code**: Code for procedure reason  
- **reason_description**: Description of procedure reason  


### 4. Payers

Stores information about insurance providers and payers.

- **payer_id**: Unique identifier for the payer  
- **payer_name**: Name of the insurance provider  
- **city**: City of payer headquarters  
- **state_headquartered**: State of headquarters  
- **zip_code**: ZIP code  
- **phone**: Contact number  


### 5. Organizations

Contains details about healthcare institutions and facilities.

- **id**: Unique identifier for the organization  
- **name**: Name of the hospital or organization  
- **city**: City location  
- **state**: State location  
- **zip_code**: ZIP code  

---

## 🛠️ Tech Stack

- **Excel** – Data extraction and initial exploration  
- **Python (Jupyter Notebook)** – Data cleaning and preprocessing  
- **SQL** – Data transformation and creation of analytical views  
- **Power BI** – Data modeling, DAX calculations, and dashboard visualization  

---

## 🧩 Data Modeling

<img width="1774" height="760" alt="Data Modelling" src="https://github.com/user-attachments/assets/9e11b821-40ae-4374-a32e-7731afcdbdc0" />


---

## 📊 Dashboard Pages

### 🏠 Main Page
A navigation landing page that provides structured access to key analytical views:
 
<img width="1302" height="734" alt="Home Page" src="https://github.com/user-attachments/assets/97881f4d-ba23-46d9-b9dd-b4e59c24d623" />

---

### 🧑‍⚕️ Patient Visit Overview

Focuses on patient volume and service utilization.

<img width="1301" height="734" alt="1  Overview" src="https://github.com/user-attachments/assets/64533147-c291-4d60-8efe-ce9074eb299d" />

---

### 💰 Financial & Payer Analysis

Focuses on revenue distribution and cost drivers.

<img width="1330" height="734" alt="2  Financial Insights" src="https://github.com/user-attachments/assets/b588c0f9-f785-4020-8340-0815fb2b5a3f" />

---

### 👤 Patient Behavior Analysis

Focuses on patient engagement and retention.

<img width="1299" height="724" alt="3  Behavior" src="https://github.com/user-attachments/assets/7b823414-2437-41b4-b5e6-3739218fb9ea" />

---

## 💡 Key Insights

- **Medicare contributes ~40% of total revenue**, indicating strong dependency on a single payer.  
- **Uninsured patients (~31%) represent a significant share**, highlighting potential financial risks.  
- **Ambulatory services drive the highest total cost**, while emergency care has the highest cost per visit.  
- **87% of patients are repeat users**, indicating strong retention.  
- A large portion of patients fall under **high-frequency visits (5+ visits)**, suggesting recurring healthcare needs.
- Despite high healthcare spending, only **30.64% of costs are insured**, increasing patients' out-of-pocket burden significantly.

---

## 📌 Recommendations

- **Diversify payer mix** to reduce dependency on Medicare  
- Improve **revenue collection strategies** for uninsured patients  
- Optimize **ambulatory services** to control overall cost  
- Monitor high-frequency patients for **preventive care strategies**  
- Investigate patient trends to maintain consistent engagement  



# Links
## 🔗 Live Dashboard

📊 [Live Dashboard](https://app.powerbi.com/view?r=eyJrIjoiOWU3NDYzOWItYmQ1ZC00YzhmLWI2YmEtYzE5ZjA4MmY5OWViIiwidCI6ImVjMTU1NWRlLTlmMDAtNDQ1OS05MDA3LTUxNDc2NDQ3MDIwNyJ9)
