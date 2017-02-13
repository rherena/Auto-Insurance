*** Ricardo Herena
*** EDA on Claims amount and Predictive Model Fitting.;

*** EDA for Claim Amount;

proc freq data=ins;
tables TARGET_AMT;
run; quit;

proc means data=ins min max mean median std N NMISS;
class URBANICITY_1;
var TARGET_AMT;
run; quit;

proc sgplot data=ins;
vbox TARGET_AMT_l / category=URBANICITY_1 transparency=0.25;
title 'Urban vs City Claims';
run; quit;

proc univariate data=ins noprint;
   histogram TARGET_AMT;
run;

** blue book vs claim;
proc sgplot data=ins;
reg x=BLUEBOOK y=TARGET_AMT / clm;
loess x=BLUEBOOK y=TARGET_AMT / nomarkers;
title 'Claim by BB val';
run; quit;

proc sgplot data=ins;
reg x=BLUEBOOK_l y=TARGET_AMT_l / clm;
loess x=BLUEBOOK_l y=TARGET_AMT_l / nomarkers;
title 'Claim by BB val';
run; quit;


*** Reckless driver claims;
proc sgplot data=ins;
vbox TARGET_AMT_l / category=MVR_PTS transparency=0.25;
title 'MVR Points';
run; quit;

*** Travel Time;
proc sgplot data=ins;
vbox TARGET_AMT_l / category=TRAVTIME_B transparency=0.25;
title 'Travel tme';
run; quit;

** Car use;
proc sgplot data=ins;
vbox TARGET_AMT_l / category=CAR_USE_1 transparency=0.25;
title 'Commercial vs non commercial';
run; quit;

proc sgplot data=ins;
vbox TARGET_AMT_l / category=KIDSDRIV_1 transparency=0.25;
title 'Commercial vs non commercial';
run; quit;


** Reg model;

proc reg data=ins;
model TARGET_AMT_l = BLUEBOOK_l MVR_PTS REVOKED_1 CAR_USE_1 CLM_5YR EDUCATION_L
						KIDSDRIV_1 CAR_AGE
 		
 		/selection=stepwise slentry=0.10 slstay=0.20 aic bic cp vif;	
 		
title 'Claims Amt Forecast Model';
run; quit;
