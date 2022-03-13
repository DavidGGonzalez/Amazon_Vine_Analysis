-- To Re-create the Vine table on this new local database
-- vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Create a table Step1Table
-- total_votes count is equal to or greater than 20
CREATE TABLE Step1Table AS
SELECT
    review_id
	,star_rating
	,helpful_votes
	,total_votes
	,vine
	,verified_purchase
FROM
    vine_table
WHERE
    total_votes >= 20;
	
-- Create a table Step2Table
-- retrieve all the rows where the number of helpful_votes divided by total_votes is equal to or greater than 50%
CREATE TABLE Step2Table AS
SELECT
    review_id
	,star_rating
	,helpful_votes
	,total_votes
	,vine
	,verified_purchase
FROM
    Step1Table
WHERE
    CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >= 0.5;

-- Create a table Step3Table	
-- retrieves all the rows where a review was written as part of the Vine program (paid), vine == 'Y'
CREATE TABLE Step3Table AS
SELECT
    review_id
	,star_rating
	,helpful_votes
	,total_votes
	,vine
	,verified_purchase
FROM
    Step2Table
WHERE
    vine='Y';

-- Create a table Step3Table	
-- retrieve all the rows where the review was not part of the Vine program (unpaid), vine == 'N'
CREATE TABLE Step4Table AS
SELECT
    review_id
	,star_rating
	,helpful_votes
	,total_votes
	,vine
	,verified_purchase
FROM
    Step2Table
WHERE
    vine='N';
	
-- Evaluation
-- See All reviews
select * from vine_table

-- Count all reviews = 1048575
select count(review_id) from vine_table

-- Count all 5 star reviews = 644709
select count(review_id) from vine_table where star_rating = 5

-- Count all reviews with 20 or more votes = 6546
select count(review_id) from step1table

-- Count all paid reviews = 115
select count(review_id) from step3table
-- Count all paid 5 star reviews = 50
select count(review_id) from step3table where star_rating = 5

-- Count all unpaid reviews = 5588
select count(review_id) from step4table
-- Count all unpaid 5 star reviews = 2853
select count(review_id) from step4table where star_rating = 5