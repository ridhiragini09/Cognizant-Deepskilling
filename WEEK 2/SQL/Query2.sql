-- Use or create your database
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'AdvancedSQL')
BEGIN
    CREATE DATABASE AdvancedSQL;
END;
GO
USE AdvancedSQL;
GO

-- Drop tables if they already exist (to avoid errors on re-run)
IF OBJECT_ID('Employees', 'U') IS NOT NULL DROP TABLE Employees;
IF OBJECT_ID('Departments', 'U') IS NOT NULL DROP TABLE Departments;
GO

-- Create Departments table
CREATE TABLE Departments (
 DepartmentID INT PRIMARY KEY,
 DepartmentName VARCHAR(100)
);

-- Create Employees table with auto-increment EmployeeID
CREATE TABLE Employees (
 EmployeeID INT PRIMARY KEY IDENTITY(1,1),
 FirstName VARCHAR(50),
 LastName VARCHAR(50),
 DepartmentID INT FOREIGN KEY REFERENCES Departments(DepartmentID),
 Salary DECIMAL(10,2),
 JoinDate DATE
);

-- Insert data into Departments
INSERT INTO Departments (DepartmentID, DepartmentName) VALUES
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Marketing');

-- Insert sample employees
INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate) VALUES
('John', 'Doe', 1, 5000.00, '2020-01-15'),
('Jane', 'Smith', 2, 6000.00, '2019-03-22'),
('Michael', 'Johnson', 3, 7000.00, '2018-07-30'),
('Emily', 'Davis', 4, 5500.00, '2021-11-05');

-- Drop procedures if they already exist
IF OBJECT_ID('sp_InsertEmployee', 'P') IS NOT NULL DROP PROCEDURE sp_InsertEmployee;
IF OBJECT_ID('sp_GetEmployeesByDepartment', 'P') IS NOT NULL DROP PROCEDURE sp_GetEmployeesByDepartment;
GO

-- Procedure to insert employee
CREATE PROCEDURE sp_InsertEmployee
 @FirstName VARCHAR(50),
 @LastName VARCHAR(50),
 @DepartmentID INT,
 @Salary DECIMAL(10,2),
 @JoinDate DATE
AS
BEGIN
 INSERT INTO Employees (FirstName, LastName, DepartmentID, Salary, JoinDate)
 VALUES (@FirstName, @LastName, @DepartmentID, @Salary, @JoinDate);
END;
GO

-- Procedure to get employees by department
CREATE PROCEDURE sp_GetEmployeesByDepartment
 @DeptID INT
AS
BEGIN
 SELECT * FROM Employees WHERE DepartmentID = @DeptID;
END;
GO


EXEC sp_InsertEmployee 
    @FirstName = 'Ravi',
    @LastName = 'Kumar',
    @DepartmentID = 1,
    @Salary = 60000.00,
    @JoinDate = '2023-06-25';
GO

-- Execute procedure to view employees in Department 1 (HR)
EXEC sp_GetEmployeesByDepartment @DeptID = 1;
