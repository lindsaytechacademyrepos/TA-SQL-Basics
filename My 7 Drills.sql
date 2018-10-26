--Database and SQL Course Page 24
use db_zoo

SELECT tbl_species.species_name AS "Species Name:", tbl_nutrition.nutrition_type AS "Nutrition Type:"
FROM tbl_species
LEFT JOIN tbl_nutrition ON tbl_species.species_nutrition=tbl_nutrition.nutrition_id 

/*DRILL 1:
Compose a SELECT statement that queries for the following information
➤ All information from the habitat table.*/
SELECT * FROM tbl_habitat;

/*
DRILL 2:
Compose a SELECT statement that queries for the following information:
➤ Retrieve all names from the species_name column that have a species_order value of 3.*/
SELECT * FROM tbl_species WHERE species_order = 3;

/*DRILL 3:
Compose a SELECT statement that queries for the following information:
➤ Retrieve only the nutrition_type from the nutrition table that have a nutrition_cost of 600.00 or less.*/
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <=600;

/*DRILL 4:
Compose a SELECT statement that queries for the following information:
➤ Retrieve all species_names with the nutrition_id between 2202 and 2206 from the nutrition table.*/
SELECT species_name 
FROM tbl_species 
WHERE species_nutrition >2202 AND species_nutrition <2206;

/*DRILL 5:
Compose a SELECT statement that queries for the following information:
➤ Retrieve all names within the species_name column using the alias "Species Name:" 
from the species table and their corresponding nutrition_type under the alias "Nutrition Type:" 
from the nutrition table.*/
SELECT tbl_species.species_name AS 'Species Name: ',  tbl_nutrition.nutrition_type AS 'Nutrition Type: '
FROM tbl_species
INNER JOIN tbl_nutrition ON tbl_species.species_nutrition=tbl_nutrition.nutrition_id;

/*DRILL 6:
Compose a SELECT statement that queries for the following information:
➤ From the specialist table, retrieve the first and last name and contact 
number of those that provide care for the penguins from the species table.*/
SELECT a1.specialist_fname, a1.specialist_lname, a1.specialist_contact
FROM tbl_specialist a1
INNER JOIN tbl_care a2 ON a1.specialist_id=a2.care_specialist
INNER JOIN tbl_species a3 ON a2.care_id = a3.species_care
WHERE a3.species_name= 'penguin';

/*DRILL 7:
Creating your own tables: Build a select statement that queries for the following information:

➤ Create a database with two tables. Assign a foreign key constraint on one table that shares 
related data with the primary key on the second table. Finally, create a statement that queries 
data from both tables.

If you need advice...How about a table with a first and last name column and a second table 
that has a phone number and address column?

When submitting DRILL 7 be sure to include the table creation code along with your INSERT 
statements and query.*/
CREATE DATABASE db_pets;

USE db_pets;

CREATE TABLE tbl_petname (
	pet_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	pet_name VARCHAR (50),
	pet_age VARCHAR (50)
	);

CREATE TABLE tbl_faveperson (
	fave_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),	
	fave_person VARCHAR (50),
	pet_id INT FOREIGN KEY REFERENCES tbl_petname(pet_id)
	);

INSERT INTO tbl_petname (pet_name, pet_age)
	VALUES
	('Phoebe', 5),
	('Jack Jack', 5),
	('Charlie', 4),
	('Cayenne', 3),
	('Dino', 3),
	('Ziggy', 7);

INSERT INTO tbl_faveperson (fave_person, pet_id)
	VALUES
	('Ammon',1),
	('Lindsay',2),
	('Lindsay',3),
	('Ammon',4),
	('Literally Anyone',5),
	('Magen',6);

SELECT * FROM tbl_faveperson
INNER JOIN tbl_petname ON tbl_petname.pet_id = tbl_faveperson.pet_id
WHERE tbl_faveperson.fave_person = 'Lindsay'
;