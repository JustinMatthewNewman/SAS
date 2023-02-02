/**
*      =======================================================
*      ===|    Creating & Attaching Formats (2.2.23)      |===
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
	========================== Titanic =========================== 
   ==================================================================== */



/* Creating a formats file */

proc format library=library.formats;

value fate 0="Died"
		   1="Survived";

value Residence     0="American"
			    	1="British"
					2="Other";

value Gender 0="Male"
			 1="Female";


run;


/** Attach formats to file */

data library.titanic_fmt; set library.titanic;

format fate fate. Residence Residence. Gender Gender.; run;
