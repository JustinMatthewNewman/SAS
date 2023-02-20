/**
*      =======================================================
*      ===| Examples from class for cleaning the dataset. |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 2/20/23
*/


/*
1. Download the 2 CSV files HW1A and HW1B then import both into SAS
2. Merge the two files on the variable Name
3. Make the names uppercase
4. Create and attach a format to the variable job where 1=Faculty and 2=Student
5. Calculate a new variable “income_thousands” by diving the original income variable by 1000
6. Drop the original income variable
7. Create a new variable to indicate illegal drinking (individuals less than 21 years old and yes consume alcohol).
8. Turn in: SAS Code, final SAS data file and format file  
*/



/* Set the library workspace */

libname library "C:\Users\labpatron\Documents"; 
run;



/* ====================================================================
	========================== HW1A =========================== 
   ==================================================================== */

PROC IMPORT 
  DATAFILE='C:\Users\labpatron\Documents\HW1A.csv' 
  OUT=work.mydata1a
  DBMS=CSV 
  REPLACE; 
  GETNAMES=YES; 
RUN;

PROC IMPORT 
  DATAFILE='C:\Users\labpatron\Documents\HW1B.csv' 
  OUT=work.mydata1b
  DBMS=CSV 
  REPLACE; 
  GETNAMES=YES; 
RUN;

data hw1a; set mydata1a;
Name_1=Name; Hometown_1=Hometown; Job_1=Job; Age_1 = Age;
drop Name Hometown Job Age; run; 

proc sort data=mydata1a;by Name; run;
proc sort data=mydata1b;by Name; run;

Data merge_ab; merge mydata1a mydata1b; by name; 
run;

/* Convert the Name column to uppercase */
DATA merge_ab_up; SET merge_ab; Name = UPCASE(Name); RUN;



/* Creating a formats file */
/**/
proc format library=library.formats;
value Job   1="Faculty"
			2="Student"
run;

