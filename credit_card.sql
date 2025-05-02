-- creating credit card table

CREATE TABLE cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);

-- create customer table

CREATE TABLE cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);

-- importing data from csv
set datestyle ='DMY';

COPY cc_detail
FROM 'D:\DATA SCIENCE PROJECT FOR RESUME\credit_card_dashboard\credit_card.csv' 
DELIMITER ',' 
CSV HEADER;

COPY cust_detail
FROM 'D:\DATA SCIENCE PROJECT FOR RESUME\credit_card_dashboard\customer.csv'
DELIMITER ','
CSV HEADER;

select * from cc_detail;
select * from cust_detail;

-- checking for null values
SELECT * FROM cc_detail
WHERE NOT (cc_detail IS NOT NULL);


SELECT * FROM cust_detail
WHERE NOT (cust_detail IS NOT NULL);


-- checking the duplicate of cc_detail table

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'cc_detail';


SELECT 
  client_num,
  credit_limit,
  total_revolving_bal,
  total_trans_amt,
  total_trans_ct,
  avg_utilization_ratio,
  interest_earned,
  annual_fees,
  activation_30_days,
  customer_acq_cost,
  week_start_date,
  current_year,
  card_category,
  qtr,
  use_chip,
  exp_type,
  delinquent_acc,
  week_num,
  COUNT(*) AS duplicate_count
FROM cc_detail
GROUP BY 
  client_num,
  credit_limit,
  total_revolving_bal,
  total_trans_amt,
  total_trans_ct,
  avg_utilization_ratio,
  interest_earned,
  annual_fees,
  activation_30_days,
  customer_acq_cost,
  week_start_date,
  current_year,
  card_category,
  qtr,
  use_chip,
  exp_type,
  delinquent_acc,
  week_num
HAVING COUNT(*) > 1;

-- checking the duplicate of cust_detail table


SELECT column_name
FROM information_schema.columns
WHERE table_name = 'cust_detail';



SELECT 
  client_num,
  customer_age,
  dependent_count,
  income,
  cust_satisfaction_score,
  marital_status,
  state_cd,
  zipcode,
  car_owner,
  house_owner,
  personal_loan,
  contact,
  gender,
  customer_job,
  education_level,
  COUNT(*) AS duplicate_count
FROM cust_detail
GROUP BY 
  client_num,
  customer_age,
  dependent_count,
  income,
  cust_satisfaction_score,
  marital_status,
  state_cd,
  zipcode,
  car_owner,
  house_owner,
  personal_loan,
  contact,
  gender,
  customer_job,
  education_level
HAVING COUNT(*) > 1;





