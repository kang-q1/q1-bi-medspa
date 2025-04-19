# 📊 Data Dictionary – Medspa BI Project

This document summarizes the final structure and data types of all cleaned datasets used in the BI analysis.

---

## 🧾 `client_info_raw`

| Column        | Data Type   | Description |
|---------------|-------------|-------------|
| client_id     | INT         | Unique customer ID |
| firstname     | VARCHAR(50) | First name |
| lastname      | VARCHAR(50) | Last name |
| email         | VARCHAR(50) | Email address |
| homephone     | TEXT        | Home phone number |
| workphone     | TEXT        | Work phone number |
| cellphone     | TEXT        | Cell phone number |
| phone         | TEXT        | Extra phone field (not standardized) |
| column9       | VARCHAR(50) | Unknown |
| column10      | VARCHAR(50) | Unknown |
| withphone     | VARCHAR(50) | Unknown flag |
| 6635          | VARCHAR(50) | Unknown |
| column13      | VARCHAR(50) | Unknown |
| without_pho   | VARCHAR(50) | Possibly a flag field |
| 562           | VARCHAR(50) | Unknown |


> 📝 *Note: Some unknown or inconsistent columns (like `6635`, `without_pho`, `column13`, etc.) are retained but will be dropped or ignored during analysis depending on quality.*

---

## 💳 `invoice_raw`

| Column        | Data Type   | Description |
|---------------|-------------|-------------|
| date          | DATE        | Invoice date |
| invoice_id    | INT         | Invoice number |
| client_id     | INT         | Customer ID |
| client_name   | VARCHAR(50) | Customer name |
| service       | VARCHAR(50) | Service name |
| sku           | VARCHAR(50) | SKU code |
| staff         | VARCHAR(50) | Staff who performed the service |
| qty           | NUMERIC     | Quantity |
| price         | NUMERIC     | Unit price |
| discounts     | NUMERIC     | Discount applied |
| tax           | NUMERIC     | Tax applied |
| total_due     | NUMERIC     | Total amount due |
| amount        | NUMERIC     | Actual amount paid |
| payment_ty    | VARCHAR(50) | Payment method |

---

## 📅 `visit_history_raw`

| Column        | Data Type   | Description |
|---------------|-------------|-------------|
| client_id     | INT         | Customer ID |
| client_name   | VARCHAR(50) | Customer name |
| address       | VARCHAR(50) | Address line 1 |
| address2      | VARCHAR(50) | Address line 2 |
| city          | VARCHAR(50) | City |
| state         | VARCHAR(50) | State |
| postal        | VARCHAR(50) | Zip code |
| email         | VARCHAR(50) | Email address |
| homephone     | TEXT        | Home phone |
| workphone     | TEXT        | Work phone |
| cellphone     | TEXT        | Cell phone |
| paid          | FLOAT4      | Amount paid |
| balance       | FLOAT4      | Remaining balance |
| gender        | VARCHAR(50) | Gender |
| birthday      | VARCHAR(50) | Date of birth |
| dnd           | VARCHAR(50) | Do-not-disturb flag |
| campaign      | VARCHAR(50) | Campaign source |
| promo         | VARCHAR(50) | Promo applied |
| amount        | VARCHAR(50) | Visit amount (untyped) |
| appt_date     | DATE        | Appointment date |
| appt_servic   | VARCHAR(50) | Service booked |
| date_create   | DATE        | Customer record creation date |
| sms_remind    | VARCHAR(50) | SMS reminder flag |
| email_conf    | VARCHAR(50) | Email confirmation flag |

