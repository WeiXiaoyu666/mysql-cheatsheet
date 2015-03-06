/* All this query based on mysql 'classicmodels' database. */

/* power function 
in here first parameter is the base, and second is the exponent to be applied
*/
SELECT power(5,2);

/* the pi function doesn't need a parameter */
SELECT pi();

/* column aliases */
SELECT pi() 'ook lets do it';
SELECT pi() ook_lets_do_it;
SELECT pi() as ok;
SELECT pi() ok;

/* concatenating a string */
select concat('hey, jim', ' how are you');
/* concatenating a string and a numeric value */
select concat('hey, jim ', 12);
/* multiple concatenating */
select concat('hey, jim ', 12) as you, concat('hello world', ' I am fine') as we;

/* to check if a column is null or not or a value is null or not
it's a binary operator 
 */
select isnull(null);
select isnull(4);
/* if null will return the 1st parameter if the value is not null
and the2nd if the value is null
 */
select ifnull(null, 'yes null value');
select ifnull(8, 'yes null value');

/* to define a variable in mysql */
select @variablename;

/* to assign a value to a variable */
select @a := 12;
/* process number 2 */
SET @a := 20;
select @a;

/* comparing */
select @a = @b;

/* system and status variable */
	/* to find base directory */
	select @@basedir; 
	/* status variable to show how many time you have entered select command */
	show status like 'com_select';
	/* */
	select @@global.time_zone, @@session.time_zone, @@local.time_zone, @@time_zone;
	
	/* to find how may 3's are there in 10 */
	select 10 div 3;
	/* operand */ 
	select 10 % 3;
	select 10 mod 3;

/* string compression  */
	/* using "BETWEEN", "AND" operator in another way */
	select 4 between 5 and 10;
	/*the answer is 0, it is returning a binary answer*/
	select 6 between 5 and 10;
	/*the answer is 1, it is returning a binary answer*/
	
/* logical operator  */
select customerNumber, amount from payments where amount and amount < 2000;

set @test = 5;
/* benchmark is a function, first parameter takes the number of iteration we want to perform
and the second is the expression we want to evaluate  */
select  benchmark(100000, @test > 0 and @test < 1000);

/* order of precedence */
	/* Building mathematical order in calculations */
	select ((2+2)*(4/2));
	
/* Function and parameters */
	/* few numeric functions */
	select pi();
	/* This function by default shows 6 decimal places of value, mysql actually uses a full precetion of 16 
	significant digits, to expand that we need to do this */
	select pi() + 0.000000000000000;
	
	/* The power function has two form a long form and a short form */
	select power(5, 2);
	/* and */
	select pow(5, 2);
	/* We can do many things with this power function, for say we can find square root of 5 */
	select power(5, .5); /*or*/ select power(5, 0.5);
	/* We do have a separate square root function which will give the same answer */
	select sqrt(5);
	/* Rounding a number */
	/* Without a second parameter it rounds up a number */
	select round(387.965);
	/* But if we provide a second parameter, like how many decimal places we want the number to round */
	select round(387.965, 2);
	/* If we put a negative second  parameter, it then decides the power of 10 we want our number to round up to */
	select round(387.965, -2);
	/* The truncate is the exact opposite of round, it takes two parameters */
	select truncate(387.965, -2);
	/* There are few more functions */
	select floor(387.965);
	select ceil(387.965); /* or */ select ceiling(387.965);
	
/* Character string function */
	/* Concat function to concat a string */
	select concat('Hello', ' World', ' I am a function');
	/* The concat_ws uses the first value to glue the rest of the string in concat_ws 
	The ws stands for separator */
	select concat_ws(' ', 'A', 'B', 'C');
	/* Extracting characters from a string */
	/* This will extract 'my' from 'mysql' */
	select left('mysql', 2);
	/* This will extract 'sql' from 'mysql' */
	select right('mysql', 3);
	/* The mid() function has two form first one:
	the second argument denote the number of the char where we begin extraction 
	the answer of this will be 'ysql' */
	select mid('mysql', 2);
	/* The third argument denotes upto where we want to get the string 
	the answer of this will be 'ysq' */
	select mid('mysql', 2, 3);
	/* there is another function substring() and substr() both are synonyms with mid() fuunction  */
	
	/* The substring_index() function is extremely useful, we can understand up-to second parameter, 
	the third parameter indicate to get the first '@' we found, if we put 2 it will search for a second '@' */
	/* the answer of this is 'batman' */
	select substring_index('batman@gmail.com', '@', 1);
	/* if we put a negative 1 i.e. (-1) the answer will be 'gmail.com' */
	select substring_index('batman@gmail.com', '@', -1);
	select substring_index('domain.subdomain.com', '.', -2); /* answer is  'subdomain.com' */
	
/* Temporal Function */	
	/* Adding 5days to a given date */
	SELECT  '2014-08-25' + INTERVAL 5 DAY;
	/* To add 5 years and 3 months */
	SELECT  '2014-08-25' + INTERVAL 5 YEAR + INTERVAL 3 MONTH;
	/* or, In both cases the answer will be same */
	SELECT  '2014-08-25' + INTERVAL '5-3' YEAR_MONTH;
	/* Showing the date format */
	SELECT date_format('2014-08-28', '%W, %M %D, %Y');
	/* or */
	select date_format(curdate(), '%W, %M %D, %Y');
	/* select specific part from a date */
	/* Select day from a date */
	select day('2014-08-29');
	/* Select month from a date */
	select month('2014-08-29');
	/* or */
	select extract(month from '2014-08-29');
	/* Select year from a date */
	select year('2014-08-29');
	/* Select day name from a date */
	select dayname('2014-08-29');	
	/* converting a string to date */
	select STR_TO_DATE('December 25th, 2014', '%M %D, %Y');
	/* To find amount of time there is between two dates */
	select DATEDIFF('2014-08-29','1988-06-03');
	
/* Control flow functions */
	/* IF in mysql */
	select if(15>12, 'larger', 'smaller');
	/* ELT function */
	select elt(2, 25, 13*85, '2020-12-20' + INTERVAL 5 DAY);
	/* CASE Function */
	/* CASE with a reference value */
	select CASE 'A' 
		WHEN 'A' THEN 'first' 
		WHEN 'B' THEN 'SECOND' 
	ELSE 'Nothing'
	END;
	
/* Null related functions */
	/* ISNULL Function will return boolean value 1 or 0  */
	select isnull(null); /* or */ select isnull(41);
	/* IS Function check and return boolean value 1 or 0  */
	select 5 is null; /* or */ select NULL is NULL;
	/* IFNULL redirect being null from being something else */
	select ifnull(null, 'Ok Its null'); /* this will return 'Ok Its null' */
	select ifnull(5, 'Ok Its null'); /* this will return the value it self i.e. 5 */
	
/* Information Functions */
	/* to check the version */
	select version();
	/* to know the database we are working on */
	select database();
	/* to know the connection id */
	select connection_id();
	/* to know the current user */
	select current_user();
	/* to see if a database is selected or not */
	select database();	
	/* to see how many rows we have avoided getting */
	select sql_calc_found_rows * from customers limit 5;
	select found_rows();
