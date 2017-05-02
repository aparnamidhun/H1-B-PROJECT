#!/bin/bash 
show_menu()
{
    NORMAL=`echo "\033[m"`
    MENU=`echo "\033[36m"` #Blue
    NUMBER=`echo "\033[33m"` #yellow
    FGRED=`echo "\033[41m"`
    RED_TEXT=`echo "\033[31m"`
    ENTER_LINE=`echo "\033[33m"`
    echo -e "${MENU}**********************H1B APPLICATIONS***********************${NORMAL}"
    echo -e "${MENU}**${NUMBER} 1) ${MENU} Is the number of petitions with Data Engineer job title increasing over time?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 2) ${MENU} Find top 5 job titles who are having highest growth in applications. ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 3) ${MENU} Which part of the US has the most Data Engineer jobs for each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 4) ${MENU} find top 5 locations in the US who have got certified visa for each year.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 5) ${MENU} Which industry has the most number of Data Scientist positions?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 6) ${MENU} Which top 5 employers file the most petitions each year? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 7) ${MENU} Find the most popular top 10 job positions for H1B visa applications for each year?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 8) ${MENU} Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.${NORMAL}"
    echo -e "${MENU}**${NUMBER} 9) ${MENU} Create a bar graph to depict the number of applications for each year${NORMAL}"
    echo -e "${MENU}**${NUMBER} 10) ${MENU}Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order${NORMAL}"
    echo -e "${MENU}**${NUMBER} 11) ${MENU} Which are employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?${NORMAL}"
    echo -e "${MENU}**${NUMBER} 12) ${MENU} Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000? ${NORMAL}"
    echo -e "${MENU}**${NUMBER} 13) ${MENU}Export result for option no 12 to MySQL database.${NORMAL}"
    echo -e "${MENU}*********************************************${NORMAL}"
    echo -e "${ENTER_LINE}Please enter a menu option and enter or ${RED_TEXT}enter to exit. ${NORMAL}"
    read opt
}
function option_picked() 
{
    COLOR='\033[01;31m' # bold red
    RESET='\033[00;00m' # normal white
    MESSAGE="$1"  #modified to post the correct option selected
    echo -e "${COLOR}${MESSAGE}${RESET}"
}
clear
show_menu
	while [ opt != '' ]
    do
    if [[ $opt = "" ]]; then 
            exit;
    else
        case $opt in
        1) clear;
        option_picked "1 a) Is the number of petitions with Data Engineer job title increasing over time?";
                 stop-all.sh
		pig -x local /home/hduser/project/PIG/h1b1a.pig
        show_menu;
        ;;
        2) clear;
        option_picked "1 b) Find top 5 job titles who are having highest growth in applications. ";
                 stop-all.sh
		pig -x local /home/hduser/project/PIG/h1b1b.pig
        show_menu;
        ;;  
        3) clear;
           start-all.sh
        option_picked "2 a) Which part of the US has the most Data Engineer jobs for each year?";
		echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
		echo "part of the US has the most Data Engineer jobs for this year";
	    hive -e "SELECT worksite,COUNT(case_status) AS number_of_petition,year from h1b_applications WHERE job_title LIKE '%DATA ENGINEER%' and year=$var GROUP BY worksite,year ORDER BY number_of_petition desc limit 1;"
 
        show_menu;
        ;;
	    4) clear;
             start-all.sh
        option_picked "2 b) find top 5 locations in the US who have got certified visa for each year.";
        echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 5 locations in the US who have got certified visa for this year";
	    hive -e " SELECT worksite,year,COUNT(case_status) AS number_of_petition from h1b_applications WHERE case_status='CERTIFIED' and year=$var GROUP BY year,worksite ORDER BY number_of_petition desc limit 5;"
 
       show_menu;
        ;;  
	    5) clear;
             start-all.sh
        option_picked "3) Which industry has the most number of Data Scientist positions?";
      		temp=$(pwd)
		cd /home/hduser/eclipse_workspace/h1b3/src/h1b3.sh
		bash h1b3.sh
		cd $temp
        show_menu;
        ;;
        6) clear;
           start-all.sh
        option_picked "4)Which top 5 employers file the most petitions each year?";
		echo -e "Enter the year (2011,2012,2013,2014,2015,2016)"
		read var
             echo "top 5 employers file the most petitions each year";
	    hive -e " SELECT employer_name,COUNT(case_status) AS total_petition from WHERE year=$var h1b_applications GROUP BY employer_name ORDER BY total_petition desc limit 5;"
         show_menu;
        ;;
        7) clear;
        option_picked "5) Find the most popular top 10 job positions for H1B visa applications for each year?";
	    stop-all.sh
		pig -x /home/hduser/project/PIG/h1b5.pig
        show_menu;
        ;;
        8) clear;
       	stop-all.sh
		option_picked "6) Find the percentage and the count of each case status on total applications for each year. Create a graph depicting the pattern of All the cases over the period of time.";
          
		pig -x /home/hduser/project/PIG/h1b6.pig
	
        show_menu;
        ;;
		9) clear;
		start-all.sh
		sleep 6
        option_picked "7) Create a bar graph to depict the number of applications for each year";
		temp=$(pwd)
		cd /home/hduser/eclipse_workspace/h1b7/src/h1b7.sh
		bash h1b7.sh
		cd $temp
        show_menu;
        ;;
		10) clear;
          start-all.sh
        option_picked "8) Find the average Prevailing Wage for each Job for each Year (take part time and full time separate) arrange output in descending order";
		echo -e "Enter the year(2011,2012,2013,2014,2015,2016)"
		read year
		echo -e "Enter the choice Full time/ Part time.(Y/N)"
		read var
        hive -e "select job_title,full_time_position,year,avg(prevailing_wage) as average from h1b_applications   where full_time_position = '$var' and year = $year group by job_title,full_time_position,year order by average desc;"
        show_menu;
        ;;
		11) clear;
		start-all.sh
		option_picked "9) Which are   employers who have the highest success rate in petitions more than 70% in petitions and total petions filed more than 1000?"
		temp=$(pwd)
		cd /home/hduser/eclipse_workspace/h1b9/src/h1b9.sh
		bash h1b9.sh
		cd $temp
        show_menu;
        ;;
		12) clear;
		start-all.sh
		option_picked "10) Which are the top 10 job positions which have the  success rate more than 70% in petitions and total petitions filed more than 1000?"
		temp=$(pwd)
		cd /home/hduser/eclipse_workspace/h1b10/src/h1b10.sh
		bash h1b10.sh
		cd $temp
        show_menu;
        ;;
		13) clear;
		option_picked "11) Export result for question no 10 to MySql database."
		start-all.sh
		sleep 10;
		bash /home/hduser/project/sqoop.sh
        show_menu;
        ;;
		\n) exit;   
		;;
        *) clear;
        option_picked "Pick an option from the menu";
        show_menu;
        ;;
    esac
fi
done
