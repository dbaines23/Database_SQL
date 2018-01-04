
--DROP TABLE student;

CREATE TABLE student(sid INTEGER NOT NULL,
                     sname VARCHAR(15), 
                     CONSTRAINT PK_student PRIMARY KEY(sid));


--DROP TABLE major;

CREATE TABLE major(sid INTEGER NOT NULL,
                   major VARCHAR(15),
--                 CONSTRAINT PK_major PRIMARY KEY(major),
                   FOREIGN KEY(sid) REFERENCES student(sid));


--DROP TABLE book;

CREATE TABLE book(bookNo INTEGER NOT NULL,
                  title VARCHAR(30),
                  price INTEGER, 
                  CONSTRAINT PK_book PRIMARY KEY(bookNo));


--DROP TABLE cites;

CREATE TABLE cites(bookNo INTEGER NOT NULL,
                   citedBookNo INTEGER,
                   PRIMARY key(bookNo, citedBookNo),
                   FOREIGN KEY(citedBookNo) REFERENCES book(bookNo),
                   FOREIGN KEY(bookNo) REFERENCES book(bookNo));

--DROP TABLE buys;

CREATE TABLE buys(sid INTEGER NOT NULL,
                  bookNo INTEGER NOT NULL,
                  PRIMARY key(sid, bookNO),
                  FOREIGN KEY(sid) REFERENCES student(sid),
                  FOREIGN KEY(bookNo) REFERENCES book(bookNo));
                  
-- Data for polynomials

--delete from p;
--delete from q;

create table p (coefficient bigint, degree bigint);
create table q (coefficient bigint, degree bigint);

insert into p values (2,2), (-5, 1), (5, 0);
insert into q values (3,3), (1,2), (-1,1);

-- Data for point

--delete from point;

create table point (pid INTEGER, x FLOAT, y FLOAT);

INSERT INTO POINT values(1,0,0);
INSERT INTO POINT values(2,0,1);
INSERT INTO POINT values(3,1,0);
INSERT INTO POINT values(4,0,2);
INSERT INTO POINT values(5,1,1);
INSERT INTO POINT values(6,2,2);


-- Data for queries

DELETE FROM cites;
DELETE FROM buys;
DELETE FROM major;
DELETE FROM book;
DELETE FROM student;


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
INSERT INTO student VALUES(1021,'Vince');
INSERT INTO student VALUES(1022,'Joeri');

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
INSERT INTO book VALUES(2014,'Topology',70);

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
INSERT INTO buys VALUES(1020,2001);
INSERT INTO buys VALUES(1020,2012);
INSERT INTO buys VALUES(1022,2014);

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

-- Data for the major relation.

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
INSERT INTO major VALUES(1022,'CS');

-- ANSWERS 
-- Part 1: Miscellaneous Problems
--Question 1

--data for question 1
--create table A(x INTEGER);
--create table B(x INTEGER);
--INSERT INTO a values(1);
--INSERT INTO a values(2);
--INSERT INTO a values(3);
--INSERT INTO b values(1);
--INSERT INTO b values(2);

--(a)

Select 
NOT EXISTS ((select x from A) except (select x from B)) AS empty_a_minus_b, 
NOT EXISTS ((select x from B) except (select x from A)) AS empty_b_minus_a,
NOT EXISTS ((select x from A) intersect (select x from B)) AS empty_a_intersection_b;

--(b)

Select 
NOT EXISTS (select x from A where x not in (select x from B)) AS empty_a_minus_b,
NOT EXISTS (select x from B where x not in (select x from A)) AS empty_b_minus_a,
NOT EXISTS (select x from A where x in (select x from B)) AS empty_a_intersection_b;


--Quesiton 2

--data for question 2
--create table c(); 
--delete from a;
--delete from b;

--(a)
Select EXISTS ((select x from A) intersect (select x from B)) AS answer;

Select EXISTS (select x from A WHERE x IN (select x from B)) AS answer;

--(b)
Select NOT EXISTS ((select x from A) intersect (select x from B)) AS answer;

Select NOT EXISTS (select x from A WHERE x IN (select x from B)) AS answer;

--(c)
Select NOT EXISTS ((select x from B) except (select x from A)) AS answer;

Select NOT EXISTS (select x from B where x not in (select x from A)) AS answer;

--(d)
SELECT EXISTS ((select x from b) except (select a.x from a a));

SELECT EXISTS (select x from b where x not in (select a.x from a a));

--(e)
SELECT EXISTS (Select distinct a.x from A a where a.x NOT IN (Select b.x from b b));

SELECT EXISTS ((Select a.x from A a) except (Select b.x from b b));

--(f)

--(g)

--(h)


-- Question 3

--(a)
(SELECT p.coefficient + q.coefficient as Coefficient, p.degree FROM p, q WHERE p.degree = q.degree)
UNION
(SELECT p.coefficient, p.degree FROM p WHERE p.degree not in (select degree from q))
UNION
(SELECT q.coefficient, q.degree FROM q WHERE q.degree not in (select degree from p));

--(b)
SELECT sum(d.coefficient), degree
from (SELECT p.coefficient * q.coefficient as Coefficient, p.degree + q.degree AS degree FROM p,q WHERE q.degree in (select q.degree from q)) d
group by degree;


-- Question 4
--(a)
CREATE FUNCTION distance(x1 FLOAT, y1 FLOAT, x2 FLOAT, y2 FLOAT)
RETURNS FLOAT 
AS $$
SELECT sqrt(power(x1-x2,2)+power(y1-y2,2));    
$$  LANGUAGE SQL;

Select p1.pid, p2.pid
From Point p1, point p2
Where p1.pid <> p2.pid AND distance(p1.x,p1.y,p2.x,p2.y) <= ALL (Select pid From Point);

--(b)


-- Part 2: Parameterized Views: User-Defined Function Returning Sets of Records
-- Question 5
--(a)
CREATE function booksBoughtbyStudent(s int, out bookno int, out title VARCHAR(30), out price integer)
RETURNS setof record
AS $$
	SELECT DISTINCT b1.bookno, b1.title, b1.price 
    FROM student s1, book b1, buys b2 
    WHERE s = s1.sid AND s1.sid = b2.sid AND b1.bookno = b2.bookno;
$$ LANGUAGE SQL;

--(b)
Select b.bookno, b.title, b.price
From booksboughtbystudent(1001) b;

Select b.bookno, b.title, b.price
From booksboughtbystudent(1015) b;

--(c)
--(i)
Create view booksunder50 AS
(SELECT s.sid, s.sname, h.price
FROM student s, booksBoughtbyStudent(s.sid) h
WHERE h.price < 50);

(select distinct e.sid, e.sname
 from   booksunder50 e
 order by   e.sid)
 except
 (select distinct e1.sid, e1.sname
  from   booksunder50 e1, booksunder50 e2
  where  e1.sid =  e2.sid and e1.price <> e2.price);

--(ii)
(Select distinct s.sid
FROM major s, booksBoughtbyStudent(s.sid) h
WHERE s.major = 'CS')
EXCEPT
(Select s.sid
FROM major s, booksBoughtbyStudent(s.sid) h
WHERE s.major = 'CS' AND h.bookno in (SELECT b1.bookno
                                      FROM major m, booksBoughtbyStudent(m.sid) b, buys b1
                                      WHERE b.bookno = b1.bookno AND m.sid = b1.sid
                                      AND major = 'Math'));

--(iii)


-- Question 6
--(a)
CREATE FUNCTION studentWhoBoughtBook(b int, out sid int, out sname VARCHAR(15))
RETURNS setof record
AS $$
	SELECT DISTINCT s.sid, s.sname
    FROM student s, book b1, buys b2 
    WHERE b = b1.bookno AND s.sid = b2.sid AND b1.bookno = b2.bookno; 
$$ LANGUAGE SQL;

--(b)
SELECT * FROM studentWhoBoughtBook(2001);

SELECT * FROM studentWhoBoughtBook(2010);

--(c)


-- Part 3 Writing Queries using Aggregate Functions
-- Question 7

--(a)
CREATE FUNCTION numberOfBooksBoughtbyStudent(s int)
RETURNS bigint
AS $$
	SELECT coalesce ((SELECT count(*)
	FROM student s1, book b, buys b1
	WHERE s = s1.sid AND s1.sid = b1.sid AND b.bookno = b1.bookno 
	GROUP BY s1.sid),0); 
$$ LANGUAGE SQL;

--extra functions needed 
CREATE FUNCTION commonBOoks(s1 int, s2 int)
RETURNS setof record
AS $$
(SELECT b.bookno FROM buys b WHERE b.sid = commonBooks.s1) 
INTERSECT
(SELECT b.bookno FROM buys b WHERE b.sid = commonBooks.s2);
$$ LANGUAGE SQL;

CREATE FUNCTION numcommonBOoks(s1 int, s2 int)
RETURNS bigint
AS $$
select count(*)
from commonbooks(numcommonbooks.s1,numcommonbooks.s2) as h(bookno int)
$$ LANGUAGE SQL;

create view pairs as select s1.sid as s1, s2.sid as s2 FROM student s1, student s2 WHERE s1.sid <> s2.sid;

--(b)
--(i)
SELECT m.sid, numberOfBooksBoughtbyStudent(m.sid) as n
FROM major m, book b, buys b1
WHERE b1.sid = m.sid AND m.major = 'CS' AND numberOfBooksBoughtbyStudent(m.sid) > 2
GROUP BY m.sid;

--(ii)
SELECT DISTINCT s.sid
FROM student s
WHERE numberOfBooksBoughtbyStudent(s.sid) <= ANY (SELECT numberOfBooksBoughtbyStudent(m.sid)
                                                 FROM major m
                                                 WHERE m.major = 'CS');

--(iii)
SELECT sp.s1, sp.s2 
FROM pairs sp 
WHERE numberofbooksboughtbystudent(sp.s1) = numberofbooksboughtbystudent(sp.s2);

-- Question 8
--(a)
SELECT distinct s.sid, numberofbooksboughtbystudent(s.sid)
FROM student s, book b, buys b1
Where s.sid = b1.sid AND b.bookno = b1.bookno AND 300 > (SELECT Distinct sum(b2.price) FROM booksboughtbystudent(s.sid) b2)
union 
(select distinct s.sid, 0 from student s where s.sid not in (select sid from buys));

--(b)
Select bookno
FROM cites
Group by bookno
HAVING count(citedbookno) <= 4 AND count(citedbookno) >= 2
Order By bookno;

--(c)
Select b.bookno, b.title
From book b
WHERE b.price = (Select min(price) AS Price FROM book b2);

--(d)
SELECT s.sid, b.bookno
FROM student s, book b, buys b1
Where s.sid = b1.sid AND b.bookno = b1.bookno 
AND b.price = (SELECT Distinct Min(b2.price) FROM booksboughtbystudent(s.sid) b2);

--(e)
SELECT t.major
FROM (SELECT m.major, sum(b1.price) as total FROM major m, book b1, buys b WHERE m.sid = b.sid GROUP BY m.major) as t
WHERE t.total in (select max(t2.total) 
                  from (SELECT m.major, sum(b1.price) as total 
                        FROM major m, book b1, buys b 
                        WHERE m.sid = b.sid 
                        GROUP BY m.major) as t2);

--(f)
SELECT t.bookno
FROM major m, booksboughtbystudent(m.sid) t
WHERE major = 'Biology'
GROUP BY t.bookno
HAVING count(bookno) = (Select count(sid) from major where major = 'Biology');

--(g)
SELECT sp.s1, sp.s2 FROM pairs sp WHERE numcommonbooks(sp.s1, sp.s2) = 1;
