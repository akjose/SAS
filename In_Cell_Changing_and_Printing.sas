/*In Cell Data Changes:
	REGEX is a very powerful (but simple!) type of command from the olden days of Perl. Most programming languages support REGEX statements and SAS is no exception. With REGEX statement, you can forgo multiple data steps and helper variable generations to alter in string data. To do this we use the following SAS commands:
		*call Symput
		*PRXPARSE 
		*PRXCHANGE
	
	While PRXPARSE statements can be used directly in PRXCHANGE statements, I find it much cleaner to store the PRXPARSE statements inside macro variables. This allows you to build a whole library of notations to apply during a course of checks. The example below is an excerpt from a process I use to check consistency of a form for Lupus data:*/

	data _null_; 
	call symput('cor', "PRXPARSE('s/(.+)/CORRELATION - $1/')"); 
		/*Broken down from symput; this names a macro variable 'cor'*/
		/*Which contains a PRXPARSE statement that says: */
		/*put ALL characters present inside a capture group and replace with 'CORRELATION - [captured characters]'*/
	call symput('prog', "PRXPARSE('s/(.+)/PROGRESSION - $1/')");
	call symput('nlr', "PRXPARSE('s/(.+)/NLR PROGRESSION - $1/')");
	call symput('pair', "PRXPARSE('s/(.+)/PAIRING - $1/')");
	call symput('lab', "PRXPARSE('s/(.+)/AB - $1/')");
	run;	/*This creates the PRXPARSE statements inside macro variables to be called later during checks*/
	
	/*Use these statments as follows:*/
	data cons; set out.con_master; 
	re = &cor; /*assign a variable to hold the macro variable during the step*/
	/*FEVER CHECK*/
	if (BF_N_01 >= 1 and SF_N_22 = 0 and VIT_HIGH > 37.5) OR
	(SF_N_22 = 1 and BF_N_01 = 0)then do;
	/*The call PRXCHANGE statements execute based on the conditional logic above*/
	/*This replaces the Character data with the appended 'CORRELATION' notation*/
	call PRXCHANGE(re, -1, BF_C_01);	
	call PRXCHANGE(re, -1, SF_C_22);
	end;
	run;
	
	/*With these notations, during patient profile printing, the cells can easily be coloured to direct attention to discrepancies. This is extremely helpful when reviewing profiles and leads to increased accuracy and decreased time taken. I'm not delving deep into that here but once you have data 'long' by visit and are printing profiles it is simply a matter of looping the visits and checking the cell values as shown below during a PROC REPORT:*/
	
	%do x=1 %to &sNObs; /*sNObs is the last visit, visits are stored as Vx (ie V1 V2 V3)*/
	define V&x / display center  
	style(column)=[cellwidth=5% font_face='Arial' font_width=Narrow font_size=5.5pt] FLOW;
	compute V&x;
		if index(V&x, "CORRELATION") > 0 then 
		call define (_COL_, "style", "STYLE=[background=#FCD300]");
	endcomp;
	%end;