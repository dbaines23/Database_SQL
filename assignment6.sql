Derrick Baines
November 2, 2017
Assignment 6


3a.
	--Translating the Optimized RA into SQL
	Select s.sid, b1.bookno
	--for each of the queries between the joins is a step and should be placed as a subquery in the from clause
	--step 1
	FROM (Select * FROM student Where sname = 'Eric') s
	--step 2
	NATURAL JOIN
	--step 3
	(select * from buys where bookno <> '2010') b1
	--step 4 (inner join because you are using the same table but under different conditions)
	INNER JOIN
	--step 5
	buys b2 ON (b1.bookno <> b2.bookno AND b1.sid = b2.sid);


	--OUTPUT:
	--________________
	--| sid | bookno |
	--|1012 | 2012   |
	--|1012 | 2011   |
	--



3e.
	--For this translation i show the different steps as different lines
	--The natural joins are representation of the semijoin in RA from the optimized version of the query
	SELECT DISTINCT s.sid 
	FROM (SELECT * FROM student WHERE sname = 'Eric') s 
			NATURAL JOIN 
	 			(SELECT b.price
      			 	 FROM (SELECT * FROM book WHERE price > 50) b 
      					NATURAL JOIN 
     						(SELECT 1
      						 FROM (SELECT * FROM buys) t) 
                 								q0) --name the exists semijoin query as a whole
                                                                			q1; --name the exists semijoin query as a whole and end the query


	--OUTPUT:
	--_______
	--| sid |
	--|1012 |
	--