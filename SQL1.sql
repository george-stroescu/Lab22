/*
SELECT * FROM Person
WHERE FirstName LIKE 'Z%'
GO

SELECT CountyName, COUNT(City.CountyId) AS NumberOfCities FROM County
INNER JOIN City ON County.CountyId = City.CountyId
GROUP BY County.CountyName
GO

SELECT CompanyName, Address.* FROM Company
INNER JOIN Address ON Company.MainAddressId = Address.AddressId
GO

Select Person.* FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
GO

INSERT INTO DepartmentNames(DepartmentName)
VALUES ('R&D')

SELECT DepartmentNames.DepartmentName FROM DepartmentNames
EXCEPT (SELECT Department.DepartmentName FROM Department
		WHERE Department.CompanyId > 0)
GO

SELECT Person.LastName, Person.FirstName, Person.DateOfBirth, 1 AS IsEmployed FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
UNION
SELECT Person.LastName, Person.FirstName, Person.DateOfBirth, 0 AS IsEmployed FROM Person
LEFT JOIN Employee ON Person.PersonId = Employee.EmployeeId
WHERE Employee.EmployeeId IS NULL
GO

SELECT Person.* FROM Employee
RIGHT JOIN Person ON Employee.EmployeeId = Person.PersonId
WHERE Employee.EmployeeId IS NULL
GO
*/
SELECT City.*, Address.*  FROM City
RIGHT JOIN Address ON City.CityId = Address.CityId
FULL OUTER JOIN Company ON Address.AddressId = Company.MainAddressId
WHERE Address.AddressId IS NULL OR Company.MainAddressId IS NULL
