*** Ricardo Herena;
*** Data Prep;


libname mydata	'/folders/myshortcuts/code/Predict 411/Auto Insurance/Data/'
access=readonly;


data ins;
set mydata.logit_insurance; run;

proc contents data=ins; run; quit;


proc means data=ins min max mean median std N NMISS;

run; quit;

*** replaces variables missing w average;
proc standard data=ins out=ins replace print;

var INCOME YOJ;
 
run; 


data ins;
set ins;

CAR_AGE = abs(CAR_AGE);

if CAR_AGE = . then CAR_AGE = 8;

if TRAVTIME < 10 then
	TRAVTIME_B = 1;
else if TRAVTIME < 20 then
	TRAVTIME_B = 2;
else if TRAVTIME < 30 then
	TRAVTIME_B = 3;
else if TRAVTIME < 40 then
	TRAVTIME_B = 4;
else if TRAVTIME < 50 then
	TRAVTIME_B = 5;
else if TRAVTIME < 60 then
	TRAVTIME_B = 6;
else if TRAVTIME > 60 then
	TRAVTIME_B = 7;

	

	

if CLM_FREQ = 0 then
	CLM_5YR = 0;
else if CLM_FREQ > 0 then
	CLM_5YR = 1;

if TIF = 1 then
	TIF_B = 1;
else if TIF < 5 then
	TIF_B = 2;
else if TIF < 8 then
	TIF_B = 3;
else if TIF =< 11 then
	TIF_B = 5;
else if TIF > 11 then
	TIF_B = 4;
	


if HOME_VAL = 0 then
	HOME_OWNER = 0;
	else HOME_OWNER = 1;
	
if HOME_VAL = 0 then
	HOME_OWNER_F = 0;
else if HOME_VAL = '.' then
	HOME_OWNER_F = 1;
else HOME_OWNER_F = 2;
	
	

if INCOME < 10000 then
	INCOME_B = 1;
else if INCOME < 20000 then
	INCOME_B = 2;
else if INCOME < 30000 then
	INCOME_B = 3;
else if INCOME < 40000 then
	INCOME_B = 4;
else if INCOME < 50000 then
	INCOME_B = 5;
else if INCOME < 60000 then
	INCOME_B = 6;
else if INCOME < 70000 then
	INCOME_B = 7;
else if INCOME < 80000 then
	INCOME_B = 8;
else if INCOME < 90000 then
	INCOME_B = 9;
else if INCOME < 100000 then
	INCOME_B = 10;
else if INCOME > 100000 then
	INCOME_B = 11;
	



if KIDSDRIV = 0 then
	KIDSDRIV_1 = 0;
else if KIDSDRIV > 0 then
	KIDSDRIV_1 = 1;
	
if YOJ = 0 then
	YOJ_1 = 0;
else if YOJ > 0 then
	YOJ_1 = 1;

if HOMEKIDS = 0 then
	HOMEKIDS_1 = 0;
else if HOMEKIDS > 0 then
	HOMEKIDS_1 = 1;
	
if AGE < 21 then
	AGE_B = 1;
else if AGE < 26 then
	AGE_B = 2;
else if AGE < 31 then
	AGE_B = 3;
else if AGE < 36 then
	AGE_B = 4;
else if AGE < 41 then
	AGE_B = 5;
else if AGE < 46 then
	AGE_B = 6;
else if AGE < 51 then
	AGE_B = 7;
else if AGE < 56 then
	AGE_B = 8;
else if AGE < 61 then
	AGE_B = 9;
else if AGE < 66 then
	AGE_B = 10;
else if AGE < 71 then
	AGE_B = 11;
else if AGE > 71 then
	AGE_B = 12;
run;




*** Data Bucketing for Text Var;
data ins;
set ins;

if CAR_USE = 'Private' then
	CAR_USE_1 = 0;
else if CAR_USE = 'Commercial' then
	CAR_USE_1 = 1;
	
	
if EDUCATION = '<High School' then
	EDUCATION_L = 0;
else if EDUCATION = 'z_High School' then
	EDUCATION_L = 0;
else if EDUCATION = 'Bachelors' then
	EDUCATION_L = 1;
else if EDUCATION = 'Masters' then
	EDUCATION_L = 2;
else if EDUCATION = 'PhD' then
	EDUCATION_L = 3;

if MSTATUS = 'z_No' then
	MSTATUS_1 = 0;
else if MSTATUS = 'Yes' then
	MSTATUS_1 = 1;


if REVOKED = 'Yes' then REVOKED_1 = 1;
else REVOKED_1 = 0;

if URBANICITY = 'Highly Urban/ Urban' then URBANICITY_1 = 1;
else URBANICITY_1 = 0;


TARGET_AMT_l = log(TARGET_AMT);

BLUEBOOK_l = log(BLUEBOOK);

if TARGET_AMT = 0 then TARGET_AMT = .;

run;

