--Derrick Baines
--September 6, 2017
--Assignment 2
--NOTE: I worked on a couple of questions from this assignment with Keith and Omkar

--DROP TABLE student;

CREATE TABLE student(sid INTEGER NOT NULL,
		     sname VARCHAR(15), 
	     	     CONSTRAINT PK_student PRIMARY KEY(sid));


--DROP TABLE major;

CREATE TABLE major(sid INTEGER NOT NULL,
		   major VARCHAR(15), 
	     	   FOREIGN KEY(sid) REFERENCES student(sid));


--DROP TABLE book;

CREATE TABLE book(bookNo INTEGER NOT NULL,
		  title VARCHAR(30),
		  price INTEGER, 
	     	  CONSTRAINT PK_book PRIMARY KEY(bookNo));


--DROP TABLE cites;

CREATE TABLE cites(citedBookNo INTEGER,
		   bookNo INTEGER NOT NULL,
		   FOREIGN KEY(citedBookNo) REFERENCES book(bookNo),
		   FOREIGN KEY(bookNo) REFERENCES book(bookNo));


--DROP TABLE buys;

CREATE TABLE buys(sid INTEGER NOT NULL,
		  bookNo INTEGER NOT NULL, 
	     	  FOREIGN KEY(sid) REFERENCES student(sid),
		  FOREIGN KEY(bookNo) REFERENCES book(bookNo));



-- Data for the student relation.

INSERT INTO student VALUES(1001,'Jean');
INSERT INTO student VALUES(1002,'Maria');
INSERT INTO student VALUES(1003,'Anna');
INSERT INTO student VALUES(1004,'Chin');
INSERT INTO student VALUES(1005,'John');
INSERT INTO student VALUES(1006,'Ryan');
INSERT INTO student VALUES(1007,'Catherine');
INSERT INTO student VALUES(1008,'Emma');
INSERT INTO student VALUES(1009,'Jan');
INSERT INTO student VALUES(1010,'Linda');
INSERT INTO student VALUES(1011,'Nick');
INSERT INTO student VALUES(1012,'Eric');
INSERT INTO student VALUES(1013,'Lisa');
INSERT INTO student VALUES(1014,'Filip');
INSERT INTO student VALUES(1015,'Dirk');
INSERT INTO student VALUES(1016,'Mary');
INSERT INTO student VALUES(1017,'Ellen');
INSERT INTO student VALUES(1020,'Ahmed');

-- Data for the book relation.

INSERT INTO book VALUES(2001,'Databases',40);
INSERT INTO book VALUES(2002,'OperatingSystems',25);
INSERT INTO book VALUES(2003,'Networks',20);
INSERT INTO book VALUES(2004,'AI',45);
INSERT INTO book VALUES(2005,'DiscreteMathematics',20);
INSERT INTO book VALUES(2006,'SQL',25);
INSERT INTO book VALUES(2007,'ProgrammingLanguages',15);
INSERT INTO book VALUES(2008,'DataScience',50);
INSERT INTO book VALUES(2009,'Calculus',10);
INSERT INTO book VALUES(2010,'Philosophy',25);
INSERT INTO book VALUES(2012,'Geometry',80);
INSERT INTO book VALUES(2013,'RealAnalysis',35);
INSERT INTO book VALUES(2011,'Anthropology',50);

-- Data for the buys relation.

INSERT INTO buys VALUES(1001,2002);
INSERT INTO buys VALUES(1001,2007);
INSERT INTO buys VALUES(1001,2009);
INSERT INTO buys VALUES(1001,2011);
INSERT INTO buys VALUES(1001,2013);
INSERT INTO buys VALUES(1002,2001);
INSERT INTO buys VALUES(1002,2002);
INSERT INTO buys VALUES(1002,2007);
INSERT INTO buys VALUES(1002,2011);
INSERT INTO buys VALUES(1002,2012);
INSERT INTO buys VALUES(1002,2013);
INSERT INTO buys VALUES(1003,2002);
INSERT INTO buys VALUES(1003,2007);
INSERT INTO buys VALUES(1003,2011);
INSERT INTO buys VALUES(1003,2012);
INSERT INTO buys VALUES(1003,2013);
INSERT INTO buys VALUES(1004,2006);
INSERT INTO buys VALUES(1004,2007);
INSERT INTO buys VALUES(1004,2008);
INSERT INTO buys VALUES(1004,2011);
INSERT INTO buys VALUES(1004,2012);
INSERT INTO buys VALUES(1004,2013);
INSERT INTO buys VALUES(1005,2007);
INSERT INTO buys VALUES(1005,2011);
INSERT INTO buys VALUES(1005,2012);
INSERT INTO buys VALUES(1005,2013);
INSERT INTO buys VALUES(1006,2006);
INSERT INTO buys VALUES(1006,2007);
INSERT INTO buys VALUES(1006,2008);
INSERT INTO buys VALUES(1006,2011);
INSERT INTO buys VALUES(1006,2012);
INSERT INTO buys VALUES(1006,2013);
INSERT INTO buys VALUES(1007,2001);
INSERT INTO buys VALUES(1007,2002);
INSERT INTO buys VALUES(1007,2003);
INSERT INTO buys VALUES(1007,2007);
INSERT INTO buys VALUES(1007,2008);
INSERT INTO buys VALUES(1007,2009);
INSERT INTO buys VALUES(1007,2010);
INSERT INTO buys VALUES(1007,2011);
INSERT INTO buys VALUES(1007,2012);
INSERT INTO buys VALUES(1007,2013);
INSERT INTO buys VALUES(1008,2007);
INSERT INTO buys VALUES(1008,2011);
INSERT INTO buys VALUES(1008,2012);
INSERT INTO buys VALUES(1008,2013);
INSERT INTO buys VALUES(1009,2001);
INSERT INTO buys VALUES(1009,2002);
INSERT INTO buys VALUES(1009,2011);
INSERT INTO buys VALUES(1009,2012);
INSERT INTO buys VALUES(1009,2013);
INSERT INTO buys VALUES(1010,2001);
INSERT INTO buys VALUES(1010,2002);
INSERT INTO buys VALUES(1010,2003);
INSERT INTO buys VALUES(1010,2011);
INSERT INTO buys VALUES(1010,2012);
INSERT INTO buys VALUES(1010,2013);
INSERT INTO buys VALUES(1011,2002);
INSERT INTO buys VALUES(1011,2011);
INSERT INTO buys VALUES(1011,2012);
INSERT INTO buys VALUES(1012,2011);
INSERT INTO buys VALUES(1012,2012);
INSERT INTO buys VALUES(1013,2001);
INSERT INTO buys VALUES(1013,2011);
INSERT INTO buys VALUES(1013,2012);
INSERT INTO buys VALUES(1014,2008);
INSERT INTO buys VALUES(1014,2011);
INSERT INTO buys VALUES(1014,2012);
INSERT INTO buys VALUES(1017,2001);
INSERT INTO buys VALUES(1017,2002);
INSERT INTO buys VALUES(1017,2003);
INSERT INTO buys VALUES(1017,2008);
INSERT INTO buys VALUES(1017,2012);
INSERT INTO buys VALUES(1020,2012);

-- Data for the cites relation.
INSERT INTO cites VALUES(2012,2001);
INSERT INTO cites VALUES(2008,2011);
INSERT INTO cites VALUES(2008,2012);
INSERT INTO cites VALUES(2001,2002);
INSERT INTO cites VALUES(2001,2007);
INSERT INTO cites VALUES(2002,2003);
INSERT INTO cites VALUES(2003,2001);
INSERT INTO cites VALUES(2003,2004);
INSERT INTO cites VALUES(2003,2002);


-- Data for the cites relation.

INSERT INTO major VALUES(1001,'Math');
INSERT INTO major VALUES(1001,'Physics');
INSERT INTO major VALUES(1002,'CS');
INSERT INTO major VALUES(1002,'Math');
INSERT INTO major VALUES(1003,'Math');
INSERT INTO major VALUES(1004,'CS');
INSERT INTO major VALUES(1006,'CS');
INSERT INTO major VALUES(1007,'CS');
INSERT INTO major VALUES(1007,'Physics');
INSERT INTO major VALUES(1008,'Physics');
INSERT INTO major VALUES(1009,'Biology');
INSERT INTO major VALUES(1010,'Biology');
INSERT INTO major VALUES(1011,'CS');
INSERT INTO major VALUES(1011,'Math');
INSERT INTO major VALUES(1012,'CS');
INSERT INTO major VALUES(1013,'CS');
INSERT INTO major VALUES(1013,'Psychology');
INSERT INTO major VALUES(1014,'Theater');
INSERT INTO major VALUES(1017,'Anthropology');


--Queries

--(1)
(SELECT DISTINCT b.bookno, b.title
FROM book b, buys b1,
((SELECT DISTINCT sid FROM major WHERE major = 'Math') INTERSECT
(SELECT DISTINCT sid FROM major WHERE major = 'CS')) m
Where b.bookno = b1.bookno AND b.price <= 40 and b.price >= 10 AND b1.sid IN (m.sid));

--(2)
(SELECT DISTINCT s.sid, s.sname
FROM cites c1, book b1,  book b2, student s, buys b3
WHERE c1.citedbookno = b1.bookno AND c1.bookno = b2.bookno AND
b1.price > b2.price AND s.sid = b3.sid AND c1.bookno = b3.bookno);

--(3)
(SELECT DISTINCT c1.citedbookno
FROM cites c1, cites c2, cites c3
WHERE c1.bookno = c2.bookno AND c1.bookno = c3.bookno
AND c2.citedbookno <> c3.citedbookno);

--(4) 
((SELECT b.bookno FROM book b)  EXCEPT  (SELECT y.bookno FROM buys y));

--(5) 
(SELECT DISTINCT sid
FROM student EXCEPT
(SELECT DISTINCT s.sid
FROM student s, book b1, buys b2
WHERE s.sid = b2.sid AND b1.bookno = b2.bookno AND b1.price > 50));

--(6) 
(SELECT DISTINCT b1.bookno
FROM student s, buys b1, book b2, major m1
WHERE s.sid = b1.sid AND b1.bookno = b2.bookno
AND s.sid = m1.sid AND major = 'CS' AND s.sid in (SELECT sid from buys))
EXCEPT
(SELECT DISTINCT b1.bookno
FROM student s, buys b1, book b2, major m1
WHERE s.sid = b1.sid AND b1.bookno = b2.bookno
AND s.sid = m1.sid AND major = 'Math' AND s.sid in (SELECT sid from buys));

--(7)
(select distinct s.sid
from  major s
where not exists (select m1.sid
             from major m1
             where m1.sid = s.sid AND
             s.major <> m1.major))
INTERSECT
((select DISTINCT sid
from buys)
EXCEPT
(SELECT DISTINCT b3.sid
FROM  buys b3
WHERE  b3.bookno NOT IN (SELECT c1.bookno FROM cites c1)));

--(8)
((SELECT s.sid, m1.major
FROM student s, book b, buys b1, major m1
WHERE s.sid = b1.sid AND m1.sid = s.sid 
AND b.bookno = b1.bookno)
EXCEPT
(SELECT b.sid, m1.major
FROM buys b, book b1, student s, major m1
WHERE b.bookno = b1.bookno AND m1.sid = s.sid AND s.sid = b.sid 
 AND b1.price < 30));

--(9)
(SELECT b1.sid, b.bookno
FROM book b, buys b1
WHERE b.bookno = b1.bookno AND b.price >= ALL 
(SELECT b2.price
 FROM book b2, buys bb 
 WHERE bb.bookno = b2.bookno 
 AND b1.sid = bb.sid));

--(10)
(SELECT DISTINCT b.price
FROM book b
WHERE exists (SELECT b1.price 
              FROM book b1
              WHERE b1.price > b.price) AND
              NOT EXISTS (SELECT b1.price 
                          FROM book b1, book b2
                          WHERE b1.price > b2.price AND b2.price > b.price));

--(11)
((SELECT s.sid, b1.bookno, b2.bookno
FROM student s, book b1, book b2
WHERE b1.bookno <> b2.bookno)
EXCEPT
(SELECT s.sid, b1.bookno, b2.bookno
FROM student s, buys b1, buys b2
WHERE s.sid = b1.sid AND s.sid = b2.sid AND b1.bookno <> b2.bookno)
EXCEPT 
(SELECT b.sid, b1.bookno, b.bookno
FROM buys b, book b1));


--(12)
((SELECT s.sid
FROM cites c1, book b1, book b2, student s, buys b3
WHERE c1.citedbookno = b1.bookno AND c1.bookno = b2.bookno
AND c1.bookno = b3.bookno)
EXCEPT
(SELECT s.sid
FROM cites c1, book b1, book b2, student s, buys b3
WHERE c1.citedbookno = b1.bookno 
AND c1.bookno = b2.bookno AND s.sid = b3.sid 
AND c1.bookno = b3.bookno AND c1.citedbookno = 2001));

--(13)
 --working on this with the AI

--(14)
(SELECT s.sid
FROM student s, book b, buys b1
 WHERE s.sid = b1.sid AND b1.bookno = b.bookno
 AND b.price > ANY (SELECT b.bookno
                    FROM book b
                    WHERE NOT EXISTS (Select s.major
                                      	from major s
                                      	WHERE major = 'Math'  AND s.sid NOT IN (SELECT s.sid
                                                                                  FROM student s, buys b
                                                                                  WHERE b.sid = s.sid ))))

