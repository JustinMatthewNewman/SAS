
/**
*      =======================================================
*      ===|	   Data Visualization Examples from class     |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 2/28/23
*/



libname library "Documents"; run;


/**
* Get the mean std dev, min, max for variable 'age fare'
*/

Title " "; run;
proc means data=library.bears clm mean std; var chest; run;



/* Sort the data */

proc sort data=library.bears;
by sex;
run;


proc means data=library.bears 
n mean stderr clm alpha=.05 maxdec=3; 
var chest; by sex; 
run;


/*
* Freq
*/
Title " "; run;
proc freq data=library.bears;
table sex; run;


/*
* BAR CHART
*/
Title " ";
proc sgplot
data=library.bears;
hbar sex / stat=percent barwidth=.2 
transparency=.5 fillatters=(color=green); run;




Title " "; run;
proc sgplot data=library.bears;
histogram weight; by sex; xaxis values=(0 to 600 by 50); run;




/** 
 * Super Cool multiple regression scatter plot 
 */

ods graphics / attrpriority=none; run;

Title " ";
proc sgplot data=library.bears;
reg x=age y=weight / group=sex;
styleattrs datacontrastcolors=(green red yellow)
datasymbols=(TriangleFilled ArrowDown TriangleFilled);
run;
