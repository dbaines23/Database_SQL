--Derrick Baines
--October 19, 2017
--Assignment 5

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
                  
-- Data for Assignment 5
-- student 

insert into student values(1001,'Jean');
insert into student values(1002,'Maria');
insert into student values(1003,'Anna');
insert into student values(1004,'Chin');
insert into student values(1005,'John');
insert into student values(1006,'Ryan');
insert into student values(1007,'Catherine');
insert into student values(1008,'Emma');
insert into student values(1009,'Jan');
insert into student values(1010,'Linda');
insert into student values(1011,'Nick');
insert into student values(1012,'Eric');
insert into student values(1013,'Lisa');
insert into student values(1014,'Filip');
insert into student values(1015,'Dirk');
insert into student values(1016,'Mary');
insert into student values(1017,'Ellen');
insert into student values(1020,'Ahmed');
insert into student values(1021,'Vince');
insert into student values(1022,'Joeri');
insert into student values(1023,'Chris');
insert into student values(1040,'Sofie');


-- book 

insert into book values(2001,'Databases',40);
insert into book values(2002,'OperatingSystems',25);
insert into book values(2003,'Networks',20);
insert into book values(2004,'AI',45);
insert into book values(2005,'DiscreteMathematics',20);
insert into book values(2006,'SQL',25);
insert into book values(2007,'ProgrammingLanguages',15);
insert into book values(2008,'DataScience',50);
insert into book values(2009,'Calculus',10);
insert into book values(2010,'Philosophy',25);
insert into book values(2012,'Geometry',80);
insert into book values(2013,'RealAnalysis',35);
insert into book values(2011,'Anthropology',50);
insert into book values(2014,'Topology',70);

-- cites 
insert into cites values(2012,2001);
insert into cites values(2008,2011);
insert into cites values(2008,2012);
insert into cites values(2001,2002);
insert into cites values(2001,2007);
insert into cites values(2002,2003);
insert into cites values(2003,2001);
insert into cites values(2003,2004);
insert into cites values(2003,2002);
insert into cites values(2010,2001);
insert into cites values(2010,2002);
insert into cites values(2010,2003);
insert into cites values(2010,2004);
insert into cites values(2010,2005);
insert into cites values(2010,2006);
insert into cites values(2010,2007);
insert into cites values(2010,2008);
insert into cites values(2010,2009);
insert into cites values(2010,2011);
insert into cites values(2010,2013);
insert into cites values(2010,2014);

-- buys
insert into buys values(1023,2012);
insert into buys values(1023,2014);
insert into buys values(1040,2002);
insert into buys values(1001,2002);
insert into buys values(1001,2007);
insert into buys values(1001,2009);
insert into buys values(1001,2011);
insert into buys values(1001,2013);
insert into buys values(1002,2001);
insert into buys values(1002,2002);
insert into buys values(1002,2007);
insert into buys values(1002,2011);
insert into buys values(1002,2012);
insert into buys values(1002,2013);
insert into buys values(1003,2002);
insert into buys values(1003,2007);
insert into buys values(1003,2011);
insert into buys values(1003,2012);
insert into buys values(1003,2013);
insert into buys values(1004,2006);
insert into buys values(1004,2007);
insert into buys values(1004,2008);
insert into buys values(1004,2011);
insert into buys values(1004,2012);
insert into buys values(1004,2013);
insert into buys values(1005,2007);
insert into buys values(1005,2011);
insert into buys values(1005,2012);
insert into buys values(1005,2013);
insert into buys values(1006,2006);
insert into buys values(1006,2007);
insert into buys values(1006,2008);
insert into buys values(1006,2011);
insert into buys values(1006,2012);
insert into buys values(1006,2013);
insert into buys values(1007,2001);
insert into buys values(1007,2002);
insert into buys values(1007,2003);
insert into buys values(1007,2007);
insert into buys values(1007,2008);
insert into buys values(1007,2009);
insert into buys values(1007,2010);
insert into buys values(1007,2011);
insert into buys values(1007,2012);
insert into buys values(1007,2013);
insert into buys values(1008,2007);
insert into buys values(1008,2011);
insert into buys values(1008,2012);
insert into buys values(1008,2013);
insert into buys values(1009,2001);
insert into buys values(1009,2002);
insert into buys values(1009,2011);
insert into buys values(1009,2012);
insert into buys values(1009,2013);
insert into buys values(1010,2001);
insert into buys values(1010,2002);
insert into buys values(1010,2003);
insert into buys values(1010,2011);
insert into buys values(1010,2012);
insert into buys values(1010,2013);
insert into buys values(1011,2002);
insert into buys values(1011,2011);
insert into buys values(1011,2012);
insert into buys values(1012,2011);
insert into buys values(1012,2012);
insert into buys values(1013,2001);
insert into buys values(1013,2011);
insert into buys values(1013,2012);
insert into buys values(1014,2008);
insert into buys values(1014,2011);
insert into buys values(1014,2012);
insert into buys values(1017,2001);
insert into buys values(1017,2002);
insert into buys values(1017,2003);
insert into buys values(1017,2008);
insert into buys values(1017,2012);
insert into buys values(1020,2001);
insert into buys values(1020,2012);
insert into buys values(1022,2014);

-- major
insert into major values(1001,'Math');
insert into major values(1001,'Physics');
insert into major values(1002,'CS');
insert into major values(1002,'Math');
insert into major values(1003,'Math');
insert into major values(1004,'CS');
insert into major values(1006,'CS');
insert into major values(1007,'CS');
insert into major values(1007,'Physics');
insert into major values(1008,'Physics');
insert into major values(1009,'Biology');
insert into major values(1010,'Biology');
insert into major values(1011,'CS');
insert into major values(1011,'Math');
insert into major values(1012,'CS');
insert into major values(1013,'CS');
insert into major values(1013,'Psychology');
insert into major values(1014,'Theater');
insert into major values(1017,'Anthropology');
insert into major values(1022,'CS');
insert into major values(1015,'Chemistry');


--Problem 1
create or replace function setunion(A anyarray, B anyarray) returns anyarray as
$$
with
		Aset as (select UNNEST(A)),
        Bset as (select UNNEST(B))
select array( (select * from Aset) union (select * from Bset) order by 1);
$$ language sql;

--(a)
create or replace function setintersection(A anyarray, B anyarray) returns anyarray as
$$
with
		Aset as (select UNNEST(A)),
        Bset as (select UNNEST(B))
select array( (select * from Aset) intersect (select * from Bset) order by 1);
$$ language sql;

--(b)
create or replace function setdifference(A anyarray, B anyarray) returns anyarray as
$$
with
		Aset as (select UNNEST(A)),
        Bset as (select UNNEST(B))
select array( (select * from Aset) except (select * from Bset) order by 1);
$$ language sql;

--additional function
create or replace function memberof(x anyelement, S anyarray) returns boolean as
$$
select x = SOME(S)
$$ language sql;


--Problem 2
create or replace view student_books as
	select s.sid, array(select t.bookno
                        from   buys t
                        where  t.sid = s.sid order by bookno) as books
    from   student s order by sid;

--(a)
create or replace view book_students as
	select b.bookno, array(select s.sid
                         from student s, buys t
                         where s.sid = t.sid and t.bookno = b.bookno order by sid) as students
	from book b order by bookno;

--(b)
create or replace view book_citedbooks as
   select b.bookno, array(select c1.citedbookno
                          from   cites c1
                          where  c1.bookno = b.bookno order by citedbookno) as citedbooks
   from   book b order by bookno;

--(c)
create or replace view book_citingbooks as
   select b.bookno as bookno, array(select c1.bookno
                                    from   cites c1
                                    where  c1.citedbookno = b.bookno order by bookno) as citingbooks
   from   book b order by bookno;

--(d)
create or replace view major_students as
	select distinct m1.major as major ,array(Select m2.sid
                                    		 from major m2
                                    		 where m2.major = m1.major) AS students
	from major m1 order by m1.major;

--(e)
create or replace view student_majors as
	select m1.sid as sid ,array(Select distinct m2.major
                                    from major m2
                                    where m2.sid = m1.sid) AS majors
	from student m1 order by m1.sid;


--Problem 3
--(a)
SELECT distinct b.bookno
FROM book b
Where exists (Select 1
              FROM book_citedbooks s, book_citedbooks s1 
              WHERE s.citedbooks <> s1.citedbooks AND
              memberof(b.bookno, setintersection(s.citedbooks, s1.citedbooks)) AND 
              memberof(s.bookno, array(select b2.bookno from book b2 where b2.price <50)) AND
              memberof(s1.bookno, array(select b2.bookno from book b2 where b2.price <50)));
	
--(b)
SELECT DISTINCT b.bookno, b.title
FROM book b, student_books sb, major_students sm, major_students sm2
WHERE memberof(b.bookno, sb.books) AND memberof(sb.sid, setintersection(sm.students,sm2.students)) AND sm.major = 'CS' AND sm2.major = 'Math'
Order By bookno;
	
--(c)
SELECT s.sid, b.bookno
FROM book_students b, student s
Where memberof(s.sid, b.students) AND exists (Select 1
              FROM book_citedbooks s, book_citedbooks s1 
              WHERE s.citedbooks <> s1.citedbooks AND
              memberof(b.bookno, setintersection(s.citedbooks, s1.citedbooks)) AND 
              memberof(s.bookno, array(select b2.bookno from book b2 where b2.price <50)) AND
              memberof(s1.bookno, array(select b2.bookno from book b2 where b2.price <50)))
              Order by s.sid, b.bookno;

--(d)
SELECT bb.bookno
FROM book_citingbooks bb
Where cardinality(bb.citingbooks) = 1;
     
--(e)
Select s.sid
from student_books s
where array (select bookno from book where price >50) <@ s.books;

--(f)
Select s.sid
from student_books s
where NOT array (select bookno from book where price >50) && s.books;

--(g)
Select s.sid
from student_books s
where s.books <@ array(select bookno from book where price >50);

--(h)
SELECT distinct s.sid, s.sname
FROM student s, student_books sb
WHERE s.sid = sb.sid AND
cardinality(setintersection(sb.books, array(select bookno from book where price <50))) = 1;

--(i)
SELECT b1.bookno
FROM book b1
WHERE b1.bookno NOT IN (SELECT b.bookno
                        FROM book b, student_books sb, major_students sm, major_students sm2
                        WHERE memberof(b.bookno, sb.books) AND 
                        	  memberof(sb.sid, setintersection(sm.students,sm2.students)) AND 
                        	  sm.major = 'CS'
                        Order By bookno);

--(j)
SELECT b1.bookno
FROM book b1
WHERE b1.bookno NOT IN (SELECT b.bookno
                        FROM book b, student_books sb, major_students sm, major_students sm2
                        WHERE memberof(b.bookno, sb.books) AND 
                        	  memberof(sb.sid, setintersection(sm.students,sm2.students)) AND 
                        	  sm.major = 'Anthropology'
                        Order By bookno);

--(k)
SELECT s.sid
FROM student s, major_students sm
WHERE memberof(s.sid,sm.students) AND sm.major = 'CS'
AND CARDINALITY(setintersection(array(SELECT b.bookno FROM book b, student_books sb WHERE memberof(b.bookno, sb.books) AND sb.sid = s.sid ),
                                array(SELECT b.bookno FROM book b, student_books sb, major_students sm WHERE memberof(b.bookno, sb.books) AND memberof(sb.sid,sm.students) AND sm.major = 'Math' ))) = 0;


--(l)
SELECT s.sid, b.bookno
FROM student_books s, book b
Where cardinality(setdifference(s.books, array(select unnest(cb.citingbooks) 
                                               from book_citingbooks cb 
                                               where cb.bookno = b.bookno))) >= 1;


--(m)
SELECT s.sid, b.bookno
FROM student_books s, book b
Where cardinality(setdifference(s.books, array(select unnest(cb.citingbooks) 
                                               from book_citingbooks cb 
                                               where cb.bookno = b.bookno))) = 0;

--(n)
SELECT s1.sid, s2.sid
FROM student_books s1, student_books s2
WHERE s1.sid <> s2.sid AND s1.books = s2.books
Order By s1.sid, s2.sid;

--(o)
SELECT s1.sid, s2.sid
FROM student_books s1, student_books s2
WHERE s1.sid <> s2.sid AND cardinality(s1.books) = cardinality(s2.books)
Order By s1.sid, s2.sid;

--(p)
SELECT b.bookno
FROM book b
Where cardinality(setdifference(array(select b1.bookno from book b1), 
                                array(select unnest(cb.citedbooks) 
                                               from book_citedbooks cb 
                                               where cb.bookno = b.bookno))) = 2;

--(q)
SELECT s.sid
FROM student_books s
WHERE cardinality(s.books) < cardinality(array(SELECT b.bookno as bookno
                                               FROM book b, student_books sb, major_students sm, major_students sm2
                                               WHERE memberof(b.bookno, sb.books)
                                               AND memberof(sb.sid, setintersection(sm.students,sm2.students))
                                               AND sm.major = 'Anthropology'));

--(r)
Select b2.bookno
FROM book_citingbooks b1, book_citedbooks b2
WHERE b1.bookno = b2.bookno AND
	  cardinality(b2.citedbooks) >= 2 AND
      cardinality(b1.citingbooks) < 4;
      