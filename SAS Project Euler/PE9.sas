/*PYTHAGOREAN TRIPLETS w/ PRODUCT OF 1000*/
%macro PE9(ult=);
data PE9ds; 
	do a = 1 by 1 until(a>&ult/3);
		do b = a by 1 until(b>&ult/2);
			c = &ult - a - b;
			if (a*a + b*b = c*c) then do; prod=&ult; output; end;
		end;
	end;
run;
%mend;
%PE9(ult=1000);