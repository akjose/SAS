/*FIND 10001st PRIME NUMBER*/
%macro PE7(num=);
data PE7ds(keep=prime); retain test;
	prime = 2; x = 1; output; prime = prime+1;
	do i = 2 by 1 until(x=&num);
		do j = 2 to prime-1;
			if prime/j = int(prime/j) then do; test = 'false'; leave; end;
		end;
		if test ne 'false' then do; output; test = ''; x=x+1;prime=prime+1; end;
		else do; prime=prime+1; test=''; end;
	end;
run;
data PE7ds; set PE7ds(rename=(prime=answer)) end=last;
if last;
run;
%mend;
%PE7(num=10001);
