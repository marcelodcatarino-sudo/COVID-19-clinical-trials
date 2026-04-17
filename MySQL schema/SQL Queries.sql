-- Count of Study type: Interventional vs. Observational
SELECT study_type, COUNT(*) AS n_studies
FROM studies
WHERE study_type IN ('Interventional', 'Observational')
GROUP BY study_type
ORDER BY n_studies DESC;

-- Clinical Trial Status Count
SELECT status, COUNT(*) AS n_studies
FROM studies s
GROUP BY status
ORDER BY n_studies DESC;

-- Distribution of Clinical Trial Phases (Interventional only)
SELECT phase, COUNT(*) AS n_studies
FROM studies s
WHERE study_type != 'Observational'
GROUP BY phase
ORDER BY n_studies DESC;

-- Distribution of Unsuccessful Studies by Fund Type
SELECT sp.agency_class, COUNT(*) AS n_failed
FROM studies st
JOIN sponsors sp ON st.study_id = sp.study_id
WHERE st.status IN ('Withdrawn', 'Terminated', 'Suspended')
GROUP BY sp.agency_class
ORDER BY n_failed DESC;

-- Distribution of Unsuccessful Studies by Country
SELECT l.country, COUNT(*) AS n_studies
FROM studies st
JOIN locations l ON st.study_id = l.study_id
GROUP BY l.country
ORDER BY n_studies DESC
LIMIT 10;