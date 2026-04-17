# COVID-19-clinical-trials

📄 Project Description
This repository contains a Jupyter Notebook focused on the Data Engineering and Analysis of ClinicalTrials.gov COVID-19 datasets.
The project implements a pipeline to clean unstructured clinical data and explores key insights about the global research landscape during the COVID-19 pandemic, covering study types, phases, enrollment, therapeutic focus areas, failure and geographic distribution of trials.
A second Jupyter Notebook contains the preparation of the raw dataset to structured tables designed dor MySQL integration

🔑 Key Features
Data Cleaning & Auditing: Implementation of custom audit functions to analyze missing values across study types and statuses, ensuring a statistically sound dataset.

Relational Data Modeling: Strategic normalization of a "flat" dataset into multiple structured tables (Studies, Sponsors, Locations, Conditions, Interventions) designed for MySQL integration.

Complex Text Mining: Use of Regex and Python logic to parse multi-value fields (e.g., separating Lead Sponsors from Collaborators and extracting standardized MeSH terms for medical conditions).

Publication-Quality Visualizations: (Se fores incluir os gráficos no notebook) Comprehensive analysis of the clinical trial landscape, including geographic distribution, funding sources, and trial phase progression.

🛠️ Tech Stack
Language: Python 3.13.5

Libraries: Pandas, NumPy, Matplotlib, Seaborn

Database (Optional): MySQL (for relational storage and Power BI connectivity)
