# Amazon Vine Analysis
Module 16: Big Data (Challenge)

# Overview
To analyze Amazon reviews written by members of the paid Amazon Vine program; the Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products.

# Resources
* Data Source: Amazon review data set: `amazon_reviews_us_Electronics_v1_00.tsv.gz`
    
    __Note__: ***These 2 products were found more than once: B00EVCCULU, B000THX448 and have causes an error in the products_table insert; for some reason the drop_duplicates() or dropDuplicates() did not work***

    ![Duplicates](/duplicates.png)

* Development tools: 
  - Visual Code 1.62.3
  - Jupyter Notebook
  - PgAdmin (SQL)


# Deliverable #1
* The Amazon review was extracted as a DataFrame
![Amazon Review DataFrame](/MainDataFrame.png)


* The extracted DataFrame was transformed into 4 DataFrames with the correct columns according to the SQL table structure; all 4 DataFrames were loaded in their respective tables in PgAdmin.

    __Customers__

    ![Customers](/CustomersDF.png)

    __Products__

    ![Products](/ProductsDF.png)

    __Reviews__

    ![Reviews](/ReviewsDF.png)

    __Vine__

    ![Vine](/VineDF.png)


# Deliverable #2
The vine_table was exported as a `csv` file called `vine_table.csv` and then imported into a local database where all tables specified for each step were created for final analisys; review `Vine_Review_Analysis.sql` for details

# Deliverable #3

## Overview of the analysis
To determine if there is any bias towards reviews that were written as part of the Vine program.

## Results

![Results](/FinalReview.png)

## Summary
* 61% of reviews gave a 5 star rating
* Results indicates there is no significant difference between paid and unpaid 