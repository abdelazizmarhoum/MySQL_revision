# MySQL Learning Repository

This repository contains various MySQL scripts and examples for learning SQL fundamentals. The files are organized by topic to help understand different aspects of MySQL database management.

## Table of Contents

1. [Revision Files](#revision-files)
2. [Class Examples](#class-examples)
3. [SQL Operations](#sql-operations)
   - [SELECT Statements](#select-statements)
   - [INSERT Statements](#insert-statements)
   - [UPDATE and DELETE Statements](#update-and-delete-statements)
   - [Date Functions](#date-functions)
   - [Numeric Functions](#numeric-functions)

## Revision Files

- [revision.txt](revision.txt) - Comprehensive notes on MySQL concepts
- [revision.sql](revision.sql) - SQL commands extracted from revision.txt

## Class Examples

These files contain practical examples from classroom sessions:

- [class/employee.sql](class/employee.sql) - Employee table examples with date calculations and aggregations
- [class/estem.sql](class/estem.sql) - Product table operations including table creation, modification, and data manipulation
- [class/etudiant.sql](class/etudiant.sql) - Student table examples with email generation and date functions

## SQL Operations

### SELECT Statements

Folder: [select/](select/)

- [select.txt](select/select.txt) - Theory and explanations about SELECT operations
- [select.sql](select/select.sql) - Practical SELECT examples including:
  - Basic SELECT queries
  - Filtering with WHERE clause
  - Sorting with ORDER BY
  - String functions (CONCAT, UPPER, LOWER, SUBSTRING)
  - Handling NULL values with IFNULL

### INSERT Statements

Folder: [insert/](insert/)

- [insert.txt](insert/insert.txt) - Theory about INSERT operations
- [insert.sql](insert/insert.sql) - INSERT examples including:
  - Single row inserts
  - Multiple row inserts
  - Partial inserts

### UPDATE and DELETE Statements

Folder: [update delete/](update%20delete/)

- [update.txt](update%20delete/update.txt) - Theory about UPDATE and DELETE operations
- [update.sql](update%20delete/update.sql) - UPDATE and DELETE examples including:
  - Updating single and multiple columns
  - Conditional updates
  - Row deletions

### Date Functions

Folder: [date/](date/)

- [date.txt](date/date.txt) - Theory about date/time functions
- [date.sql](date/date.sql) - Date/time function examples including:
  - Current date/time functions (NOW, CURDATE, CURTIME)
  - Date extraction (YEAR, MONTH, DAY)
  - Date arithmetic (DATE_ADD, DATE_SUB)
  - Date differences (DATEDIFF, TIMESTAMPDIFF)

### Numeric Functions

Folder: [numériques/](num%C3%A9riques/)

- [numériques.txt](num%C3%A9riques/num%C3%A9riques.txt) - Theory about numeric functions
- [numériques.sql](num%C3%A9riques/num%C3%A9riques.sql) - Numeric function examples including:
  - MIN/MAX functions
  - AVG for averages
  - SUM for totals
  - COUNT for row counting

## Usage

To use these files:

1. Load them into your MySQL environment using:
   ```sql
   SOURCE filename.sql;
   ```

2. Or copy and paste the commands directly into your MySQL client.

Each `.sql` file contains executable SQL commands that demonstrate specific MySQL functionalities.