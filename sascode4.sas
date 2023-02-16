/**
*      =======================================================
*      ===| 		Cars Data in class assignment.		  |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 1/26/23
*/


/* Set the library workspace */

libname library "C:\Users\labpatron\Documents"; 
run;

/* Display the data's column names */

proc contents data=library.cars position; run;

proc means data=library.cars; run;

data recode; set recode;
if mpg=-99 then mpg=.;
if horse=-99 then horse=.;
run;

data recode; set recode; year=year+1900;
run;


data recode; set recode;
label
engine="Engine displacement cubic inches"
accel="Seconds to accelerate 0 to 60 mph"
horse="Horsepower";
run;



/* Creating a formats file */

proc format library=library.formats;

value origin 1="American"
			2="European"
			3="Japanese";

run;


/** Attach formats to file */

data library.recode; set recode;

format origin origin.; run;
