--4)Which top 5 employers file the most petitions each year?

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2011' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2012' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2013' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2014' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2015' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;

SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year='2016' h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;


