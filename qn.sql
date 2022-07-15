/*20 question*/
use applewood;
Select * from movies
where moviename like '%o%';
/*19 question*/
select distinct m.moviename as ShowName,s.showtime 
from shows s 
inner join
movies m
on(s.movieseq=m.movieseq)
where s.isactive=1
order by s.showtime;
/*question 18*/
create table duplicateshows like shows;
describe duplicateshows;
select *
from duplicateshows;
/*question 17*/
/*delete from shows;*/
/*question 16*/
/*trigger*/
/*question 15*/
select sn.screename,sn.capacity,
      trim( concat(sn1.screename,'-',sn1.capacity)) as Backupscreen
from screens sn
inner join screens sn1
on(sn.backupscreen=sn1.screenseq);       
/*question 14*/
select  distinct m.moviename,/*sn.screenname,*/
m.movierating as averagerating,
    count(*) over (partition by m.moviename) as numberofshows
 from shows s
inner join movies m 
 on (m.movieseq=s.movieseq) and s.isactive = 1
order by averagerating asc,numberofshows DESC;
/*question 13*/
select avg (t.numberofshows)
from(select s.showdate ,
count(*) as numberofshows
from shows s 
where s.isactive=1
group by s.showdate) as t;
/*question 12*/
select s.showdate,m.moviename,
	   count(*)as Numberofshows
from movies m
inner join shows s on(m.movieseq=s.movieseq) and s.isactive = 1
group by s.showdate,m.moviename
order by Numberofshows;
use applewood;
/*question 11*/
select m.moviename,sn.screename,m.movierating as averagerating,
    count(*)  as numberofshows
 from shows s 
 inner join movies m 
 on (m.movieseq=s.movieseq) and m.isactive = 1
 inner join screens sn
 on (s.screenseq=sn.screenseq) and sn.isactive = 1
 where s.showdate = str_to_date('2022/03/07', '%Y/%m/%d') and s.isactive=1
 group by m.moviename

 limit 5;
/*question 10*//*query to find out any movie that does not hav any shows*/
select m.movieseq,m.moviename,m.movierating as Averagerating,
      case
       when m.isactive=0 then 'Inactive'
       else'active'
      end as moviestatus
      from movies m
      
      where m.movieseq not in (select s.movieseq from shows s );
select * from shows;
select * from movies;
/*question 9*/
select sn.screename,sn.capacity
from screens sn
inner join shows s
on (s.screenseq=sn.screenseq) AND sn.isactive=1
where s.showtime not between'11:00:00' and'15:00:00';
select m.moviename,count(*) as NumberofShows
from movies m
inner join
shows s 
on(m.movieseq=s.movieseq) and s.isactive=1
where s.showtime>'12:00:00'
group by m.moviename;
/*question 7*/









