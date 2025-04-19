
-- File: cleaning_raw_datasets.sql
-- Author: q1
-- Date: 2025.04.19
-- Description: This script cleans and standardizes raw imported data in PostgreSQL for the Medspa BI Project.


--------------------------------------------------
-- 1. Clean invalid date values in invoice_raw
--------------------------------------------------

UPDATE invoice_raw
SET date = NULL
WHERE TRIM(date::TEXT) = '' OR date::TEXT !~ '^\d{4}-\d{2}-\d{2}$';

-- Convert 'date' column to proper DATE type
ALTER TABLE invoice_raw
ALTER COLUMN date TYPE DATE USING date::DATE;

-- Convert numeric fields in invoice_raw to NUMERIC
ALTER TABLE invoice_raw
ALTER COLUMN qty TYPE NUMERIC USING qty::NUMERIC,
ALTER COLUMN price TYPE NUMERIC USING price::NUMERIC,
ALTER COLUMN discounts TYPE NUMERIC USING discounts::NUMERIC,
ALTER COLUMN tax TYPE NUMERIC USING tax::NUMERIC,
ALTER COLUMN total_due TYPE NUMERIC USING total_due::NUMERIC,
ALTER COLUMN amount TYPE NUMERIC USING amount::NUMERIC;

--------------------------------------------------
-- 2. Clean and convert date columns in visit_history_raw
--------------------------------------------------

-- Clean 'appt_date' and 'date_created'
UPDATE visit_history_raw
SET appt_date = NULL
WHERE TRIM(appt_date::TEXT) = '' OR appt_date::TEXT !~ '^\d{4}-\d{2}-\d{2}$';

UPDATE visit_history_raw
SET date_created = NULL
WHERE TRIM(date_created::TEXT) = '' OR date_created::TEXT !~ '^\d{4}-\d{2}-\d{2}$';

-- Convert to DATE type
ALTER TABLE visit_history_raw
ALTER COLUMN appt_date TYPE DATE USING appt_date::DATE,
ALTER COLUMN date_created TYPE DATE USING date_created::DATE;

-- Convert numeric fields
ALTER TABLE visit_history_raw
ALTER COLUMN amount TYPE NUMERIC USING amount::NUMERIC,
ALTER COLUMN paid TYPE NUMERIC USING paid::NUMERIC,
ALTER COLUMN balance TYPE NUMERIC USING balance::NUMERIC;

--------------------------------------------------
-- 3. Fix phone number columns in client_info_raw
--------------------------------------------------

-- Change phone number fields to TEXT to avoid integer overflow
ALTER TABLE client_info_raw
ALTER COLUMN homephone TYPE TEXT,
ALTER COLUMN workphone TYPE TEXT,
ALTER COLUMN cellphone TYPE TEXT;
