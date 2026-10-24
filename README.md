# FinTrust-Bank-Analysis
# FinTrust Bank — Loan Approval & Credit Risk Analysis

## Project Overview

This project analyzes a loan-application dataset to understand approval patterns and identify applicant characteristics associated with different approval outcomes.

The project combines data-quality checks, SQL-based analysis, and an interactive Power BI dashboard to turn loan application data into business insights.

The analysis focuses on areas such as credit score, debt-to-income ratio, previous defaults, loan amount, income, employment type, and education.

---

## Business Problem

A lender receives applications from applicants with different financial profiles, employment situations, credit histories, and loan requirements.

An overall approval rate does not explain which applicant characteristics are associated with different approval outcomes.

The objective of this project is to identify meaningful patterns in loan approvals and translate them into actionable business observations while avoiding unsupported claims of causation.

---

## Scope & Objectives

- Analyze overall loan approval patterns.
- Identify applicant characteristics associated with approval outcomes.
- Analyze approval rates across credit-score and DTI ranges.
- Examine the relationship between previous defaults and approval rates.
- Compare approval patterns across loan amounts, income, employment type, and education.
- Create an exploratory risk segmentation using selected applicant characteristics.
- Present findings through an interactive Power BI dashboard.

---

## Dataset

The dataset contains **30,000 loan applications**.

Key fields include:

- Applicant demographics
- Education and employment information
- Applicant and co-applicant income
- Loan amount and loan term
- Credit score
- Existing loans
- Debt-to-income ratio (DTI)
- Loan purpose
- Previous defaults
- Loan approval status
- Rejection reason

---

## Tools Used

- **Excel** — Data cleaning and preparation
- **PostgreSQL** — SQL-based data analysis
- **Power BI** — Interactive dashboard and visualization
- **Microsoft Word** — Project documentation
- **Microsoft PowerPoint** — Project presentation
- **GitHub** — Project portfolio and file management

---

## Data Quality

Before the analysis, the dataset was reviewed for missing values, duplicates, data types, and inconsistencies.

Missing values were identified in fields such as Gender and Marital Status and documented during the data-quality review.

The fields used for calculations and analysis were also checked to ensure they were in an appropriate format.

---

## SQL Analysis

SQL was used to analyze:

- Overall application and approval rates
- Approval rates by credit-score range
- Approval rates by DTI range
- Previous defaults and approval outcomes
- Approval patterns by employment type and education
- Income and loan-amount segments
- Credit score combined with DTI
- Credit score combined with previous defaults
- Loan amount combined with DTI
- Income combined with DTI
- Missing credit-score patterns

---

## Power BI Dashboard

The Power BI dashboard provides an interactive view of loan approval and credit-risk patterns.

### Dashboard 1 — Loan Approval Overview

The dashboard includes:

- Total Applications
- Approved Applications
- Overall Approval Rate
- Approval Rate by Loan Purpose
- Approval Rate by Credit Score Range
- Approval Rate by DTI Range
- Loan Purpose filter

### Dashboard 2 — Credit Risk Analysis

The dashboard examines:

- Risk-level distribution
- Approval rate by risk level
- Approval rate by employment type
- Approval rate by education
- Previous defaults and approval outcomes

---

## Key Findings

- **Credit Score:** Approval rate increases substantially across credit-score ranges, indicating a strong association between stronger credit profiles and approval outcomes in this dataset.
- **Debt-to-Income Ratio:** Approval rate decreases as DTI increases, making debt burden an important segment for credit-risk review.
- **Previous Defaults:** Approval rate falls sharply as previous defaults increase.
- **Loan Amount:** Approval rate varies across different loan-amount ranges.
- **Employment Type:** Unemployed applicants show a substantially lower approval rate than the other listed employment groups.
- **Education:** Graduates show a higher approval rate than non-graduates.

These findings represent observed associations in the dataset and should not be interpreted as proof of causation.

---

## Risk Segmentation

A project-defined risk classification was created using credit score, DTI, and previous defaults.

The segmentation contains four categories:

- Very High Risk
- High Risk
- Moderate Risk
- Lower Risk

This is an **exploratory portfolio segmentation**, not a validated bank credit-scoring model or probability-of-default model.

---

## Business Recommendations

- Use credit score and DTI as important indicators for further credit-risk review.
- Give additional attention to applicants with multiple previous defaults.
- Consider requested loan amount together with the applicant's overall financial profile.
- Review applications from unemployed applicants more carefully based on the observed approval pattern.
- Use multiple applicant characteristics together rather than relying on a single variable.
- Treat education as a supporting segmentation variable rather than a standalone approval criterion.
- Validate any proposed lending rules using appropriate banking risk models and additional data before real-world implementation.

---

## Conclusion

The analysis identifies clear differences in loan approval rates across several applicant and loan characteristics.

Credit score, DTI, and previous defaults show particularly strong patterns in the dataset. The Power BI dashboard provides an interactive way to explore these patterns across different applicant segments.

The project demonstrates how SQL analysis and business intelligence tools can be used to convert loan-application data into practical business insights.

The findings are exploratory and should not be treated as a validated credit-scoring or lending-decision model.

---
