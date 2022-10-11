# Pewlett-Hackard-Analysis

This project is assigned to to analysis and create a report that summarizes your analysis and helps prepare Bobby’s manager for the “silver tsunami” as many current employees reach retirement age.

## Software and Version:

- QuickDBD
- PostgressSQL version 11 and up.
- pdAdmin4 GUI


## ER diagram and Schema

ERD stands for entity relationship diagram.This visualize the relationship between entities people,things etc in a database.It also visualize the attributes of the entities.
ER diagrams can be at three levels of abstration.

1.Conceptual ERD

2.Logical ERD

3.Physical ERD

Take a look at the ER diagram for the database for the company.

![ERD][]


## What are we Creating

This new assignment consists of two technical analysis deliverables and a written report. We did analysis and divided the report into two deliverables.

### Deliverable 1: The Number of Retiring Employees by Title

* The retirement_titles.csv table is a list of employees born between 1952 and 1955 who are eligible for retirement.
* Second list contains current employees of company born between 1952 and 1955 with their most recent titles using DISTINCT ON function which is exclusive to Postgress.
* Last list is count of the retiring employees for each title sorted in ascending order.

From above analysis we can conclude that:

* Most number of employees retiring are Sr. Engineers with 25,916 employees  and Sr.Staff. with 24,926 employees.
* Total number of employees retiring are 72,458.






Deliverable 2: The Employees Eligible for the Mentorship Program
