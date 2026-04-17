# COVID-19-clinical-trials

## Project Description
This repository contains a Jupyter Notebook focused on the Data Engineering and Analysis of ClinicalTrials.gov COVID-19 datasets.
The project implements a pipeline to clean unstructured clinical data and explores key insights about the global research landscape during the COVID-19 pandemic, covering study types, phases, enrollment, therapeutic focus areas, failure and geographic distribution of trials.
A second Jupyter Notebook contains the preparation of the raw dataset to structured tables designed dor MySQL integration

## Questions Raised
 1. Landscape Overview:
   - How were trials distributed by type, status and phase?
   - How Status evolved over time?
   - What were the most studied conditions and comorbidities alongside COVID-19?
 2. Failure Analysis:
   - Which aspects are associated with unsuccessful trials?
 3. Enrollment Performance:
   - What type of studies had higher enrollment and why?
 4. Geographical Overview:
   - What countries led the research?
 5. Duration Analysis:
   - What was the typical trial duration by phase?
   - What trials took longer than expected?

## Project Structure
```text
COVID-19-clinical-trials/
├── src/Data/  
│         ├── processed/                   
|         |     ├── DF_COVID_CLEAN.csv
|         |     └── structured tables/
|         |                ├── interventions_table.csv 
|         |                ├── locations_table.csv
|         |                ├── sponsors_table.csv
|         |                ├── studies_table.csv
|         |                └── study_design_table.csv
│         └── raw/ 
|              └──COVID clinical trials.csv
├── notebooks/
│       ├── Data cleaning and EDA.ipynb
│       └── Preparation for MySQL.ipynb
├── outputs/plots/
├── MySQL schema/
└── README.md   
```

## Tools
- Language: Python 3.15.3+
- Data Manipulation: Pandas, NumPy
- Visualization: Matplotlib, Seaborn
- Standard Library: `os` (File System Management)
- Database Management: MySQL

## Final considerations
- Performed all the analysis and vizualization on Python
- During the Cleaning phase, some columns (eg.'Acronym'). When loading the clean dataset to MySQL, the dropped columns were not included
- The Schema is missing the tables 'conditions' and 'outcomes'. Tried using ReGex to extract and clean information from 'Outcome Measures' and 'Conditions' but the results were not satisfatory.
- AI was heavily used to generate the code
