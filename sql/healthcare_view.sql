create database healthcare_db;
use healthcare_db;

-- Objective 1 :  Encounters overview
-- Monthly Encounter Trend
SELECT 
    FORMAT(start_date, 'yyyy-MM') AS encounter_month,
    COUNT(*) AS total_encounters
FROM encounters_final
GROUP BY FORMAT(start_date, 'yyyy-MM')
ORDER BY encounter_month;

-- Encounter Class Distribution
SELECT 
    encounter_class,
    COUNT(*) AS total_encounters
FROM encounters_final
GROUP BY encounter_class
ORDER BY total_encounters DESC;

-- Average duration by encounter class
SELECT 
    encounter_class,
    AVG(duration_hours) AS avg_duration_hours
FROM encounters_final
GROUP BY encounter_class
ORDER BY avg_duration_hours DESC;


-- Objective 2: Cost & Coverage Insights
-- Average and total cost by encounter class
SELECT 
    encounter_class,
    COUNT(*) AS total_encounters,
    AVG(total_claim_cost) AS avg_claim_cost,
    SUM(total_claim_cost) AS total_claim_cost,
    AVG(payer_coverage) AS avg_payer_coverage
FROM encounters_final
GROUP BY encounter_class
ORDER BY total_claim_cost DESC;


-- Cost Bucket Analysis
SELECT 
    CASE
        WHEN total_claim_cost BETWEEN 0 AND 3000 THEN '0-3k'
        WHEN total_claim_cost > 3000 AND total_claim_cost <= 6000 THEN '3k-6k'
        WHEN total_claim_cost > 6000 AND total_claim_cost <= 10000 THEN '6k-10k'
        WHEN total_claim_cost > 10000 AND total_claim_cost <= 20000 THEN '10k-20k'
        WHEN total_claim_cost > 20000 AND total_claim_cost <= 50000 THEN '20k-50k'
        WHEN total_claim_cost > 3000 AND total_claim_cost <= 100000 THEN '50k-100k'
        ELSE '100k+'
        END AS cost_bucket,
        COUNT(*) AS encounter_count,
        SUM(total_claim_cost) AS total_bucket_cost
    FROM encounters_final
    GROUP BY
        CASE 
            WHEN total_claim_cost BETWEEN 0 AND 3000 THEN '0-3k'
            WHEN total_claim_cost > 3000 AND total_claim_cost <= 6000 THEN '3k-6k'
            WHEN total_claim_cost > 6000 AND total_claim_cost <= 10000 THEN '6k-10k'
            WHEN total_claim_cost > 10000 AND total_claim_cost <= 20000 THEN '10k-20k'
            WHEN total_claim_cost > 20000 AND total_claim_cost <= 50000 THEN '20k-50k'
            WHEN total_claim_cost > 3000 AND total_claim_cost <= 100000 THEN '50k-100k'
            ELSE '100k+'
        END
    ORDER BY total_bucket_cost DESC;


-- Percentage Contribution of each encounter class to total cost
-- this shows how much each encounter class contributes to overall cost
SELECT 
    encounter_class,
    total_claim_cost,
    ROUND(
        100.0 * total_claim_cost / SUM(total_claim_cost) OVER (),
        2
    ) AS cost_contribution_percent
FROM (
    SELECT 
        encounter_class,
        SUM(total_claim_cost) AS total_claim_cost
    FROM encounters_final
    GROUP BY encounter_class
) t
ORDER BY total_claim_cost DESC;

-- Payer-wise cost and ranking
SELECT
    p.payer_name,
    COUNT(*) AS total_encounters,
    SUM(e.total_claim_cost) AS total_claim_cost,
    AVG(e.total_claim_cost) AS avg_claim_cost,
    RANK () OVER (ORDER BY SUM(e.total_claim_cost)DESC) AS payer_rank
FROM encounters_final e
JOIN payers_final p
    ON e.payer_id = p.payer_id
    GROUP BY p.payer_name
    ORDER BY total_claim_cost DESC;


 -- Objective 3 : Patient Behavior Analysis
 --Top Procedures

 SELECT TOP 10 procedure_description,
  COUNT(*) AS procedure_count FROM procedures_final
    GROUP BY procedure_description ORDER BY procedure_count DESC;


-- Rank patients by encounter count
SELECT 
    patient_id,
    COUNT(*) AS encounter_count,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS patient_rank
FROM encounters_final
GROUP BY patient_id;


-- Days since last encounter
SELECT 
    patient_id,
    encounter_id,
    start_date,
    LAG(start_date) OVER (
        PARTITION BY patient_id
        ORDER BY start_date
    ) AS previous_encounter_date,
    DATEDIFF(
        DAY,
        LAG(start_date) OVER (
            PARTITION BY patient_id
            ORDER BY start_date
        ),
        start_date
    ) AS days_since_last_encounter
FROM encounters_final;



-- TOP PROCEDURE VIEW
CREATE VIEW vw_top_procedures AS
SELECT 
    procedure_description,
    COUNT(*) AS procedure_count
FROM procedures_final
GROUP BY procedure_description;


-- DAY SINCE LAST ENCOUNTER VIEW
CREATE VIEW vw_patient_revisit_gap AS
SELECT 
    patient_id,
    encounter_id,
    start_date,
    LAG(start_date) OVER (
        PARTITION BY patient_id
        ORDER BY start_date
    ) AS previous_encounter_date,
    DATEDIFF(
        DAY,
        LAG(start_date) OVER (
            PARTITION BY patient_id
            ORDER BY start_date
        ),
        start_date
    ) AS days_since_last_encounter
FROM encounters_final;

-- FLAT VIEW FOR POWER BI
CREATE VIEW vw_fact_encounters AS
SELECT 
    e.encounter_id,
    e.patient_id,
    p.first_name,
    p.last_name,
    p.gender,
    p.age,
    p.race,
    p.ethnicity,
    p.city AS patient_city,
    p.state AS patient_state,
    e.encounter_class,
    e.start_date,
    e.end_date,
    e.duration_hours,
    e.base_encounter_cost,
    e.total_claim_cost,
    e.payer_coverage,
    pay.payer_name,
    org.city AS organization_city,
    org.state AS organization_state
FROM encounters_final e
LEFT JOIN patients_final p
    ON e.patient_id = p.patient_id
LEFT JOIN payers_final pay
    ON e.payer_id = pay.payer_id
LEFT JOIN organizations_final org
    ON e.organization_id = org.id;




select * from vw_fact_encounters;
select * from vw_patient_revisit_gap;
select * from vw_top_procedures;