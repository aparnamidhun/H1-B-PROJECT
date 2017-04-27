--1 b) Find top 5 job titles who are having highest growth in applications.

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;  --
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
table1 = load '/home/hduser/h1b_kaggle.csv' using pigloader() as
(s_no:int,
case_status:chararray,
employer_name:chararray,
soc_name:chararray,
job_title:chararray,
full_time_position:chararray,
prevailing_wage:int,
year:chararray,
worksite:chararray,
longitute:double,
latitute:double);                      --load the data into table
noheader = filter table1 by $0 > 0;     --remove the header
table2 = order noheader by $0;       --order table by s_no
table3 = group table2 by (year,job_title);
table4 = FOREACH table5 GENERATE
    FLATTEN(group) AS (year,job_title),COUNT(table2.case_status);
data2011 = filter table4 by ($0 matches '2011');
tb1 =foreach data2011 generate $2;
data2012 = filter table4 by ($0 matches '2012');
tb2 = foreach data2012 generate $0,$2;
data2013 = filter table4 by ($0 matches '2013');
tb3 =foreach data2013 generate $0,$2;
data2014 = filter table4 by ($0 matches '2014');
tb4 = foreach data2014 generate $0,$2;
data2015 = filter table4 by ($0 matches '2015');
tb5 = foreach data2015 generate $0,$2;
data2016 = filter table4 by ($0 matches '2016');
tb6 = foreach data2016 generate $0,$2;
table5 =join  by $0,
table6 = foreach table5 generate $1,(float)($7-$6)*100/$6,(float)($6-$5)*100/$5,
(float)($5-$4)*100/$4,(float)($4-$3)*100/$3,
(float)($3-$2)*100/$2;
table7 = foreach table6 generate $0,($1+$2+$3+$4+$5)/5 as avg_growth;
table8 = order table7 by growth desc;
final_table = limit table8 5;





