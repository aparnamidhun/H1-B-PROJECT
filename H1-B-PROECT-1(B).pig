--1 b) Find top 5 job titles who are having highest growth in applications.

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
table1 = load '/home/hduser/h1b_kaggle.csv' using pigloader() as (s_no,case_status,employer_name,soc_name,job_title,full_time_position ,prevailing_wage,year,worksite,longitute,latitute);
noheader = filter table1 by $0 > '0';
table2 = order noheader by $0;
table3 = group table2 by (year);
table4 = FOREACH table3 GENERATE
    FLATTEN(group) AS year,COUNT(table2.case_status) as total_case_status;
table5 = group table2 by (year,job_title);
table6 = FOREACH table5 GENERATE
    FLATTEN(group) AS (year,job_title),COUNT(table2.case_status) as total_applications;
table7 = join table4 by year, table6 by year;
table8 = foreach table7 generate $0,$1,$3,$4;
table9 = foreach table8 generate $0,$1,$2,$3,ROUND_TO((float)(($3*100)/$1),6);
data2011 = filter table9 by ($0 matches '2011');
data2016 = filter table9 by ($0 matches '2016');
table11 = foreach table9 generate $1,$2,(data2011.$4-data2016.$4) as growth;
table12 = foreach table9 generate $0,$1,$2,$3,$4,table11.$0;
table13 = order table1 by growth desc;
final_table = limit table13 5;



