# Employee Attrition Analysis

Why do employees leave, and which groups are most at risk?

## The data

IBM HR Analytics Employee Attrition & Performance dataset, from Kaggle:
https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset

- 1,470 employees, 35 columns, one row per employee. No missing values.
- Columns cover demographics, pay, job details, satisfaction scores, and tenure.

**Please read this first:** this dataset is simulated data created by IBM
for education and analysis practice. It is **not** a real company's
workforce. Everything in this project is an analytical exercise — it shows
how I analyse attrition, not facts about any real employer.

## How to run it

1. Download `WA_Fn-UseC_-HR-Employee-Attrition.csv` from the Kaggle link
   above and put it in the `data/` folder (see `data/DATA_SOURCE.md`).
2. `pip install -r requirements.txt`
3. Open `notebooks/01-attrition-analysis.ipynb` and run it top to bottom.
4. The SQL queries in `sql/attrition_queries.sql` answer the same questions
   in SQLite.

## What I found

- **237 of 1,470 employees left — 16.1% attrition.** 1,233 stayed (83.9%).
- **Pay is the clearest gap.** Leavers earned $4,787 a month on average,
  against $6,832 for stayers — a 42.7% difference, reported as
  statistically significant in one published analysis of this dataset.
  Average monthly income overall is $6,503.
- **It is not a performance problem.** In one published dashboard built on
  this dataset, attrition was 16.4% among employees rated Outstanding and
  16.1% among those rated Excellent — about the same as the overall rate.
  The company is losing good people, not weak ones.
- The notebook also breaks attrition down by department, job role,
  overtime, years at the company, and monthly-income band, so the risky
  groups can be named, not guessed at.

## What I would recommend

1. Look at overtime first — it is usually the cheapest problem to fix.
2. Review pay for the roles and departments with the highest attrition.
3. Support new joiners in their first two years if they leave fastest.
4. Stop treating attrition as a performance problem — the top-rated
   employees leave at the same rate as everyone else.

## Limitations

- Simulated data: nothing here describes a real employer.
- Associations, not causes — low pay and overtime travel with leaving, but
  the data cannot prove one causes the other.
- One snapshot in time, so there is no trend over years.

## Tools

Python (pandas, matplotlib), SQL (SQLite).
