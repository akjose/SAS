%macro PE2(under=);
/*GENERATE FIBONACCI UNDER &under*/
data PE2ds; 
retain xfact1 xfact2;
%do i = 1 %to 200 /*covers all fibo sequence below 280571172992510140037611932413038677189525*/;
	%if &i > 1 %then %do;
		xfact2 = input(xfact2+xfact1, best12.);
		if xfact2 < &under then output;
	%end;
	%else %do; xfact2 = &i; xfact1 = &i; output;%end;
	xfact1 = xfact2+xfact1;
	if xfact1 < &under then output;
%end;
run;
/*CONCAT FIBOs & CLEAN UP*/
data h1; set PE2ds(keep=xfact1);rename xfact1=fibo; run;
data h2; set PE2ds(firstobs=2 keep=xfact2);rename xfact2=fibo; run;
data PE2ds; set h1 h2; run;
proc sort data=PE2ds noduprecs; by fibo; run;
proc datasets; delete h:; run;
/*SUM OF EVEN FIBRO UNDER &under*/
data PE2ds(drop=fibo); set PE2ds end=last; 
if fibo/2 = int(fibo/2) then efibosum+fibo;
if last then output;
run;
%mend;
%PE2(under=4000000);

