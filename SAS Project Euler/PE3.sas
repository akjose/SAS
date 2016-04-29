%macro PE3(factor=);
/*TEST FOR PRIME FACTORS of &factor*/
data PE3ds(keep=pfact test); 
retain factor;
factor = &factor;
i = 2;
do until(i > factor);
	c1 = factor/i;c2 = int(factor/i);pfact = i;output;
	if c1 ne c2 then do;
		i = i+1;
		test = 'false';
	end;
	else do; factor = factor/i;test = 'true'; end;
end;
run;
/*KEEP PRIMES*/
data PE3ds(drop=test); set PE3ds end = last;
if test = 'true' or last;
run;
/*OUTPUT LARGEST PRIME FACTOR*/
data PE3ds; set PE3ds end = last;
if last;rename pfact = answer;
run;
%mend;
%PE3(factor=600851475143);
