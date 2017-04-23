--6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
table1 = load '/home/hduser/h1b_kaggle.csv' using pigloader() as (s_no,case_status,employer_name,soc_name,job_title,full_time_position ,prevailing_wage,year,worksite,longitute,latitute);
noheader = filter table1 by $0 > '0' ;
table2 = order noheader by $0;
table3 = group table2 by (year);
table4 = FOREACH table3 GENERATE FLATTEN(group) AS year,COUNT(table2.case_status) as total_case_status;

--out-put
---------
(NA,13)
(2011,358767)
(2012,415607)
(2013,442114)
(2014,519427)
(2015,618727)
(2016,647803)
table5 = group table2 by (year,case_status);
table6 = FOREACH table5 GENERATE
    FLATTEN(group) AS (year,case_status),COUNT(table2.case_status) as total_case_status;
join_table = join table6 by year, table4 by year;
table7 = foreach join_table generate $0,$1,$2,$4;
(2012,DENIED,21096,415607)
(2012,CERTIFIED,352668,415607)
(2012,WITHDRAWN,10725,415607)
(2012,CERTIFIED-WITHDRAWN,31118,415607)
(2013,PENDING QUALITY AND COMPLIANCE REVIEW - UNASSIGNED,15,442114)
(2013,CERTIFIED-WITHDRAWN,35432,442114)
(2013,WITHDRAWN,11590,442114)
(2013,CERTIFIED,382951,442114)
(2013,DENIED,12126,442114)
(2014,DENIED,11896,519427)
(2014,CERTIFIED-WITHDRAWN,36350,519427)
(2014,INVALIDATED,1,519427)
(2014,WITHDRAWN,16034,519427)
(2014,CERTIFIED,455144,519427)
(2014,REJECTED,2,519427)
(2015,DENIED,10923,618727)
(2015,CERTIFIED,547278,618727)
(2015,WITHDRAWN,19455,618727)
(2015,CERTIFIED-WITHDRAWN,41071,618727)
(2016,DENIED,9175,647803)
(2016,CERTIFIED,569646,647803)
(2016,WITHDRAWN,21890,647803)
(2016,CERTIFIED-WITHDRAWN,47092,647803)


table8 = foreach table7 generate  $0,$1,$2,$3,CONCAT((chararray)ROUND_TO((float)(($2*100)/$3),2),'%');


NA,NA,13,13,100.0%)
(2011,DENIED,29130,358767,8.0%)
(2011,CERTIFIED,307936,358767,85.0%)
(2011,WITHDRAWN,10105,358767,2.0%)
(2011,CERTIFIED-WITHDRAWN,11596,358767,3.0%)
(2012,DENIED,21096,415607,5.0%)
(2012,CERTIFIED,352668,415607,84.0%)
(2012,WITHDRAWN,10725,415607,2.0%)
(2012,CERTIFIED-WITHDRAWN,31118,415607,7.0%)
(2013,PENDING QUALITY AND COMPLIANCE REVIEW - UNASSIGNED,15,442114,0.0%)
(2013,CERTIFIED-WITHDRAWN,35432,442114,8.0%)
(2013,WITHDRAWN,11590,442114,2.0%)
(2013,CERTIFIED,382951,442114,86.0%)
(2013,DENIED,12126,442114,2.0%)
(2014,DENIED,11896,519427,2.0%)
(2014,CERTIFIED-WITHDRAWN,36350,519427,6.0%)
(2014,INVALIDATED,1,519427,0.0%)
(2014,WITHDRAWN,16034,519427,3.0%)
(2014,CERTIFIED,455144,519427,87.0%)
(2014,REJECTED,2,519427,0.0%)
(2015,DENIED,10923,618727,1.0%)
(2015,CERTIFIED,547278,618727,88.0%)
(2015,WITHDRAWN,19455,618727,3.0%)
(2015,CERTIFIED-WITHDRAWN,41071,618727,6.0%)
(2016,DENIED,9175,647803,1.0%)
(2016,CERTIFIED,569646,647803,87.0%)
(2016,WITHDRAWN,21890,647803,3.0%)
(2016,CERTIFIED-WITHDRAWN,47092,647803,7.0%)





