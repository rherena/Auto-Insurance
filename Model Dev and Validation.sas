*** Ricardo Herena
*** Model Development & Validation;

data ins;
set ins;
* generate a uniform(0,1) random variable with seed set to 123; u = uniform(456);
if (u < 0.70) then train = 1;
else train = 0;
if (train=1) then train_response=TARGET_FLAG; else train_response=.;
run;

proc logistic data=ins;
model train_response (ref="0") =   AGE_B
								EDUCATION_L
								HOMEKIDS_1
								HOME_OWNER
								INCOME_B
								KIDSDRIV_1
								MSTATUS_1
								YOJ_1
														
								CAR_USE_1
								CLM_5YR
								TIF_B
								
								MVR_PTS
								REVOKED_1
								
								TRAVTIME_B
								URBANICITY_1/
selection=Forward slentry=0.05 slstay=0.05;
output out = ins
	P=P_train_response;
run;
quit;


proc means data=ins min max mean median std N NMISS;

run; quit;

data ins;
set ins;

P_Error = abs(TARGET_FLAG - P_train_response);
P_Err_Mean = abs(TARGET_FLAG - 0.2638157);


run;


proc means data=ins mean median; Class train;

var P_Error P_Err_Mean;


run; quit;

*** Models 1 - 3;
*** Model 1 - Full Model;
proc logistic data=ins;
model TARGET_FLAG (ref="0") =   EDUCATION_L
								HOMEKIDS_1
								HOME_OWNER
								INCOME_B
								KIDSDRIV_1
								MSTATUS_1
								YOJ_1
														
								CAR_USE_1
								CLM_5YR
								TIF_B
								
								MVR_PTS
								REVOKED_1
								
								TRAVTIME_B
								URBANICITY_1;
output out = ins
	P=P_M1;
run;
quit;

*** Model 2 - TIF and Home Kids Excl;
proc logistic data=ins;
model TARGET_FLAG (ref="0") =   EDUCATION_L
								
								HOME_OWNER
								INCOME_B
								KIDSDRIV_1
								MSTATUS_1
								YOJ_1
														
								CAR_USE_1
								CLM_5YR
								
								
								MVR_PTS
								REVOKED_1
								
								TRAVTIME_B
								URBANICITY_1;
output out = ins
	P=P_M2;
run;
quit;

** Model 3 the least inclusive;
proc logistic data=ins;
model TARGET_FLAG (ref="0") =   INCOME_B
								KIDSDRIV_1
								CAR_USE_1
								CLM_5YR

								REVOKED_1
								
								TRAVTIME_B
								URBANICITY_1;
output out = ins
	P=P_M3;
run;
quit;


data inse;
set ins;

keep train TARGET_FLAG P_M1 P_M2 P_M3;

run;

proc export 
  data=inse 
  dbms=xlsx 
  outfile="/folders/myshortcuts/code/Predict 411/Auto Insurance/Data/ins" 
  replace;
run;
