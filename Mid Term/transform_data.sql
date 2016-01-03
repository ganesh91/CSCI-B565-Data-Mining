/* Select tables Created through ETL */
select * from DC;
select * from CIDM;
select * from MIDG;

/* Drop tables if they exist */
 drop table if exists cust_film;
 drop table if exists movie_genere;
 drop table if exists cluster_genere;
 drop table if exists cust_movie;

/* Convert tables from wide to long form */
/* Join Genere and Film Tables */
create table movie_genere as select ab.Mv_ID,ab.Genere from(
select MIDG.Mv_ID,DC.Genere from DC inner join MIDG on DC.Code=MIDG.G1
UNION all
select MIDG.Mv_ID,DC.Genere from DC inner join MIDG on DC.Code=MIDG.G2
UNION all
select MIDG.Mv_ID,DC.Genere from DC inner join MIDG on DC.Code=MIDG.G3
UNION all
select MIDG.Mv_ID,DC.Genere from DC inner join MIDG on DC.Code=MIDG.G4) as ab 
order by MV_ID;

select * from movie_genere;

/* Convert tables from wide to long form */
/* Join Genere and Film Tables and Customer table */
create table cust_film as select cust_id,movie_id,Genere 'genere' from(
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from 
cidm inner join movie_genere where cidm.C2=movie_genere.Mv_ID
UNION all
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from 
cidm inner join movie_genere where cidm.C3=movie_genere.Mv_ID
UNION all
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from 
cidm inner join movie_genere where cidm.C4=movie_genere.Mv_ID
UNION all
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from 
cidm inner join movie_genere where cidm.C5=movie_genere.Mv_ID
UNION all
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from 
cidm inner join movie_genere where cidm.C6=movie_genere.Mv_ID
UNION all
select cidm.C1 'cust_id',movie_genere.Mv_ID 'movie_id',movie_genere.Genere from
 cidm inner join movie_genere where cidm.C7=movie_genere.Mv_ID)as temp 
order by cust_id,movie_id;

select * from cust_film;

/* Convert tables from long to wide form */
/* has customer ID as rows and Genere as Columns*/
create table cluster_genere as select 	cust_id,
sum(case when genere='Romance' then 1 else 0 end) 'Romance',
sum(case when genere='Science  Fiction' then 1 else 0 end) 'SciFi',
sum(case when genere='Horror' then 1 else 0 end) 'Horror',
sum(case when genere='Comedy' then 1 else 0 end) 'Comedy',
sum(case when genere='Drama' then 1 else 0 end) 'Drama',
sum(case when genere='Action' then 1 else 0 end) 'Action',
sum(case when genere='Documentary' then 1 else 0 end) 'Documentary',
sum(case when genere='Classic' then 1 else 0 end) 'Classic'
 from cust_film group by cust_id order by cust_id; 
 
select * from cluster_genere;


create table cust_movie as select C1 'cust_id',movie 'movie_id' from(
select C1,C2 'movie' from CIDM
UNION ALL
select C1,C3 'movie' from CIDM
UNION ALL
select C1,C4'movie' from CIDM
UNION ALL
select C1,C5 'movie' from CIDM
UNION ALL
select C1,C6 'movie' from CIDM
UNION ALL
select C1,C7 'movie' from CIDM) as temp2 where movie not in ('NA',' NA','NA ') order by cust_id;
 
 select * from cust_movie;
 
 /* Convert tables from long to wide form */
/* has customer ID as rows and Film as Columns*/

 create table cluster_movie as select cust_id,
 sum(case when movie_id=1 then 1 else 0 end) 'M1',
 sum(case when movie_id=2 then 1 else 0 end) 'M2',
 sum(case when movie_id=3 then 1 else 0 end) 'M3',
 sum(case when movie_id=4 then 1 else 0 end) 'M4',
 sum(case when movie_id=5 then 1 else 0 end) 'M5',
 sum(case when movie_id=6 then 1 else 0 end) 'M6',
 sum(case when movie_id=7 then 1 else 0 end) 'M7',
 sum(case when movie_id=8 then 1 else 0 end) 'M8',
 sum(case when movie_id=8 then 1 else 0 end) 'M9',
 sum(case when movie_id=10 then 1 else 0 end) 'M10'
 from cust_movie group by cust_id order by cust_id;
 select * from cluster_movie;
 
 select * from cluster_genere where Romance=2 and Documentary=1;
 
 select genere,count(genere) 'Views' from cust_film group by genere order by Views desc;
 select movie_id,count(movie_id) 'Views' from cust_film group by movie_id order by Views desc;
 
 select movie_id,genere from cust_film;
 
select 	mv_id,sum(case when genere='Romance' then 1 else 0 end) 'Romance',
sum(case when genere='Science  Fiction' then 1 else 0 end) 'SciFi',
sum(case when genere='Horror' then 1 else 0 end) 'Horror',
sum(case when genere='Comedy' then 1 else 0 end) 'Comedy',
sum(case when genere='Drama' then 1 else 0 end) 'Drama',
sum(case when genere='Action' then 1 else 0 end) 'Action',
sum(case when genere='Documentary' then 1 else 0 end) 'Documentary',
sum(case when genere='Classic' then 1 else 0 end) 'Classic'
 from movie_genere group by mv_id order by mv_id;
select movie_id 'mv_id',count(movie_id) 'count' from cust_movie group by movie_id order by mv_id;
 