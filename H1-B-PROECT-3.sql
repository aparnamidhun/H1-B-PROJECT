
               -----------------HIVE------------------


--3)Which industry has the most number of Data Scientist positions?

SELECT employer_name,COUNT(job_title) AS number_of_DataScientist from h1b_applications WHERE job_title='DATA SCIENTIST' GROUP BY employer_name ORDER BY number_of_DataScientist desc limit 1;
--OUT-PUT
---------
employer_name	number_of_datascientist
MICROSOFT CORPORATION	139
