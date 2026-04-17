# COVID-19-clinical-trials

## Project Description
This repository contains a Jupyter Notebook focused on the Data Engineering and Analysis of ClinicalTrials.gov COVID-19 datasets.
The project implements a pipeline to clean unstructured clinical data and explores key insights about the global research landscape during the COVID-19 pandemic, covering study types, phases, enrollment, therapeutic focus areas, failure and geographic distribution of trials.
A second Jupyter Notebook contains the preparation of the raw dataset to structured tables designed dor MySQL integration

## Questions Raised


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
