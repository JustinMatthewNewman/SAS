/**
*      =======================================================
*      ===| Analysis of distribution. |===
*      =======================================================
*
*      Name: Justin Newman
*      Class: Math309
*      Date: 3/23/23
*/


/* Set the library workspace */

libname library "C:\Users\labpatron\Documents"; 
run;


proc univariate data=library.bears normal plot;
var weight;
histogram;
qqplot / normal (mu=est sigma=est);
run;

proc univariate data=library.bears normal plot;
var length;
histogram;
qqplot / normal (mu=est sigma=est);
run;


/*

Based on the results of the histogram I found it difficult to determine the normality
of the variables. 

Based on the results of the QQ plot I noticed that the points ploted on the Length
QQplot seem to fit the line better. Weight also seemed to show a U shape in the plotted points.





Skewness & Kurtosis
◦ Values between -1 & 1


Length: 
	Skew: -0.3910128, Kurtosis: -0.7506914
Weight:
	Skew: 0.89389054, Kurtosis: 0.03755731

The Length appears to show less Skew but more Kurtosis.


Kolmogorov-Smirnov (KS)
◦ p > 0.05, null assumes that variable follows a normal distribution

Length: 0.1253

	Since the p-value of length is > 0.05 
	we assume that the variable follows a normal distribution

Weight: 0.0213
	
	Since the p-value of length is < 0.05 
	we assume that the variable does not follow a normal distribution


results of the wilk test.

If the Sig. value of the Shapiro-Wilk Test is greater than 0.05,
the data is normal. If it is below 0.05,
the data significantly deviate from a normal distribution.

Weight:
Shapiro wilk test: W: 0.96, Pr < W 0.0706 
thus we accept the assumption of normality.

Length:
Shapiro wilk test: W: 0.92, Pr < W 0.0011 
thus we reject the assumption of normality.


Based on this analysis the normaly distributed variable is length;

*/


proc glm data=library.bears;
class sex;
model length = sex;
means sex / hovtest;
run;

/**
Null Hypothesis: Variances are equal
(want p>.05)

Since 0.0964 is > than 0.05 the varances are equal.
Thus there is a homogeneity of variance.

**/


