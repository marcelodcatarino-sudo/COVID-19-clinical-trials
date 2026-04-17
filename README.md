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

## Key Insights

1. Landscape overview

- The majority of studies are Interventional (57.2%), reflecting the urgency to find effective treatments and vaccines during the pandemic. 
- Observational studies represent a significant share (42.2%), indicating the need to monitor and understand the disease's progression and long-term effects across populations. 
- Expanded Access (0.6%) represents a negligible fraction, as expected. These programs provide patients with serious conditions access to investigational treatments outside of formal clinical trials and have an exceptional nature.

![Study type Distribution](outputs/plots/landscape_study%20type%20dist.png)

- Most of the Studies were in the Recruiting and Not yet recruiting phases. The peak of trial registrations occurred in 2020, coinciding with the outbreak of the pandemic.

![Status Distribution](outputs/plots/landscape_status%20dist.png)
![Status by Year](outputs/plots/landscape_status%20by%20start%20y.png)

- Considering all trials, the majority fall under 'Not Applicable' (N/A), which is expected given the large proportion of Observational studies in the dataset. These studies don't follow a regular clinical trial structure devided by phases.
- When focusing on Interventional studies only, N/A still dominates, which may be related to the status (inspected ahead).
- Excluding N/A results, Phase 2 and phase 3 comprise the majority of the clinical trials.

![Phase Distribution](outputs/plots/landscape_phase%20dist.png)

- When plotting the phases against the status, it was confirmed that the reason why there was so many Interventional studies without attributed phase, was because these were still in the 'Not yet recruiting' and 'Recruiting' stages.

![Phases vs Status](outputs/plots/landscape_phases%20vs%20status.png)

- Looking at the top therapeutic focus areas, the research was predominantly centered around respiratory conditions, which aligns with the known clinical severity of COVID-19 on the respiratory system. Notably, Anxiety and Depression also ranked prominently, reflecting the significant mental health burden imposed by the pandemic on the general population.

![Therapeutic Focus](outputs/plots/landscape_therapeutic%20focus.png)

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
