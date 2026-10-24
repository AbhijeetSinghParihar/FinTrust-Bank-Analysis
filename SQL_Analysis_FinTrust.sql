DROP table if exists public.loan_data;

CREATE TABLE public.loan_data (
    loan_id VARCHAR(30),
    gender VARCHAR(20),
    age INTEGER,
    marital_status VARCHAR(30),
    dependents VARCHAR(10),
    education VARCHAR(30),
    employment_type VARCHAR(50),
    self_employed VARCHAR(20),
    applicant_income NUMERIC(12,2),
    coapplicant_income NUMERIC(12,2),
    loan_amount NUMERIC(12,2),
    loan_term_months INTEGER,
    credit_score INTEGER,
    existing_loans INTEGER,
    debt_to_income_ratio NUMERIC(6,2),
    property_area VARCHAR(30),
    loan_purpose VARCHAR(50),
    employment_years INTEGER,
    previous_defaults VARCHAR(20),
    loan_status VARCHAR(20),
    rejection_reason VARCHAR(100)
);

select * from loan_data;

SELECT loan_status, COUNT(*) AS applications
FROM loan_data
GROUP BY loan_status
ORDER BY applications DESC;

SELECT ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2)
AS approval_rate
FROM loan_data;

SELECT loan_status,
ROUND(AVG(applicant_income), 2) AS avg_applicant_income
FROM loan_data
GROUP BY loan_status;

SELECT loan_status, ROUND(AVG(loan_amount), 2) AS avg_loan_amount
FROM loan_data
GROUP BY loan_status;

SELECT education,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2)
 AS approval_rate
FROM public.loan_data
GROUP BY education
ORDER BY approval_rate DESC;

SELECT employment_type,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
/ COUNT(*), 2) AS approval_rate
FROM public.loan_data
GROUP BY employment_type
ORDER BY approval_rate DESC;

SELECT property_area,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2) AS approval_rate
FROM public.loan_data
GROUP BY property_area
ORDER BY approval_rate DESC;

SELECT previous_defaults,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2
) AS approval_rate
FROM public.loan_data
GROUP BY previous_defaults
ORDER BY approval_rate DESC;

SELECT loan_status,
COUNT(credit_score) AS applicants_with_score,
 ROUND(AVG(credit_score), 2) AS average_credit_score
FROM public.loan_data
GROUP BY loan_status;

SELECT
CASE
WHEN credit_score < 600 THEN 'Below 600'
WHEN credit_score < 700 THEN '600-699'
WHEN credit_score < 750 THEN '700-749'
 WHEN credit_score < 800 THEN '750-799'
 ELSE '800+'
 END AS credit_score_range,
 COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
        / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range
ORDER BY approval_rate DESC;

SELECT
 CASE
 WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
 WHEN debt_to_income_ratio < 30 THEN '20-29%'
 WHEN debt_to_income_ratio < 40 THEN '30-39%'
 ELSE '40%+'
 END AS dti_range,
 COUNT(*) AS applications,
 ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY dti_range
ORDER BY approval_rate DESC;

SELECT
loan_term_months,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
/ COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY loan_term_months
ORDER BY loan_term_months;

SELECT gender,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY gender
ORDER BY approval_rate DESC;

SELECT
 CASE
 WHEN applicant_income < 30000 THEN 'Below 30K'
 WHEN applicant_income < 60000 THEN 'Below 60K'
 WHEN applicant_income < 100000 THEN 'Below 99K'
 ELSE '100K+'
 END AS income_range,
 COUNT(*) AS applications,
 ROUND( 100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
  / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY income_range
ORDER BY approval_rate DESC;

SELECT
 CASE
 WHEN loan_amount < 100000 THEN 'Below 100K'
 WHEN loan_amount < 200000 THEN '100K-199K'
 WHEN loan_amount < 300000 THEN '200K-299K'
 ELSE '300K+'
 END AS loan_amount_range,
COUNT(*) AS applications,
ROUND(100.0 * SUM(CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
 / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY loan_amount_range
ORDER BY approval_rate DESC;

SELECT
CASE
WHEN credit_score < 600 THEN 'Below 600'
WHEN credit_score < 700 THEN '600-699'
WHEN credit_score < 750 THEN '700-749'
WHEN credit_score < 800 THEN '750-799'
ELSE '800+'
END AS credit_score_range,
 CASE
 WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
 WHEN debt_to_income_ratio < 30 THEN '20-29%'
 WHEN debt_to_income_ratio < 40 THEN '30-39%'
 ELSE '40%+'
 END AS dti_range,
COUNT(*) AS applications,
 ROUND(100*SUM(
CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END
 ) / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range, dti_range
ORDER BY approval_rate DESC;

SELECT previous_defaults,
CASE
WHEN credit_score < 600 THEN 'Below 600'
 WHEN credit_score < 700 THEN '600-699'
WHEN credit_score < 750 THEN '700-749'
WHEN credit_score < 800 THEN '750-799'
ELSE '800+'
    END AS credit_score_range,
 COUNT(*) AS applications,
 ROUND(
  100.0 * SUM(
 CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END)
/ COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY previous_defaults, credit_score_range
ORDER BY previous_defaults, approval_rate DESC;

SELECT
    employment_type,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(
  CASE
   WHEN loan_status = 'Approved' THEN 1
   ELSE 0
   END) / COUNT(*),2) AS approval_rate
FROM loan_data
GROUP BY employment_type
ORDER BY approval_rate DESC;

SELECT
    marital_status,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(
 CASE
  WHEN loan_status = 'Approved' THEN 1
 ELSE 0
 END
 ) / COUNT(*),2) AS approval_rate
FROM loan_data
GROUP BY marital_status
ORDER BY approval_rate DESC;

SELECT
    CASE
        WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
        WHEN debt_to_income_ratio < 30 THEN '20-29%'
        WHEN debt_to_income_ratio < 40 THEN '30-39%'
        ELSE '40%+'
    END AS dti_range,
 COUNT(*) AS applications,
ROUND(100.0 * SUM(
CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END
) / COUNT(*), 2
 ) AS approval_rate
FROM loan_data
GROUP BY dti_range
ORDER BY approval_rate DESC;

SELECT
    CASE
WHEN credit_score >= 800 THEN '800+'
WHEN credit_score >= 750 THEN '750-799'
WHEN credit_score >= 700 THEN '700-749'
WHEN credit_score >= 600 THEN '600-699'
 ELSE 'Below 600'
    END AS credit_score_range,
 CASE
 WHEN loan_amount < 100000 THEN 'Below 100K'
WHEN loan_amount < 200000 THEN '100K-199K'
WHEN loan_amount < 300000 THEN '200K-299K'
ELSE '300K+'
    END AS loan_amount_range,
    COUNT(*) AS applications,
ROUND(
100.0 * SUM(
CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END) / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range, loan_amount_range
ORDER BY credit_score_range, loan_amount_range;

SELECT
    CASE
 WHEN credit_score >= 800 THEN '800+'
 WHEN credit_score >= 750 THEN '750-799'
 WHEN credit_score >= 700 THEN '700-749'
 WHEN credit_score >= 600 THEN '600-699'
  ELSE 'Below 600'
    END AS credit_score_range,
  CASE
 WHEN applicant_income < 30000 THEN 'Below 30K'
WHEN applicant_income < 60000 THEN '30K-59K'
WHEN applicant_income < 100000 THEN '60K-99K'
ELSE '100K+'
    END AS income_range,
    COUNT(*) AS applications,
    ROUND(100.0 * SUM(
  CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END
) / COUNT(*), 2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range, income_range
ORDER BY credit_score_range, income_range;

SELECT previous_defaults,
    CASE
        WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
        WHEN debt_to_income_ratio < 30 THEN '20-29%'
        WHEN debt_to_income_ratio < 40 THEN '30-39%'
        ELSE '40%+'
    END AS dti_range,
    COUNT(*) AS applications,
    ROUND( 100.0 * SUM(
 CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END
 ) / COUNT(*), 2
 ) AS approval_rate
FROM loan_data
GROUP BY previous_defaults, dti_range
ORDER BY previous_defaults, approval_rate DESC;

SELECT
    CASE
 WHEN credit_score IS NULL THEN 'Missing Credit Score'
 ELSE 'Credit Score Available'
 END AS credit_score_status,
 COUNT(*) AS applications,
 ROUND(100.0 * SUM(
  CASE WHEN loan_status = 'Approved' THEN 1 ELSE 0 END
  ) / COUNT(*), 2
  ) AS approval_rate
FROM loan_data
GROUP BY credit_score_status
ORDER BY approval_rate DESC;

SELECT loan_status,
 COUNT(*) AS applications,
ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2
 ) AS percentage
FROM loan_data
GROUP BY loan_status
ORDER BY applications DESC;

SELECT
    CASE
        WHEN credit_score < 600 THEN 'Below 600'
        WHEN credit_score < 700 THEN '600-699'
        WHEN credit_score < 750 THEN '700-749'
        WHEN credit_score < 800 THEN '750-799'
        ELSE '800+'
    END AS credit_score_range,
    CASE
        WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
        WHEN debt_to_income_ratio < 30 THEN '20-29%'
        WHEN debt_to_income_ratio < 40 THEN '30-39%'
        ELSE '40%+'
    END AS dti_range,
    COUNT(*) AS applications,
ROUND( 100.0 * SUM(
 CASE
 WHEN loan_status = 'Approved' THEN 1
 ELSE 0
END
) / COUNT(*),2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range, dti_range
ORDER BY credit_score_range, dti_range;

SELECT
 CASE
 WHEN credit_score < 600 THEN 'Below 600'
 WHEN credit_score < 700 THEN '600-699'
 WHEN credit_score < 750 THEN '700-749'
 WHEN credit_score < 800 THEN '750-799'
 ELSE '800+'
END AS credit_score_range,
    previous_defaults,
COUNT(*) AS applications,
ROUND(
100.0 * SUM(
CASE
 WHEN loan_status = 'Approved' THEN 1
 ELSE 0
 END
 ) / COUNT(*),2) AS approval_rate
FROM loan_data
GROUP BY credit_score_range,previous_defaults
ORDER BY credit_score_range,previous_defaults;

SELECT
    CASE
WHEN loan_amount < 100000 THEN 'Below 100K'
 WHEN loan_amount < 200000 THEN '100K-199K'
 WHEN loan_amount < 300000 THEN '200K-299K'
 ELSE '300K+'
END AS loan_amount_range,
CASE
WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
WHEN debt_to_income_ratio < 30 THEN '20-29%'
WHEN debt_to_income_ratio < 40 THEN '30-39%'
ELSE '40%+'
    END AS dti_range,
COUNT(*) AS applications,
  ROUND(
 100.0 * SUM(
CASE
WHEN loan_status = 'Approved' THEN 1
 ELSE 0
  END
 ) / COUNT(*),2) AS approval_rate
FROM loan_data
GROUP BY loan_amount_range,dti_range
ORDER BY loan_amount_range,dti_range;

SELECT
    CASE
        WHEN applicant_income < 30000 THEN 'Below 30K'
        WHEN applicant_income < 60000 THEN '30K-59K'
        WHEN applicant_income < 100000 THEN '60K-99K'
        ELSE '100K+'
    END AS income_range,
 CASE
 WHEN debt_to_income_ratio < 20 THEN 'Below 20%'
 WHEN debt_to_income_ratio < 30 THEN '20-29%'
 WHEN debt_to_income_ratio < 40 THEN '30-39%'
  ELSE '40%+'
 END AS dti_range,
 COUNT(*) AS applications,
 ROUND(
 100.0 * SUM(
 CASE
WHEN loan_status = 'Approved' THEN 1
ELSE 0
 END ) / COUNT(*),
 2) AS approval_rate
FROM loan_data
GROUP BY income_range,dti_range
ORDER BY income_range, dti_range;

SELECT
    CASE
     WHEN credit_score < 600
         AND debt_to_income_ratio >= 40
         AND CAST(previous_defaults as integer) >= 2
            THEN 'Very High Risk'
 WHEN credit_score < 600
 AND debt_to_income_ratio >= 40
  THEN 'High Risk'
  WHEN credit_score < 600
  OR debt_to_income_ratio >= 40
  OR cast(previous_defaults as integer) >= 2
 THEN 'Moderate Risk'
  ELSE 'Lower Risk'
 END AS risk_segment,
    COUNT(*) AS applications,
  ROUND( 100.0 * SUM(
 CASE
 WHEN loan_status = 'Approved' THEN 1
 ELSE 0
  END
  ) / COUNT(*),
2 ) AS approval_rate
FROM loan_data
GROUP BY risk_segment
ORDER BY approval_rate;