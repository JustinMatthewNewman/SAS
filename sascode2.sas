/**
*      =======================================================
*      ===| Examples from class for cleaning the dataset. |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 1/31/23
*/


/* Set the library workspace */

libname library "C:\Users\labpatron\Documents"; 
run;



/* ====================================================================
	========================== BOX OFFICE =========================== 
   ==================================================================== */

/* Display the data's column names */

proc contents data=library.Boxoffice_jf position; run;


/* Sort the data */

proc sort data=library.boxoffice_jf out=sorted;
by ATG_1;
run;


/* Converting decimal number format to dollar format 

	dollars8.1

	8 = the number of chars
	1 = numbers after decimal

*/

data boxoffice_fmt; set library.boxoffice_jf;
format ATG_1 dollar8.1; run;


/** convert str to uppercase */

data boxoffice_fmt; set library.boxoffice_jf;
format ATG_1 ATG_2 dollar15.1 No1_1 No1_2 $upcase32767.; run;


/**/

proc freq data=library.boxoffice_jf;
table No1_1;
format No1_1 $upcase32767.; run;



/* ====================================================================
	========================== STUDY HOURS =========================== 
   ==================================================================== */


/* Creating a formats file */

proc format library=library.formats;

value major 1="Psychology"
			2="Chemistry"
			3="Nursing"
			4="Political Science";

value hrs_per_week  1="0-10"
					2="11-20"
					3="21+";

run;


/** Attach formats to file */

data library.studyhrs_fmt; set library.studyhours;

format major major. hours hrs_per_week.; run;
