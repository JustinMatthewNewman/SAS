libname library "Documents"; run;

proc freq data=library.Global_trends; 
table FAV_GERMANY; run;


/* Germany is masked from 5*/
data library.subset;
  set library.Global_trends;
  where public = 5;
run;



/* Data keep example */

data library.subset2; set library.subset;
keep ECON_SIT CHILDREN_BETTEROFF2 SATISFIED_DEMOCRACY 
FAV_US FAV_CHINA FAV_GERMANY FAV_EU FAV_UN FAV_NATO 
RESPECT_CHINA RESPECT_US RESPECT_COUNTRY USDEMOCRACY_EXAMPLE 
COVID_US COVID_CHINA COVID_COUNTRY COVID_EU COVID_WHO COVID_CHANGE
COVID_UNITED COVID_RESTRICTION COVID_ECOSTRENGTH COVID_FUTUREHEALTH AGE WEIGHT D_INCOME_GERMANY REGION_GERMANY;
run;





/*
* BAR CHART
*/
Title "Region of Germany";
proc sgplot
data=library.subset;
hbar REGION_GERMANY; run;

/*
* BAR CHART 3 with CI
*/
Title "Region of Germany";
proc sgplot
data=library.subset;
vbar REGION_GERMANY / response=age stat=mean limits=both alpha=.1; run;




/** SUBSETING THE REGIONS REGION3a */

data library.Berlin;
  set library.subset2;
  where REGION_GERMANY = 3;
run;

/*
* BAR CHART 3 with CI
*/
Title "Berlin's opinion";
proc sgplot
data=library.berlin;
vbar RESPECT_CHINA; run;


proc freq data=library.subset2;
table REGION_GERMANY*RESPECT_CHINA / ; run;



Title "Self reported Economic situation by region";
proc sgplot data=library.subset2;
vbar ECON_SIT / group=REGION_GERMANY barwidth=0.7 groupdisplay=cluster stat=percent;
run;

Title "Self reported COVID situation by region";
proc sgplot data=library.subset2;
vbar COVID_COUNTRY / group=REGION_GERMANY barwidth=0.7 groupdisplay=cluster;
run;


/*Title "Self reported COVID situation by region";*/
/*proc sgplot data=library.subset2;*/
/*vbar D_INCOME_GERMANY / group=ECON_SIT barwidth=0.7 groupdisplay=cluster;*/
/*run;*/

Title "";
proc sgplot data=library.subset2;
vbar CONFID_BIDEN / group=DIVERSITY_GOODBAD barwidth=0.7 groupdisplay=cluster;
run;
