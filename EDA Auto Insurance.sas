*** Ricardo Herena
*** EDA;


proc means data=ins min max mean median std N NMISS;

run; quit;


*** Having kids seems to have a stronger prop of accident.;
proc means data=ins min max mean median std N NMISS;
class KIDSDRIV;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class KIDSDRIV_1;
var TARGET_FLAG;
run; quit;


*** Some sort of relationship where increased P early and late age;
proc means data=ins min max mean median std N NMISS;
class AGE_B;
var TARGET_FLAG;
run; quit;

*** Those with Kids at home, vs those without;
proc means data=ins min max mean median std N NMISS;
class HOMEKIDS_1;
var TARGET_FLAG;
run; quit;

*** Years on the job greater than 1. ;
proc means data=ins min max mean median std N NMISS;
class YOJ;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class YOJ_1;
var TARGET_FLAG;
run; quit;

PROC SORT DATA=ins OUT=ins;
  BY TARGET_FLAG;
RUN;

proc boxplot data=ins;
	plot INCOME*TARGET_FLAG;
run;

*** Income Buckets;
proc means data=ins min max mean median std N NMISS;
class INCOME_B;
var TARGET_FLAG;
run; quit;

*** The Large portion of home vals are 0 since not home owners
title 'Home Value Hist';
proc univariate data=ins noprint;
   histogram HOME_VAL;
run;

proc freq data=ins;
tables HOME_VAL;
run; quit;

proc means data=ins min max mean median std N NMISS;
class HOME_OWNER;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class HOME_OWNER_F;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class TIF_B;
var TARGET_FLAG;
run; quit;

proc freq data=ins;
tables TIF;
run; quit;

proc means data=ins min max mean median std N NMISS;
class CLM_FREQ;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class CLM_5YR;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class MVR_PTS;
var TARGET_FLAG;
run; quit;



*** Travel time;
proc univariate data=ins noprint;
   histogram TRAVTIME;
run;

proc means data=ins min max mean median std N NMISS;
class TRAVTIME_B;
var TARGET_FLAG;
run; quit;


*** Car Age;
proc freq data=ins;
tables CAR_AGE;
run; quit;

proc means data=ins min max mean median std N NMISS;
class CAR_AGE;
var TARGET_FLAG;
run; quit;


**** CATEGORICAL VARIABLES;
*** ;

proc freq data=ins;
tables CAR_TYPE;
run; quit;

proc means data=ins min max mean median std N NMISS;
class CAR_TYPE;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class CAR_USE;
var TARGET_FLAG;
run; quit;
** commercial vs Private;
proc means data=ins min max mean median std N NMISS;
class CAR_USE_1;
var TARGET_FLAG;
run; quit;

*** Education Level;
proc means data=ins min max mean median std N NMISS;
class EDUCATION;
var TARGET_FLAG;
run; quit;

*** Education Level;
proc means data=ins min max mean median std N NMISS;
class EDUCATION_L;
var TARGET_FLAG;
run; quit;

*** Job Level;
proc means data=ins min max mean median std N NMISS;
class JOB;
var TARGET_FLAG INCOME;
run; quit;

*** Marital Status;
proc means data=ins min max mean median std N NMISS;
class MSTATUS;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class MSTATUS_1;
var TARGET_FLAG;
run; quit;

*** Red car seems to be a myth;
proc means data=ins min max mean median std N NMISS;
class RED_CAR;
var TARGET_FLAG;
run; quit;

*** Revoked Licence; 
proc means data=ins min max mean median std N NMISS;
class REVOKED;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class REVOKED_1;
var TARGET_FLAG;
run; quit;

** Gender Gap;
proc means data=ins min max mean median std N NMISS;
class SEX;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class PARENT1;
var TARGET_FLAG;
run; quit;


** Urban;
proc means data=ins min max mean median std N NMISS;
class URBANICITY;
var TARGET_FLAG;
run; quit;

proc means data=ins min max mean median std N NMISS;
class URBANICITY_1;
var TARGET_FLAG;
run; quit;






