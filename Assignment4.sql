--Derrick Baines
--October 6, 2017
--Assignment 4

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

-- Data for Assignment 4 
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

--Find the bookno of each book that is cited by at least one book that cost cost less than $50

SELECT DISTINCT c.citedbookno
FROM book b, cites c, cites c1
WHERE b.bookno = c.bookno AND c1.bookno = c.bookno AND b.price < 50;

WITH
E1 AS (SELECT DISTINCT citedbookno, price FROM cites join book on cites.bookno = book.bookno),
E2 AS (SELECT citedbookno, price FROM E1 Where price < 50),
E3 AS (SELECT DISTINCT citedbookno FROM cites join book on cites.bookno = book.bookno)
(SELECT citedbookno FROM E2) INTERSECT (SELECT citedbookno FROM E3);

--Find the bookno and title of each book that was bought by a student who majors in CS and in Math.

(SELECT b.bookno, b.title, m.sid
FROM book b JOIN buys b1 ON b.bookno = b1.bookno join major m ON m.sid = b1.sid WHERE m.major = 'Math')
INTERSECT
(SELECT b.bookno, b.title, m.sid
FROM book b JOIN buys b1 ON b.bookno = b1.bookno join major m ON m.sid = b1.sid WHERE m.major = 'CS')

WITH
E1 AS (SELECT b1.bookno, b.title, m.sid
FROM book b JOIN buys b1 ON b.bookno = b1.bookno join major m ON m.sid = b1.sid
WHERE m.major = 'Math'),
E2 AS (SELECT b1.bookno, b.title, m.sid
FROM book b JOIN buys b1 ON b.bookno = b1.bookno join major m ON m.sid = b1.sid
WHERE m.major = 'CS')
(SELECT DISTINCT bookno, title, sid from e2) INTERSECT (SELECT DISTINCT bookno, title, sid from e1)