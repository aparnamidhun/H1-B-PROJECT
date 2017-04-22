---------------HIVE--------------


--2 a) Which part of the US has the most Data Engineer jobs for each year?

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title like '%DATA ENGINEER%' and year='2011' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
----out-put------------
----------------------------
-worksite	number_of_petition	year
-SEATTLE, WASHINGTON	20	2011

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title='DATA ENGINEER' and year='2012' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
--worksite	number_of_petition	year
SAN FRANCISCO, CALIFORNIA	7	2012

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title='DATA ENGINEER' and year='2013' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title='DATA ENGINEER' and year='2014' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title='DATA ENGINEER' and year='2015' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
