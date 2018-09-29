--Database and SQL Course Page 24
use db_zoo

--Drill 1
SELECT * FROM tbl_habitat;

--Drill 2 
SELECT * FROM tbl_species WHERE species_order = 3;

--Drill 3
SELECT nutrition_type FROM tbl_nutrition WHERE nutrition_cost <=600;

--Drill 4
SELECT species_name FROM tbl_species WHERE species_nutrition >2202 AND species_nutrition <2206;

--Drill 5
SELECT tbl_species.species_name AS 'Species Name: ',  tbl_nutrition.nutrition_type AS 'Nutrition Type: '
FROM tbl_species
INNER JOIN tbl_nutrition ON tbl_species.species_nutrition=tbl_nutrition.nutrition_id;

--Drill 6
SELECT a1.specialist_fname, a1.specialist_lname, a1.specialist_contact
FROM tbl_specialist a1
INNER JOIN tbl_care a2 ON a1.specialist_id=a2.care_specialist
INNER JOIN tbl_species a3 ON a2.care_id = a3.species_care
WHERE a3.species_name= 'penguin';

--Drill 7
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