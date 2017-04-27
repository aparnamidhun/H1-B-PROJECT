--5) Find the most popular top 10 job positions for H1B visa applications for each year?

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
table1 = load '/home/hduser/h1b_kaggle.csv' using pigloader() as (s_no,case_status,employer_name,soc_name,job_title,full_time_position ,prevailing_wage,year,worksite,longitute,latitute);
noheader = filter table1 by $0 > '0' ;
table2 = order noheader by $0;
table3 = group table2 by (year,job_title);
table4 = FOREACH table3 GENERATE
    FLATTEN(group) AS (year,job_title),COUNT(table2.case_status) as total_applications;
table2011 = filter table4 by (year matches '2011');
tbl_ordr = ORDER table2011 BY total_applications DESC;   


table2012 = filter table4 by (year matches '2012');
tbl_ordr12 = ORDER table2012 BY total_applications DESC;                
top10_12 = LIMIT tbl_ordr12 10;  


table2013 = filter table4 by (year matches '2013');
tbl_ordr13 = ORDER table2013 BY total_applications DESC;                
top10_13 = LIMIT tbl_ordr13 10;  


table2014 = filter table4 by (year matches '2014');
tbl_ordr14 = ORDER table2014 BY total_applications DESC;                
top10_14 = LIMIT tbl_ordr14 10; 

table2015 = filter table4 by (year matches '2015');
tbl_ordr15 = ORDER table2015 BY total_applications DESC;                
top10_15 = LIMIT tbl_ordr15 10; 

  
table2016 = filter table4 by (year matches '2016');
tbl_ordr16 = ORDER table2016 BY total_applications DESC;                
top10_16 = LIMIT tbl_ordr16 10;                                                                                       

