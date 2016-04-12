/*Explicit List Loops:	
	I'm going to preface this with a simple statement; This is generally NOT what you want to do. SAS implicitly loops. Generally, this is sufficient. However, if you have a whole lot you want to do on a log line level; This is what you are looking for. I have applied this to all sorts of issues and found 90% of the time it is not efficient. Where it is efficient is review output. In clinical data management, we tend to look at patients. Each patient contains a lot of data and usually a lot must be done to make it readily viewable.

	With this, I give you the basic template of how to make an explicit SAS list loop:*/
	
	data PTS1_LST; set PB;keep PT;run; /*Assuming PB contains all patient IDs and PT is your patient ID*/
	proc sort data = PTS1_LST noduprecs;by PT;run; /*PTS1_LST will now contain only the unique PT (patient) ids*/

	%macro ptlstinc(pttbl=); /*Start a macro in order to use macro commands*/
	data _null_;
	%let id=%sysfunc(open(&pttbl)); /*OPEN the patient ID dataset*/
	%let NObs=%sysfunc(attrn(&id,NOBS)); /*Store the number of IDs*/
	%let id=%sysfunc(close(&id));	/*CLOSE the patient ID dataset*/
	run;
	%do ptctr = 1 %to &NObs;	/*START a loop to end on last ID*/
	data x2; 
		obsnm=&ptctr;
		set &pttbl point=obsnm; 
		output;
		stop; /*Create a dataset to store the single iteration of ID*/
	run;
	data _null_;
		set x2;
		call symput('SUBJECT', PT); /*Store that ID as a macro variable*/
	run;	
		/*USE the macro variable as criteria for a macro stack*/
		/*In this example 'makePrintable' took narrow data and made it long by visit*/
		/*and then printForms output a PDF containing the patient specific datasets, named by patient ID and dated*/
		%makePrintable(SUBJECT=&SUBJECT); 
		%printForms(SUBJECT=&SUBJECT);
	%end;
	%mend;
	%ptlstinc(pttbl=PTS1_LST); /*Initiate the macro*/