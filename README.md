# Ecommerce Sales Data Analysis with SQL

### Data Source: https://www.kaggle.com/datasets/carrie1/ecommerce-data

## Overview
This repository contains SQL queries and data analysis for an ecommerce sales dataset (sales_data). The dataset includes information about invoices, products, customers, and sales details. The analysis covers various aspects, such as total sales per country, average unit prices, customer behavior, and more.

## Changes Made
In this update, a column named invoice_date was dropped from the sales_data table to reflect changes in data requirements. Additionally, a NOT NULL constraint was added to the description column to ensure data integrity.

## Analysis Queries
### Total Sales Amount per Country:
Aggregated total sales amount for each country in the dataset.

### Average Unit Price per Product:
Calculated the average unit price for each product, ordering the results in descending order of average unit price.

### Number of Invoices per Customer:
Counted the number of distinct invoices for each customer, ordering the results in descending order.

### Total Quantity Sold per Month:
Aggregated the total quantity sold for each month.

### Top Selling Products:
Identified the top 10 selling products based on the total quantity sold.

### Total Sales per Customer and Country:
Calculated the total sales for each customer in each country, ordering the results in descending order.

### Customer Country With Highest Average Spending:
Identified the country with the highest average spending per customer.

### Sales of Each Product:
Counted the number of sales for each product, ordering the results in descending order.

### Constraints
A NOT NULL constraint was added to the description column to ensure that each record has a valid description.
Usage

Feel free to explore and use these SQL queries for your own analysis or adapt them to fit your specific dataset. The code provides insights into sales patterns, customer behavior, and product performance.
