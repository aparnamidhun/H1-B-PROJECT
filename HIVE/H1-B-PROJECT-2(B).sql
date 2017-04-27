                       
--2  b) find top 5 locations in the US who have got certified visa for each year.

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2011'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2012'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2013'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2014'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2015'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;

SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year='2016'GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;
