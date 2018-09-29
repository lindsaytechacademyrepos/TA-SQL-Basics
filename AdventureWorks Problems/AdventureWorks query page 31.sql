USE AdventureWorks2014;

--First test procedure
CREATE PROCEDURE dbo.getcontactinfo @entityID VARCHAR (30)
AS
SELECT a1.BusinessEntityID, a1.FirstName, a1.LastName, a2.PhoneNumber, a3.EmailAddress
FROM Person.Person a1
	INNER JOIN Person.PersonPhone a2 ON a2.BusinessEntityID=a1.BusinessEntityID
	INNER JOIN Person.EmailAddress a3 ON a1.BusinessEntityID = a3.BusinessEntityID
WHERE a1.BusinessEntityID = @entityID;

--second test procedure
CREATE PROCEDURE dbo.getcontactinfo2 @entityID VARCHAR (30) = NULL, @lastName VARCHAR (30) = NULL
AS
SELECT a1.BusinessEntityID, a1.FirstName, a1.LastName, a2.PhoneNumber, a3.EmailAddress
FROM Person.Person a1
	INNER JOIN Person.PersonPhone a2 ON a2.BusinessEntityID=a1.BusinessEntityID
	INNER JOIN Person.EmailAddress a3 ON a1.BusinessEntityID = a3.BusinessEntityID
WHERE a1.BusinessEntityID = @entityID
AND a1.LastName LIKE @lastName;

--third test procedure to allow null values for one input
CREATE PROCEDURE dbo.getcontactinfo4 @entityID VARCHAR (30) = NULL
AS
SELECT a1.BusinessEntityID, a1.FirstName, a1.LastName, a2.PhoneNumber, a3.EmailAddress
FROM Person.Person a1
	INNER JOIN Person.PersonPhone a2 ON a2.BusinessEntityID=a1.BusinessEntityID
	INNER JOIN Person.EmailAddress a3 ON a1.BusinessEntityID = a3.BusinessEntityID
WHERE a1.BusinessEntityID = ISNULL(@entityID,a1.BusinessEntityID);

EXEC dbo.getcontactinfo4

--fourth test procedure to allow null values for multiple inputs
CREATE PROCEDURE dbo.getcontactinfo5 @entityID VARCHAR (30) = NULL, @lastName VARCHAR (30) = NULL
AS
SELECT a1.BusinessEntityID, a1.FirstName, a1.LastName, a2.PhoneNumber, a3.EmailAddress
FROM Person.Person a1
	INNER JOIN Person.PersonPhone a2 ON a2.BusinessEntityID=a1.BusinessEntityID
	INNER JOIN Person.EmailAddress a3 ON a1.BusinessEntityID = a3.BusinessEntityID
WHERE a1.BusinessEntityID = ISNULL(@entityID,a1.BusinessEntityID)
AND a1.LastName LIKE '%' + ISNULL(@lastName, a1.LastName);

EXEC dbo.getcontactinfo5 @entityID = 293

--Final Version
CREATE PROCEDURE dbo.getcontactinfofinal @entityID VARCHAR (30) = NULL, @lastName VARCHAR (30) = NULL
AS
SELECT a1.BusinessEntityID, a1.FirstName, a1.LastName, a2.PhoneNumber, a3.EmailAddress
FROM Person.Person a1
	INNER JOIN Person.PersonPhone a2 ON a2.BusinessEntityID=a1.BusinessEntityID
	INNER JOIN Person.EmailAddress a3 ON a1.BusinessEntityID = a3.BusinessEntityID
WHERE a1.BusinessEntityID = ISNULL(@entityID,a1.BusinessEntityID)
AND a1.LastName LIKE '%' + ISNULL(@lastName, a1.LastName);