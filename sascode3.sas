/**
*      =======================================================
*      ===|       Long to wide example from class         |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 2/2/23
*/


/* Set the library workspace */

libname library "C:\Users\labpatron\Documents"; 
run;


/* ====================================================================
	========================== Dance Data =========================== 
   ==================================================================== */


/* Sort the data */

proc sort data=library.Dancetrials;
by name;
run;

/* Transpose the Data */


/*
Name  id __ __ __ var
=========================
Chandler 49 45 50
*/

proc transpose data=library.Dancetrials out=library.dancewide;
by name;
var score;
id judge trial;
run;

/* Renaming the headers of transposed data */

data library.dancewide; set library.dancewide; 
J1T1=_11;
J1T2=_12;
J1T3=_13;
J2T1=_21;
J2T2=_22;
J2T3=_23;
DROP _11 _12 _13 _21 _22 _23 _NAME_; run;


/* Example 2 */

/* ====================================================================
	========================== Box Office =========================== 
   ==================================================================== */


proc sort data=library.dancewide; by name; run;


proc transpose data=library.dancewide out=library.dancelong;
by name;
var J1T1--J2T3;
run;


/* Combine Data sets */

/* Stacking method. (may truncate long strings) */


data library.box_stacked;
set library.boxoffice_jan library.boxoffice_feb; run;



/* does not cause truncated lengths */

data library.box_stacked; Length no1 $3000;
set library.boxoffice_jan library.boxoffice_feb; run;

/* Merging datasets with the same jubjects */


/*** REMEMBER NO "library." causes output to work dir */
data jan; set library.boxoffice_jan;
ATG_1=ATG;
MOVIES_1=MOVIES;
NO1_1 = NO1;
drop ATG MOVIES NO1 month; run;

data feb; set library.boxoffice_feb;
ATG_1=ATG;
MOVIES_1=MOVIES;
NO1_1 = NO1;
drop ATG MOVIES NO1 month; run;

proc sort data=jan; by year; run;
proc sort data=feb; by year; run;

data library.merge_janfeb;
merge jan feb;
by year;
run;

proc print data=library.box_stacked;
where no1 contains "Kill"; run;
