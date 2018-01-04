
--Problem 1
--DROP TABLE sailors;

CREATE TABLE sailors(sid INTEGER NOT NULL,
                    sname VARCHAR(20),
                    rating INTEGER,
                    age INTEGER,
                    CONSTRAINT PK_sailors PRIMARY KEY(sid));


--DROP TABLE boat;

CREATE TABLE boat(bid INTEGER NOT NULL,
                  bname VARCHAR(15),
                  color VARCHAR(15),
                  CONSTRAINT PK_boat PRIMARY KEY(bid));


--DROP TABLE reserves;

CREATE TABLE reserves(sid INTEGER NOT NULL,
                     bid INTEGER NOT NULL,
                     day VARCHAR(10),
                     FOREIGN KEY(sid) REFERENCES sailors(sid),
                     FOREIGN KEY(bid) REFERENCES boat(bid));


--Insert Statements
INSERT INTO sailors(sid, sname, rating, age) VALUES (22, 'Dustin', 7, 45);
INSERT INTO sailors(sid, sname, rating, age) VALUES (29, 'Brutus', 1, 33);
INSERT INTO sailors(sid, sname, rating, age) VALUES (31, 'Lubber', 8, 55);
INSERT INTO sailors(sid, sname, rating, age) VALUES (32, 'Andy', 8, 25);
INSERT INTO sailors(sid, sname, rating, age) VALUES (58, 'Rusty', 10, 35);
INSERT INTO sailors(sid, sname, rating, age) VALUES (64, 'Horatio', 7, 35);
INSERT INTO sailors(sid, sname, rating, age) VALUES (71, 'Zorba', 10, 16);
INSERT INTO sailors(sid, sname, rating, age) VALUES (74, 'Horatio', 9, 35);
INSERT INTO sailors(sid, sname, rating, age) VALUES (85, 'Art', 3, 25);
INSERT INTO sailors(sid, sname, rating, age) VALUES (95, 'Bob', 3, 63);

INSERT INTO boat(bid, bname, color) VALUES (101, 'Interlake', 'blue');
INSERT INTO boat(bid, bname, color) VALUES (102, 'Interlake', 'red');
INSERT INTO boat(bid, bname, color) VALUES (103, 'Clipper', 'green');
INSERT INTO boat(bid, bname, color) VALUES (104, 'Marine', 'red');

INSERT INTO reserves(sid, bid, day) VALUES (22, 101, 'Monday');
INSERT INTO reserves(sid, bid, day) VALUES (22, 102, 'Tuesday');
INSERT INTO reserves(sid, bid, day) VALUES (22, 103, 'Wednesday');
INSERT INTO reserves(sid, bid, day) VALUES (31, 102, 'Thursday');
INSERT INTO reserves(sid, bid, day) VALUES (31, 103, 'Friday');
INSERT INTO reserves(sid, bid, day) VALUES (31, 104, 'Saturday');
INSERT INTO reserves(sid, bid, day) VALUES (64, 101, 'Sunday');
INSERT INTO reserves(sid, bid, day) VALUES (64, 102, 'Monday');
INSERT INTO reserves(sid, bid, day) VALUES (74, 103, 'Tuesday');

--Problem 2
INSERT INTO reserves(sid, bid, day) VALUES (41, 090, 'Monday');
INSERT INTO reserves(sid, bid, day) VALUES (32, 104, 'Sunday');
INSERT INTO boat(bid, bname, color) VALUES (1005, 'Rudy', 'red');
INSERT INTO boat(bid, bname, color) VALUES (104, 'Aqua', 'blue');
DELETE FROM sailors WHERE sid = 64;
DELETE FROM boat WHERE color = 'red';
DELETE FROM reserves WHERE day = 'sunday';

--Problem 3
--a
SELECT DISTINCT sid, rating FROM sailors;

--b
SELECT DISTINCT bname FROM boat b WHERE b.color = 'red';

--c
SELECT color FROM boat;

--d
SELECT DISTINCT s.sname FROM sailors s, reserves r, boat b WHERE s.sid = r.sid AND r.bid = b.bid AND b.color = 'red';

--e
SELECT DISTINCT b.bname FROM boat b, sailors s, reserves r WHERE s.sid = r.sid AND r.bid = b.bid AND s.age > 25;

--f
SELECT DISTINCT s.sname FROM boat b, sailors s, reserves r WHERE s.sid = r.sid AND r.bid = b.bid AND b.color <> 'red' OR b.color <> 'green';

--g
SELECT b1.bname, b2.bname FROM boat b1, sailors s, reserves r1, boat b2, reserves r2 WHERE s.sid = r1.sid AND r1.bid = b1.bid AND s.sid = r2.sid AND r2.bid = b2.bid AND (b1.color = 'blue' AND b2.color = 'green');

--h
SELECT b.bid FROM boat b WHERE b.bid NOT IN (SELECT r.bid FROM reserves r);

--i
SELECT b.bname FROM boat b, reserves r1, reserves r2 WHERE b.bid = r1.bid AND b.bid = r2.bid AND r1.sid <> r2.sid;

--j
SELECT sid FROM reserves GROUP BY sid HAVING COUNT(*) = 1;
