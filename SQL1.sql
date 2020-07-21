/*
--1
SELECT * FROM Person
WHERE FirstName LIKE 'Z%'
GO

--2
SELECT CountyName, COUNT(City.CountyId) AS NumberOfCities FROM County
INNER JOIN City ON County.CountyId = City.CountyId
GROUP BY County.CountyName
GO

--3
SELECT CompanyName, Address.* FROM Company
INNER JOIN Address ON Company.MainAddressId = Address.AddressId
GO

--4
Select Person.* FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
GO

--5
INSERT INTO DepartmentNames(DepartmentName)
VALUES ('R&D')

SELECT DepartmentNames.DepartmentName FROM DepartmentNames
EXCEPT (SELECT Department.DepartmentName FROM Department
		WHERE Department.CompanyId > 0)
GO

--6
SELECT Person.LastName, Person.FirstName, Person.DateOfBirth, 1 AS IsEmployed FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
UNION
SELECT Person.LastName, Person.FirstName, Person.DateOfBirth, 0 AS IsEmployed FROM Person
LEFT JOIN Employee ON Person.PersonId = Employee.EmployeeId
WHERE Employee.EmployeeId IS NULL
GO

--7
SELECT Person.* FROM Employee
RIGHT JOIN Person ON Employee.EmployeeId = Person.PersonId
WHERE Employee.EmployeeId IS NULL
GO

--8
SELECT City.*, Address.*  FROM City
RIGHT JOIN Address ON City.CityId = Address.CityId
FULL OUTER JOIN Company ON Address.AddressId = Company.MainAddressId
WHERE Address.AddressId IS NULL OR Company.MainAddressId IS NULL
GO

--9 - Not Working
INSERT INTO Company
VALUES ('Nvidia', 1)

SELECT Company.*, Department.* FROM Company
INNER JOIN Department ON Company.CompanyId = Department.CompanyId
UNION
SELECT Company.*, COALESCE(Department.CompanyId, 'N/A'), COALESCE(Department.DepartmentId, 'N/A'), COALESCE(Department.DepartmentName, 'N/A')
FROM Company
FULL OUTER JOIN Department ON Company.CompanyId = Department.CompanyId
GO

--10
CREATE VIEW Employees AS
SELECT Person.LastName, Person.FirstName, Person.DateOfBirth, Company.CompanyId, Company.CompanyName, Department.DepartmentId, Department.DepartmentName, Employee.BadgeCode
FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
INNER JOIN Company ON Employee.CompanyId = Company.CompanyId
INNER JOIN EmployeeCompanyDepartment ON Employee.EmployeeId = EmployeeCompanyDepartment.EmployeeId
INNER JOIN Department ON EmployeeCompanyDepartment.CompanyDepartmentId = Department.DepartmentId
GO

--11
CREATE PROCEDURE CompanyEmployees @Company NVARCHAR(200)
AS
SELECT Person.LastName, Person.FirstName, Department.DepartmentName, Employee.BadgeCode 
FROM Person
INNER JOIN Employee ON Person.PersonId = Employee.EmployeeId
INNER JOIN Company ON Employee.CompanyId = Company.CompanyId
INNER JOIN EmployeeCompanyDepartment ON Employee.EmployeeId = EmployeeCompanyDepartment.EmployeeId
INNER JOIN Department ON EmployeeCompanyDepartment.CompanyDepartmentId = Department.DepartmentId
WHERE Company.CompanyName = @Company

EXEC CompanyEmployees @Company = 'Microsoft'
GO
*/