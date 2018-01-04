
--Question 1

drop table TC;
create table TC(source integer, target integer);
insert into TC values(1,2),(1,3),(2,1),(2,3)(3,4),(3,5),(4,3),(4,5),(5,3),(5,4);

drop function new_TC_pairs();

create or replace function new_TC_pairs()
returns table (source integer, target integer) AS
$$
	(select TC.source, Temp.target
     from   TC, Temp
     where TC.target = Temp.source)
     except
     (select  source, target
      from    TC);
$$ LANGUAGE SQL;

drop function Transitive_Closure();

create or replace function Transitive_Closure()
returns void as $$
begin
	drop table if exists TC;
    create table TC(source integer, target integer);
    
    insert into TC select * from temp;
    
    while exists(select * from new_TC_pairs())
    loop
    	insert into TC select * from new_TC_pairs();
    end loop;
end;
$$ language plpgsql;



create or replace function exists_temp(a integer, b integer, c integer)
returns void as $$
begin
	drop table if exists Temp;
    create table Temp(source integer, target integer);
    
    insert into Temp (select g.source, g.target
                      from TC g
                      where g.source <> c AND g.target <> c);
                      
    perform Transitive_Closure();
    
end;
$$ language plpgsql;


create or replace function articulation_point()
returns result as $$
begin
	select in (select *
               from TC g, TC g2
               where g.source <> g2.source AND
               exists_temp(source, target, source))
end;
$$ language plpgsql;




--Question 2 Parent Child Generations
	drop table PC;
drop table SG;

create table PC(PId integer, CId integer);
create table SG(ID1 integer, ID2 integer);

insert into PC values (1,2), (1,3), (2,4), (2,5),(3,6),(3,7),(4,8),(4,9);

create or replace function new_pairs()
returns table (ID1 integer, ID2 integer) AS
$$
  (select pc1.cid, pc2.cid
   from   PC pc1, PC pc2, SG sg
   where  pc1.pid = sg.id1 and pc2.pid = sg.id2)
   except
  (select *
   from SG);
$$ LANGUAGE SQL;


create or replace function Same_Generation()
  returns void as $$
begin
   drop table if exists SG;
   create table SG(ID1 integer, ID2 integer);

   insert into SG select distinct pc1.PId as ID1, pc1.PId as ID2 from PC pc1
        where not exists (select 1 from pc pc2 where pc2.cid = pc1.pid);

   while exists(select * from new_pairs())
   loop
     insert into SG select * from new_pairs();
   end loop;
end; $$ language plpgsql;
	
	select * from SG;
	select Generations();
	Select * from SG order by 1,2;
	

--Quesiton 3
CREATE OR REPLACE FUNCTION powerset(a anyarray)
RETURNS SETOF anyarray AS $$
DECLARE
    retval  a%TYPE;
    alower  integer := array_lower(a, 1);
    aupper  integer := array_upper(a, 1);
    j       integer;
    k       integer;
BEGIN
    FOR i IN 0 .. (1 << (aupper - alower + 1)) - 1 LOOP
        retval := '{}';
        j := alower;
        k := i;

        WHILE k > 0 LOOP
            IF k & 1 = 1 THEN
                retval := array_append(retval, a[j]);
            END IF;

            j := j + 1;
            k := k >> 1;
        END LOOP;

        RETURN NEXT retval;
    END LOOP;

    RETURN;
END;
$$ LANGUAGE plpgsql IMMUTABLE STRICT;


--Question 5
CREATE TABLE Graph(Source Integer, Target Integer);

Insert Into Graph Values (1,1), (1,2), (1,3), (2,3), (3,1), (3,2);

CREATE TABLE HubAuthorityScores(node Integer, hubScore float, authScore float);

CREATE TABLE PreviousNormalizedScores(node Integer, hubScore float, authScore float);

create or replace function UpdateAuthorityScore()
returns Void AS $$
	declare b RECORD;
    hubSum FLOAT;
begin
	FOR b IN select * from HubAuthorityScores
		LOOP
			hubSum := sum(h.hubScore) from graph g, HubAuthorityScores h where g.source = h.node and g.target = b.node;
			update HubAuthorityScores SET authScore = hubSum where node = b.node;
		END LOOP;           
end;
$$ language plpgsql;

create or replace function UpdateHubScore()
returns Void AS $$
	declare b RECORD;
	authSum FLOAT;
begin
	FOR b IN select * from HubAuthorityScores
		LOOP
			authSum := sum(h.authScore) from graph g, HubAuthorityScores h where g.target = h.node and g.source = b.node;
			update HubAuthorityScores SET hubScore = authSum where node = b.node;
		END LOOP;           
end;
$$ language plpgsql;


create or replace function Normalize()
returns Void AS $$
	declare hubSumSquare FLOAT;
	authSumSquare FLOAT;
	tempHubSumSquare FLOAT;
	tempAuthSumSquare FLOAT;
	hubDivider FLOAT;
	authDivider FLOAT;
	b RECORD;
begin
	hubSumSquare := 0;
	authSumSquare := 0;
	FOR b IN select * from HubAuthorityScores
		LOOP
			tempHubSumSquare := pow(hubscore, 2) from HubAuthorityScores  where node = b.node;
			tempAuthSumSquare := pow(authscore, 2) from HubAuthorityScores  where node = b.node;
			hubSumSquare := hubSumSquare + tempHubSumSquare;
			authSumSquare := authSumSquare + tempAuthSumSquare;
		END LOOP;

	hubDivider := sqrt(hubSumSquare);
	authDivider := sqrt(authSumSquare);

	FOR b IN select * from HubAuthorityScores
		LOOP
			update HubAuthorityScores set hubscore = hubscore/hubDivider, authscore = authscore/authDivider where node = b.node;
		END LOOP;

end;
$$ language plpgsql;

create or replace function Check_Stop()
returns Boolean AS $$
	declare b RECORD;
	prevHub FLOAT;
	prevAuth FLOAT;
	currHub FLOAT;
	currAuth FLOAT;
begin
	FOR b IN select * from HubAuthorityScores
		LOOP
			prevHub := hubscore FROM PreviousNormalizedScores where node = b.node;
			prevAuth := authscore FROM PreviousNormalizedScores where node = b.node;
			currHub := hubscore FROM HubAuthorityScores where node = b.node;
			currAuth := authscore FROM HubAuthorityScores where node = b.node;
	IF (abs(prevHub - currHub) > .0000001 OR abs(prevAuth - currAuth) > .0000001)
		THEN return 'f';
	END IF;
END LOOP;           
	return 't';
end;
$$ language plpgsql;


create or replace function HITS(first_run integer)
returns Void AS $$
	declare b RECORD;
begin
	if (HITS.first_run = 0)
		THEN
	drop table if exists HubAuthorityScores;
	CREATE TABLE HubAuthorityScores (node Integer, hubScore float, authScore float);
    
	drop table if exists PreviousNormalizedScores;
	CREATE TABLE PreviousNormalizedScores (node Integer, hubScore float, authScore float);
    
	FOR b IN (select g1.source from graph g1) union (select g2.target from graph g2)
		LOOP
			insert into HubAuthorityScores values (b.source, 1, 1);
			insert into PreviousNormalizedScores values (b.source, 0, 0);
		END LOOP;
        
	PERFORM HITS(1);
    
	ELSE
	drop table if exists PreviousNormalizedScores;
	CREATE TABLE PreviousNormalizedScores (node Integer, hubScore float, authScore float);
	INSERT INTO PreviousNormalizedScores SELECT * FROM HubAuthorityScores;
    
	PERFORM UpdateAuthorityScore();
	PERFORM UpdateHubScore();
	PERFORM Normalize();
    
	if (Check_Stop() = 'f')
		THEN PERFORM HITS(1);
	end if;
	end if;
end;
$$ language plpgsql;

SELECT HITS(0);
SELECT * FROM HubAuthorityScores;

--Question 6
CREATE TABLE WeightedGraph(Source Integer, Target Integer, Weight Integer);
 
INSERT INTO WeightedGraph
VALUES (1,2,5),(2,1,5),(1,3,3),(3,1,3),(2,3,2),(3,2,2),(2,5,2),(5,2,2),(3,5,4),(5,3,4),(2,4,8),(4,2,8);
 
CREATE TABLE VisitedNodes (Source Integer, Target Integer);
 
create or replace function Cycle_YN(source integer, target integer)
returns boolean AS $$
begin
	IF (select exists (select * from VisitedNodes vn where vn.source = Cycle_YN.source) = 't') 
    	AND (select exists (select * from VisitedNodes vn where vn.target = Cycle_YN.target) = 't') 
    THEN RETURN 't';
end if;
       return 'f';
end;
$$ language plpgsql;
 
create or replace function SpanningTree()
returns table (source integer, target integer) AS $$
      declare i      RECORD;
      begin
      	drop table if exists VisitedNodes;
        create table VisitedNodes (Source Integer, Target Integer);
        
        for i IN select * from WeightedGraph order by weight
        loop
        	IF (select not exists (select * from VisitedNodes vn where vn.source = i.source and vn.target = i.target) = 't') 
        		AND (select Cycle_YN(i.source, i.target) = 'f')
        		THEN INSERT INTO VisitedNodes select i.source, i.target;
        
        		INSERT INTO VisitedNodes select i.target, i.source;
    		end if;
        end loop;
        
        return query select * from VisitedNodes;
end;
$$ language plpgsql;
 
SELECT * FROM SpanningTree();
 
DROP TABLE WeightedGraph;
DROP TABLE VisitedNodes;
DROP FUNCTION Cycle_YN(source integer, target integer);
DROP FUNCTION SpanningTree();
