-- Changing placeholders (dates 1900-01-01 and enrollments -1) to NULL
SET SQL_SAFE_UPDATES = 0;

UPDATE studies 
SET 
	start_date = NULLIF(start_date, '1900-01-01'),
    completion_date = NULLIF(NULLIF(completion_date, '1900-01-01'), '2099-12-31'), # As mentioned during the EDA, completion data on 2099 is likely a placeholder. Turning it into NULL.
    primary_completion_date = NULLIF(primary_completion_date, '1900-01-01');

UPDATE studies 
SET enrollment = NULL 
WHERE enrollment = -1;

SET SQL_SAFE_UPDATES = 1;

-- Veryfing changes
SELECT 
    COUNT(CASE WHEN completion_date IS NULL THEN 1 END) AS missing_completion,
    COUNT(CASE WHEN enrollment IS NULL THEN 1 END) AS missing_enrollment
FROM studies;

-- Simplifying redundant 'Phase' prefixes

SET SQL_SAFE_UPDATES = 0;
UPDATE studies 
SET phase = CASE 
    WHEN phase LIKE 'Phase 1%Phase 2%' THEN 'Phase 1|2'
    WHEN phase LIKE 'Phase 2%Phase 3%' THEN 'Phase 2|3'
    ELSE phase 
END
WHERE phase LIKE '%|%';
SET SQL_SAFE_UPDATES = 1;

    
-- Creating a view for grouping all 'Expanded Access' studies anf filter dates post 2019
    
CREATE OR REPLACE VIEW v_studies_cleaned_post2019 AS
SELECT 
    s.study_id, 
    s.nct_id, 
    s.title,
    s.status,
    s.phase,
    s.enrollment,
    s.start_date,
    s.completion_date,
    s.study_type,
    
    -- Calculating timeframes
    TIMESTAMPDIFF(MONTH, start_date, completion_date) AS duration_years,
    
    -- Grouping all 'Expanded Access' studies in one
    CASE  
        WHEN s.study_type LIKE 'Expanded Access%' THEN 'Expanded Access' 
        WHEN s.study_type = 'Interventional' THEN 'Interventional' 
        WHEN s.study_type = 'Observational' THEN 'Observational' 
        ELSE 'Others' 
    END AS study_type_clean
FROM studies s

WHERE 
    -- Filtering studies after 2019
    (
        (s.start_date >= '2019-12-01' AND (s.completion_date >= '2019-12-01' OR s.completion_date IS NULL))
        OR 
        (s.study_type LIKE 'Expanded Access%')
    );
    
-- Creating a view to combine the start and completion dates 

CREATE OR REPLACE VIEW vw_trial_timeline AS 

SELECT      
    s.start_date AS event_date,      
    'Started' AS event_type,      
    s.study_id,      
    s.phase,
    sp.agency_class
FROM v_studies_cleaned_post2019 s
LEFT JOIN sponsors sp ON s.study_id = sp.study_id
WHERE s.start_date IS NOT NULL  

UNION ALL  

SELECT      
    s.completion_date AS event_date,      
    'Completed' AS event_type,      
    s.study_id,      
    s.phase,      
    sp.agency_class 
FROM v_studies_cleaned_post2019 s
LEFT JOIN sponsors sp ON s.study_id = sp.study_id 
WHERE s.completion_date IS NOT NULL;