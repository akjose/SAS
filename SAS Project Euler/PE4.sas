/*FIND LARGEST PALINDROME CREATED BY 3 DIGIT INTEGERS*/
data PE4ds(keep=answer);
do i = 100 to 999;
	do j = 101 to 999;
		tpalo = i*j;
		if tpalo = reverse(tpalo) and tpalo > answer then answer = tpalo;
	end;
end;
output;
run;
