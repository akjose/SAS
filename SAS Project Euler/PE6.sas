%macro PE6(mint=);
/*SUM OF SQUARES OF &mint*/
data sumOFsq(keep=sum id);
	do i = 1 to &mint;
		sq = i*i;
		sum+sq;
		id = 1;
	end;
	output;
run;
/*SQUARE OF SUM OF &mint*/
data sqOFsum(keep=sqs id);
x = 0;
	do j = 1 to &mint;
		x=x+j;
	end;
	sqs=x*x; id = 1;output;
run;
/*THE DIFFERENCE BETWEEN*/
data difference(drop=id);
set sumOFsq sqOFsum; update sumOFsq sqOFsum; by id;
run;
data PE6ds(keep=answer); set difference; answer = sqs-sum; run;
proc datasets; delete s: d:; run;
%mend;
%PE6(mint=100);

