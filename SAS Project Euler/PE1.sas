%macro PE1(under=);
/*FIND MULTIPLES OF 3 and 5*/
data PE1ds(drop=checkeval1 checkeval2); 
length FACTOR 8.;
%do i = 1 %to &under-1;
checkeval1 = &i/3;
checkeval2 = &i/5;
if checkeval1 = int(checkeval1) then do; FACTOR = &i; output; end;
else if checkeval2 = int(checkeval2) then do; FACTOR = &i;  output; end;
%end;
run;
/*SUM FACTORS AND OUTPUT ANSWER*/
data PE1ds(drop=factor); set PE1ds end=last;
answer+factor;
if last then output;
run;
%mend;
%PE1(under=1000);

