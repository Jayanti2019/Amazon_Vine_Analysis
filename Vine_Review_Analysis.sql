-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

select * from vine_table

select * from Vine_Table where total_votes>=20 order by total_votes


--Total votes greater than 20
create table Vine_20Votes as select * from Vine_Table where total_votes>=20 order by total_votes

select * from Vine_20Votes

-- Records with total votes >0. Need this for calculation later
create table Vine_helpfulVotes as select * from Vine_Table WHERE total_votes > 0

-- helpful_votes more than 50%
select * from Vine_helpfulVotes WHERE CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5

-- Review written
create table Vine_Review as select * from Vine_Table WHERE vine = 'Y'

-- Review not written
create table Vine_NoReview as select * from Vine_Table WHERE vine = 'N'

-- total number of reviews
select count(*) as total_reviews from Vine_Table

-- total number of 5 star rating reviews
select count(*) as star_reviews from vine_table where star_rating =5

-- total number of paid 5 start rating reviews
select count(*) as paid_reviews from vine_table where star_rating = 5 and vine='Y'

-- total number of nopaid 5 start rating reviews
select count(*) as Nopaid_reviews from vine_table where star_rating = 5 and vine='N'

-- percentage of paid 5 start rating reviews
select star_rating, count(*) * 100.0 / (select count(*) from vine_table)
from Vine_Table
WHERE vine= 'Y'
group by star_rating;

-- percentage of no paid 5 start rating reviews
select star_rating, count(*) * 100.0 / (select count(*) from vine_table)
from Vine_Table
WHERE vine= 'N'
group by star_rating;
