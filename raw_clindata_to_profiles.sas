options symbolgen;
data test_dat; 
infile datalines delimiter='	'; 
input PT $ VISIT $ PARAMETER $ RESULT $;
datalines;
fkpt	V01	VIT_01	80
fkpt	V01	VIT_02	124
fkpt	V01	VIT_03	80
fkpt	V01	VIT_04	120
fkpt	V01	VIT_05	36.7
fkpt	V01	VIT_06	162.6
fkpt	V01	VIT_07	82.2
fkpt	V01	VIT_08	18
fkpt	V01	VIT_09	74
fkpt	V01	VIT_10	74
fkpt	V02	VIT_01	81
fkpt	V02	VIT_02	132
fkpt	V02	VIT_03	82
fkpt	V02	VIT_04	130
fkpt	V02	VIT_05	38.1
fkpt	V02	VIT_06	
fkpt	V02	VIT_07	80.18
fkpt	V02	VIT_08	16
fkpt	V02	VIT_09	64
fkpt	V02	VIT_10	64
fkpt	V02	VIT_01	67
fkpt	V02	VIT_02	104
fkpt	V02	VIT_03	63
fkpt	V02	VIT_04	102
fkpt	V02	VIT_05	36.9
fkpt	V02	VIT_06	
fkpt	V02	VIT_07	80
fkpt	V02	VIT_08	16
fkpt	V02	VIT_09	76
fkpt	V02	VIT_10	78
fkpt	V03	VIT_01	72
fkpt	V03	VIT_02	131
fkpt	V03	VIT_03	84
fkpt	V03	VIT_04	130
fkpt	V03	VIT_05	37.6
fkpt	V03	VIT_06	
fkpt	V03	VIT_07	75
fkpt	V03	VIT_08	18
fkpt	V03	VIT_09	70
fkpt	V03	VIT_10	81
fkpt	V04	VIT_01	77
fkpt	V04	VIT_02	122
fkpt	V04	VIT_03	79
fkpt	V04	VIT_04	116
fkpt	V04	VIT_05	36.6
fkpt	V04	VIT_06	
fkpt	V04	VIT_07	55
fkpt	V04	VIT_08	18
fkpt	V04	VIT_09	69
fkpt	V04	VIT_10	79
fkpt	V05	VIT_01	91
fkpt	V05	VIT_02	150
fkpt	V05	VIT_03	80
fkpt	V05	VIT_04	131
fkpt	V05	VIT_05	36.4
fkpt	V05	VIT_06	
fkpt	V05	VIT_07	77.7
fkpt	V05	VIT_08	18
fkpt	V05	VIT_09	67
fkpt	V05	VIT_10	67
fkpt	V06	VIT_01	96
fkpt	V06	VIT_02	145
fkpt	V06	VIT_03	72
fkpt	V06	VIT_04	118
fkpt	V06	VIT_05	36.6
fkpt	V06	VIT_06	
fkpt	V06	VIT_07	77.7
fkpt	V06	VIT_08	16
fkpt	V06	VIT_09	70
fkpt	V06	VIT_10	82
fkpt	V07	VIT_01	83
fkpt	V07	VIT_02	120
fkpt	V07	VIT_03	71
fkpt	V07	VIT_04	106
fkpt	V07	VIT_05	36.4
fkpt	V07	VIT_06	
fkpt	V07	VIT_07	77.7
fkpt	V07	VIT_08	18
fkpt	V07	VIT_09	78
fkpt	V07	VIT_10	80
fkpt	V08	VIT_01	79
fkpt	V08	VIT_02	150
fkpt	V08	VIT_03	84
fkpt	V08	VIT_04	136
fkpt	V08	VIT_05	36.6
fkpt	V08	VIT_06	
fkpt	V08	VIT_07	77.7
fkpt	V08	VIT_08	18
fkpt	V08	VIT_09	77
fkpt	V08	VIT_10	69
fkpt	V09	VIT_01	90
fkpt	V09	VIT_02	168
fkpt	V09	VIT_03	88
fkpt	V09	VIT_04	158
fkpt	V09	VIT_05	38.1
fkpt	V09	VIT_06	
fkpt	V09	VIT_07	77.7
fkpt	V09	VIT_08	16
fkpt	V09	VIT_09	61
fkpt	V09	VIT_10	66
fkpt	V10	VIT_01	81
fkpt	V10	VIT_02	135
fkpt	V10	VIT_03	81
fkpt	V10	VIT_04	117
fkpt	V10	VIT_05	38.1
fkpt	V10	VIT_06	
fkpt	V10	VIT_07	77.7
fkpt	V10	VIT_08	16
fkpt	V10	VIT_09	69
fkpt	V10	VIT_10	75
fkpt	V11	VIT_01	87
fkpt	V11	VIT_02	143
fkpt	V11	VIT_03	84
fkpt	V11	VIT_04	125
fkpt	V11	VIT_05	36.9
fkpt	V11	VIT_06	
fkpt	V11	VIT_07	77.7
fkpt	V11	VIT_08	18
fkpt	V11	VIT_09	73
fkpt	V11	VIT_10	83
fkpt	V12	VIT_01	81
fkpt	V12	VIT_02	134
fkpt	V12	VIT_03	80
fkpt	V12	VIT_04	119
fkpt	V12	VIT_05	36.6
fkpt	V12	VIT_06	
fkpt	V12	VIT_07	77.7
fkpt	V12	VIT_08	18
fkpt	V12	VIT_09	74
fkpt	V12	VIT_10	80
;
run;
/*CLEARLY THE VITALS ARE NOT FOR HUMAN REVIEW*/
/*THERE ARE A FEW WAYS TO DEAL WITH THIS (ASSUMING WE HAVE KEYS, WHICH WE DO)*/
/*COULD DROP PARAMETER AFTER RUNNING THIS AND RENAME LABEL...*/
data pf_vit_format;set test_dat(keep=PARAMETER);
if PARAMETER = "VIT_01" then LABEL = "SIT DIA BP";
if PARAMETER = "VIT_02" then LABEL = "SIT SYS BP";
if PARAMETER = "VIT_03" then LABEL = "STAND DIA BP";
if PARAMETER = "VIT_04" then LABEL = "STAND DIA BP";
if PARAMETER = "VIT_05" then LABEL = "TEMP";
if PARAMETER = "VIT_06" then LABEL = "HEIGHT";
if PARAMETER = "VIT_07" then LABEL = "WEIGHT";
if PARAMETER = "VIT_08" then LABEL = "RESP RT";
if PARAMETER = "VIT_09" then LABEL = "SIT HRT";
if PARAMETER = "VIT_10" then LABEL = "STAND HRT";
rename PARAMETER = START;
run;
/*BUT BETTER TO MAKE A FORMAT CATALOGUE SO THAT YOU CAN KEEP THE SOURCE NAMING UNTIL OUTPUT*/
proc sort data = pf_vit_format noduprecs; by START; run;
data pf_vit_format; set pf_vit_format; 
FMTNAME = "$paramfmt";run;
proc format library=work cntlin=pf_vit_format; run;
/*AND TO APPLY*/
data pf_vit_format; set test_dat; 
format PARAMETER $paramfmt.;run;

/*OR WE COULD BUILD A REGEX 'library' AND USE THE PRX FUNCTIONS*/
data re_vit_format; set test_dat;run;
data _null_;
call symput('v1', "PRXPARSE('s/(VIT_01)/SIT DIA BP/i')");
call symput('v2', "PRXPARSE('s/(VIT_02)/SIT SYS BP/i')");
call symput('v3', "PRXPARSE('s/(VIT_03)/STAND DIA BP/i')");
call symput('v4', "PRXPARSE('s/(VIT_04)/STAND DIA BP/i')");
call symput('v5', "PRXPARSE('s/(VIT_05)/TEMP/i')");
call symput('v6', "PRXPARSE('s/(VIT_06)/HEIGHT/i')");
call symput('v7', "PRXPARSE('s/(VIT_07)/WEIGHT/i')");
call symput('v8', "PRXPARSE('s/(VIT_08)/RESP RT/i')");
call symput('v9', "PRXPARSE('s/(VIT_09)/SIT HRT/i')");
call symput('v10', "PRXPARSE('s/(VIT_10)/STAND HRT/i')");
run;
%macro inputregex(ds=);
data &ds(drop=re); set &ds;
%do i = 1 %to 10;
	re = &&v&i;
	call PRXCHANGE(re, -1, PARAMETER);
%end;
run;
%mend;
%inputregex(ds=re_vit_format);

/*CLEARLY, BUILDING A REGEX LIBRARY FOR THIS IS SILLY...*/
/*HOWEVER, ONE COULD BUILD A LIBRARY FOR CHECKING CERTAIN RESULTS*/
/*AND ONCE COMBINED WITH PROC FORMAT, COULD BE PRINTED WITH HIGHLIGHTS*/
/*BUT IN ORDER TO ANALYZE PATIENT DATA, GENERALLY IT IS BEST TO MAKE IT 'LONG' INSTEAD OF 'NARROW'*/
data flat_vit; set test_dat; run;
proc sort data = flat_vit; by PT VISIT; run;
data flat_vit_base; set flat_vit(keep=PT VISIT); run;
proc sort data = flat_vit_base noduprecs; by PT VISIT; run;
%macro mkflat(data=,param=);
data hld; set &data; where PARAMETER = "&&param"; by PT VISIT; 
drop PARAMETER; rename RESULT = &param;run;
data flat_vit_base; set flat_vit_base hld; merge flat_vit_base hld;
by PT VISIT; run;
%mend mkflat;
%macro loopthroughvit;
data _null_;
%do i = 01 %to 10;
	%if &i < 10 %then %do;%mkflat(data=flat_vit,param=VIT_0&i);%end;
	%else %do;%mkflat(data=flat_vit,param=VIT_&i);%end;
%end;
run;
%mend loopthroughvit;
%loopthroughvit;
/*NOW ARRAYS ARE READY FOR USE!*/
/*BUILD A REGEX LIBRARY FOR WHAT WE WANT TO CHECK:*/
/*LET'S LOOK FOR:
HYPERTENSION(sys>140||dia>90)
SIGNS OF ANOREXIA (15% weight loss in a ~month)
FEVER (>37.5C)*/
data _null_; 
call symput('htcheck', "PRXPARSE('s/(.+)/HT-$1/i')");
call symput('anocheck', "PRXPARSE('s/(.+)/ANO-$1/i')");
call symput('fevcheck', "PRXPARSE('s/(.+)/FEV-$1/i')");
run;
data vit_checks(drop=xweight re);retain xweight; set flat_vit_base;
array VIT[*] VIT_01-VIT_10;
if VIT_01>90 then do;
	re = &htcheck;
	call PRXCHANGE(re, -1, VIT_01);
end;
if VIT_02>140 then do;
	re = &htcheck;
	call PRXCHANGE(re, -1, VIT_02);
end;
if VIT_07<xweight-(xweight*.15) then do;
	re = &anocheck;
	call PRXCHANGE(re, -1, VIT_07);
end;
if VIT_05>37.5 then do;
	re = &fevcheck;
	call PRXCHANGE(re, -1, VIT_05);
end;
xweight = VIT_07;
run;
/*NOW THEY ARE MARKED FOR OUTPUT*/
/*FIRST THING'S FIRST: WE RE-'NARROW'-IZE*/
%macro narrowit();
%do i = 01 %to 10;
	%if &i < 10 %then %do;
		data renarrow_vit&i; set vit_checks(keep=PT VISIT VIT_0&i); 
		PARAMETER = "VIT_0&&i";rename VIT_0&i = RESULT;run;
	%end;
	%if &i >= 10 %then %do;
		data renarrow_vit&i; set vit_checks(keep=PT VISIT VIT_&i); 
		PARAMETER = "VIT_&&i";rename VIT_&i = RESULT;run;
	%end;
	%if &i > 1 %then %do;
		data renarrow_vit1; set renarrow_vit1 renarrow_vit&i; run;
	%end;
%end;
/*DITCH SUBJECT # BECAUSE WE KNOW IT ALREADY (GENERALLY OUTPUT ON THE PDF FILENAME)*/
data checkednarrowvit(drop=PT);retain VISIT PARAMETER RESULT; set renarrow_vit1; run;
proc sort data = checkednarrowvit; by VISIT; run;
proc datasets library=WORK;
   delete renarrow_vit:;
run;
%mend;
%narrowit();

%macro humanview();
/*RETRIEVE VISIT AMOUNT TO &maxvis*/
data checkednarrowvit(drop=xvis); retain xct 0 xvis;
set checkednarrowvit end=last;
if xvis ne VISIT then xct = xct + 1;
xvis = VISIT;
if last then do;
	call symput("maxvis", xct);
end;
run;
/*RE-'LONG' DATA BY VISIT (INSTEAD OF PARAM)*/
%do i = 1 %to &maxvis;
	data x&i(drop=xct); retain VISIT; set checkednarrowvit end = last; if xct = &i then output;
	if xct = &i then call symput('visnm',VISIT);run;
	data x&i(drop=VISIT); set x&i;
	rename RESULT = V&i;
	label RESULT = &visnm;
	run;
%end;
proc sort data=x1; by PARAMETER; run;
%do i = 2 %to &maxvis;
	proc sort data=x&i; by PARAMETER; run;
	data x1; set x1 x&i; update x1 x&i; by PARAMETER; run;
%end;
data profilevit; set x1; run;
proc datasets library=WORK;
   delete x:;
run;
%mend;
%humanview();
/*OUTPUT TO PDF W/ HIGHLIGHTING BASED ON CHECKS*/
%macro printvit();

options orientation=landscape
        topmargin=.10in          
        bottommargin=.10in
        leftmargin=.10in rightmargin=.10in;
ODS escapechar="^";
ODS pdf file= "....\example.pdf" uniform 
startpage=NEVER;

/*SET TITLE/FOOTNOTE*/
ODS PDF STARTPAGE=YES;
TITLE1 "(SUBJECT MACRO VAR) Patient Profile";
TITLE2 "VITALS Table";
TITLE3 "^{style[color=#FCD300]ABNORMAL}";
FOOTNOTE1 "Generated on %TRIM(%QSYSFUNC(DATE(), NLDATE20.)) at %TRIM(%SYSFUNC(TIME(), TIMEAMPM12.))";
/*************SLEDAI*************/
proc report nowd data=profilevit contents='VITALS'
style(report)=[borderwidth=2 verticalalign=m font_face='Arial' font_size=6pt cellpadding=2pt];
	column PARAMETER V1-V12;
		define PARAMETER / display format=$paramfmt.
	style(column)=[cellwidth=16% font_face='Arial' font_width=Narrow font_size=5.5pt] FLOW;
	%do x=1 %to 12;
	define V&x / display center  
	style(column)=[cellwidth=5% font_face='Arial' font_width=Narrow font_size=5.5pt] FLOW;
	compute V&x;
		if index(V&x, "HT") > 0 or index(V&x, "ANO") > 0 or index(V&x, "FEV") > 0 then 
		call define (_COL_, "style", "style=[background=#FCD300]");
	endcomp;
	%end;
run;

TITLE; FOOTNOTE;
ODS pdf close;
%mend;
%printvit();
