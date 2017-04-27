--1 a) Is the number of petitions with Data Engineer job title increasing over time?

REGISTER /home/hduser/DatasetsandCodes/PIG/piggybank.jar;
DEFINE pigloader org.apache.pig.piggybank.storage.CSVExcelStorage();
data = load '/home/hduser/h1b_kaggle.csv' using pigloader() as (s_no,case_status,employer_name,soc_name,job_title,full_time_position ,prevailing_wage,year,worksite,longitute,latitute);
noheader = filter data by $0 > '0';
data = order noheader by $0;
data1 = filter data by ($4 matches 'DATA ENGINEER');
data2 = group data1 by $7;
data3 = foreach data2 generate group,COUNT(data1.$4);
data2011 = filter data3 by ($0 matches '2011');
data2012 = filter data3 by ($0 matches '2012');
data2013 = filter data3 by ($0 matches '2013');
data2014 = filter data3 by ($0 matches '2014');
data2015 = filter data3 by ($0 matches '2015');
data2016 = filter data3 by ($0 matches '2016');
data4 =foreach data2011 generate data2011.$1,data2012.$1,data2013.$1,data2014.$1,data2015.$1,data2016.$1;
--dump data4;
data5 = foreach data4 generate  $0,$1,$2,$3,$4,$5,CONCAT((chararray)ROUND_TO((float)((($1-$0)*100)/$0),2),'%'),CONCAT((chararray)ROUND_TO((float)((($2-$1)*100)/$1),2),'%'),CONCAT((chararray)ROUND_TO((float)((($3-$2)*100)/$2),2),'%'),CONCAT((chararray)ROUND_TO((float)((($4-$3)*100)/$3),2),'%'),CONCAT((chararray)ROUND_TO((float)((($5-$4)*100)/$4),2),'%');
--dump data5;
data6 = foreach data5 generate $6,$7,$8,$9,$10;
perbyyear = foreach data6 generate FLATTEN(TOBAG(*));
dump perbyyear
