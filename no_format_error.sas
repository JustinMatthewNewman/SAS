/** No format error */


options nofmterr; run;

data library.new; set library.orginal;
format _all_; run;

data library.study_noformat; set library.studyhrs_fmt;
format _all_; run;
