
--2 a) Which part of the US has the most Data Engineer jobs for each year?

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year='2011' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year='2012' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year='2013' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year='2014' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;

SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year='2015' GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;
