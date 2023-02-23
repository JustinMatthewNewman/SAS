
/**
*      =======================================================
*      ===|	   Data Visualization Examples from class     |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 2/21/23 + 2/23/23
*/



libname library "Documents"; run;


/**
* Get the mean std dev, min, max for variable 'age fare'
*/

proc means data=library.titanic_withformats; var age fare; run;

proc means data=library.titanic_withformats 
n mean stderr clm alpha=.05 maxdec=3; 
var age fare; 
run;


/**
* Extended univariate tables
*/

proc univariate data=library.titanic_withformats;
var age fare; run;


/**
 * Get summary by discrete variable
 */
proc sort data=library.titanic_withformats;
by pclass; run;

proc means data=library.titanic_withformats;
var age fare; by pclass; run;


proc freq data=library.titanic_withformats;
table pclass fate residence; run;



/*
 * PIE CHART
*/

Title "Titanic Passengers class";
proc gchart
data=library.titanic_withformats;
pie pclass / discrete value=inside percent=inside slice=outside; run;


/*
* BAR CHART
*/
Title "Titanic Nationality";
proc sgplot
data=library.titanic_withformats;
hbar residence; run;



/*
* BAR CHART 2
*/
Title "Titanic Nationality";
proc sgplot
data=library.titanic_withformats;
hbar residence / stat=percent barwidth=.2 
transparency=.5 fillatters=(color=red) categoryorder=respesc; run;


/*
* BAR CHART 3 with CI
*/
Title "Average Titanic Ticket fare by country and nationality";
proc sgplot
data=library.titanic_withformats;
vbar residence / response=fare stat=mean limits=both alpha=.1; run;



/*
* Stacked bar charts
*/

Title "Nationality of Titanic passengers by class";
proc sgplot
data=library.titanic_withformats;
vbar residence / group=pclass groupdisplay=stack; run;

Title "Nationality of Titanic passengers by class";
proc sgplot
data=library.titanic_withformats;
vbar residence / group=pclass groupdisplay=cluster; run;



/**
 * Simple Histogram 
 */

Title "Age of Titanic passengers";
proc sgplot
data=library.titanic_withformats;
histogram age; run;

/**
 * Simple Histogram 
 */

proc sgplot data=library.titanic_withformats;
histogram age / binwidth=5; run;


/**
 * Simple Histogram (alter resolution)
 */

proc sgplot data=library.titanic_withformats;
histogram age / nbins=50; run;



proc sgplot data=library.titanic_withformats;
histogram age; xaxis values=(0 to 100 by 10); run;


proc sort data=library.titanic_withformats;
by fate; run;


/**
 * Creates error on SAS9.4M1 (only works on SAS9.4M2)
 */ 
proc sgplot data=library.titanic_withformats;
histogram age / group fate transparency=.5; run;


/** 
 * Overlay a density plot on histogram
 */

proc sgplot data=library.titanic_withformats;
histogram age; density age / type=normal; run;


/**
 * Side by side box and wisker chart
 */
proc sgplot data=library.titanic_withformats;
hbox age / category=residence;
xaxis values=(0 to 90 by 10); run;






/**
* PART 2
*/



libname library "Documents";

/**
 * Scatter plot with regression line
 */
Title "Gala & Fuji Prices 2012-2013";
proc sgplot
data=library.apples;
reg x=gala y =fuji / markerattrs=(symbol=diamondfilled color=salmon) 
lineattrs=(pattern=dashdashdot color=purple thickness=5); 
xaxis label="Gala Apple Prices"; run;




/** 
 * Super Cool multiple regression scatter plot 
 */

ods graphics / attrpriority=none; run;

Title "Regular & Organic Golden Apple prices";
proc sgplot data=library.apples;
reg x=golden y=golden_o / group=year;
styleattrs datacontrastcolors=(green red)
datasymbols=(TriangleFilled ArrowDown);
run;



