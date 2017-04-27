--6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
table1 = load '/home/hduser/h1b_kaggle.csv' using pigloader() as (s_no,case_status,employer_name,soc_name,job_title,full_time_position ,prevailing_wage,year,worksite,longitute,latitute);
noheader = filter table1 by $0 > '0' ;
table2 = order noheader by $0;
table3 = group table2 by (year);
table4 = FOREACH table3 GENERATE FLATTEN(group) AS year,COUNT(table2.case_status) as total_case_status;

table5 = group table2 by (year,case_status);
table6 = FOREACH table5 GENERATE
    FLATTEN(group) AS (year,case_status),COUNT(table2.case_status) as total_case_status;
join_table = join table6 by year, table4 by year;
table7 = foreach join_table generate $0,$1,$2,$4;

table8 = foreach table7 generate  $0,$1,$2,$3,CONCAT((chararray)ROUND_TO((float)(($2*100)/$3),2),'%');






