/*FIND SUM OF PRIMES BELOW 2m*/
%macro PE10(num=);
data PE10ds(keep=prime); retain test;
	prime = 2; x = 1; output; prime = prime+1;
	do i = 2 by 1 until(prime>=&num);
		do j = 2 to prime-1;
			if prime/j = int(prime/j) then do; test = 'false'; leave; end;
		end;
		if test ne 'false' then do; output; test = ''; x=x+1;prime=prime+1; end;
		else do; prime=prime+1; test=''; end;
	end;
run;
data PE10ds(keep=answer); set PE10ds end=last;
answer+prime;
if last;
run;
%mend;
%PE10(num=2000000);
