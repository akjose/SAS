/*FIND SMALLEST NUMBER DIVISIBLE by all in &lint*/
%macro PE5(lint=);
data PE5ds(keep=answer);
x = &lint; answer = 0;	
do until(answer>0);
	false = 0;
	do i = 1 to &lint;
		if x/i ne int(x/i) then do; 
			x = x + 1; false = 1;
		end; 
		if i = &lint and false ne 1 then do; answer = x; output; end;
	end;
end;
run;
%mend;
%PE5(lint=20);
