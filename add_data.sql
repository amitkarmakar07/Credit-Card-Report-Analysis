-- copy additional data (week-53) in both table

COPY cc_detail
FROM 'D:\DATA SCIENCE PROJECT FOR RESUME\credit_card_dashboard\cc_add.csv' 
DELIMITER ',' 
CSV HEADER;




COPY cust_detail
FROM 'D:\DATA SCIENCE PROJECT FOR RESUME\credit_card_dashboard\cust_add.csv' 
DELIMITER ',' 
CSV HEADER;