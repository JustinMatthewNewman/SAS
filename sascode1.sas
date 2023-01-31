/**
*      =======================================================
*      ===| Examples from class for cleaning the dataset. |===
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

proc contents data=library.Cleaningexample position; run;


/* create frequency table */

proc freq data=library.Cleaningexample; 
table symptom01 symptom02 symptom03; run;

/* get the mean for each row */

proc means data=library.Cleaningexample; var age; run;


/* Simple histogram */
proc univariate data = library.Cleaningexample;
histogram age;
run;


/* if examples */

data recode; set library.Cleaningexample;
if symptom01=8 then symptom01=.;
if symptom01=77 then symptom01=7;
run;

data recode2; set library.Cleaningexample;
symptom01_new=symptom01;
if symptom01=8 then symptom01_new=.;
if symptom01=77 then symptom01_new=7;
run;


/* sum and averages, Catagorical variables */

data newvars;
set recode;
combined=symptom01 + symptom02 + symptom03;
average=(symptom01 + symptom02 + symptom03)/3;
proportion=duration/100;
if symptom01 > 4 and symptom02 > 4 and symptom03 > 4 then sickness="High";
else sickness="Low";
run;

/* In example */

data In; set recode;
if symptom01 in (2,4,6) then evenodd = "Even";
else evenodd="Odd";
run;


/* Data drop example */

data dropexample; set newvars;
drop combined proportion;
run;

/* Keep example */

data keepexample; set newvars;
keep age symptom01 symptom02 symptom03;
run;

/* Retain example */

data retainexample;
retain age sickness;
set newvars; run;



/* Alter column headers */

data library.withlabels;
set recode;
label
symptom01="Fatigue"
symptom02="Pain"
symptom03="Difficulty Breathing";
run;

/* Show all column headers */

proc contents data=library.withlabels; run;

/* Frequency Table */

proc freq data=library.withlabels; 
table symptom01 symptom02 symptom03; run;
