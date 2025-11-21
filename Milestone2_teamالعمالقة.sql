
/*2.1 Omar Mohamed Starts here*/

CREATE DATABASE University_HR_ManagementSystem_Team_40
GO
USE University_HR_ManagementSystem_Team_40
GO

CREATE PROC createAllTables
AS
BEGIN
CREATE TABLE Department(
name VARCHAR(50) PRIMARY KEY,
building_location VARCHAR(50),
CHECK (name IN ('MET', 'IET', 'HR', 'Medical')),
);

CREATE TABLE Employee(
employee_ID INT PRIMARY KEY IDENTITY(1,1),
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(50),
password VARCHAR(50),
address VARCHAR(50),
gender CHAR(1),
official_day_off VARCHAR(50),
years_of_experience INT,
national_ID CHAR(16),
employment_status VARCHAR(50),
type_of_contract VARCHAR (50),
emergency_contact_name VARCHAR (50),
emergency_contact_phone CHAR (11),
annual_balance INT, 
accidental_balance INT,
salary DECIMAL(10,2),
hire_date DATE,
last_working_date DATE,
dept_name VARCHAR(50) FOREIGN KEY REFERENCES Department(name),
CHECK(employment_status IN ('active','onleave','notice_period','resigned')),
CHECK(type_of_contract IN ('full_time','part_time'))
);

CREATE TABLE Employee_Phone (
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
phone_num CHAR(11),
PRIMARY KEY(emp_ID,phone_num)
);

CREATE TABLE Role(
role_name VARCHAR(50) PRIMARY KEY,
title VARCHAR(50),
description VARCHAR(50),
rank INT,
base_salary DECIMAL(10,2),
percentage_YOE DECIMAL(4,2),
percentage_overtime DECIMAL(4,2),
annual_balance INT,
accidental_balance INT
);

CREATE TABLE Employee_Role(
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
role_name VARCHAR(50)  FOREIGN KEY REFERENCES Role(role_name),
PRIMARY KEY (emp_ID,role_name)
);

CREATE TABLE Role_existsIn_Department(
department_name varchar(50) FOREIGN KEY REFERENCES Department(name),
role_name varchar(50) FOREIGN KEY REFERENCES Role(role_name),
PRIMARY KEY (department_name,role_name)
);

CREATE TABLE Leave (
    request_ID INT IDENTITY(1,1) PRIMARY KEY, 
    date_of_request DATE,
    start_date DATE,
    end_date DATE,
    num_days AS DATEDIFF(DAY, start_date, end_date),
    final_approval_status VARCHAR(50) DEFAULT 'pending',
    CHECK (final_approval_status IN ('approved', 'rejected', 'pending'))
);

CREATE TABLE Annual_Leave(
request_ID int FOREIGN KEY REFERENCES Leave(request_ID),
emp_ID int FOREIGN KEY REFERENCES Employee(employee_ID),
replacement_emp int FOREIGN KEY REFERENCES Employee(employee_ID),
PRIMARY KEY (request_ID)
);

CREATE TABLE Accidental_Leave
(
request_ID int FOREIGN KEY REFERENCES Leave(request_ID),
emp_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
PRIMARY KEY (request_ID)
);

CREATE TABLE Medical_Leave  (
    request_ID  INT FOREIGN KEY REFERENCES Leave(request_ID),
    insurance_status BIT,
    disability_details VARCHAR(50),
    type VARCHAR(50),
    CHECK (type IN ('sick', 'maternity')),
    Emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
    PRIMARY KEY (request_ID)
);

CREATE TABLE Unpaid_Leave (
    request_ID  INT FOREIGN KEY  REFERENCES Leave(request_ID) ,
    Emp_ID INT FOREIGN KEY  REFERENCES Employee(employee_ID), 
    PRIMARY KEY (request_ID)
);

CREATE TABLE Compensation_Leave (
    request_ID  INT FOREIGN KEY  REFERENCES Leave(request_ID),
    reason VARCHAR(50), 
    date_of_original_workday DATE,
    emp_ID INT FOREIGN KEY  REFERENCES Employee(employee_ID), 
    replacement_emp INT FOREIGN KEY REFERENCES Employee(employee_ID), 
    PRIMARY KEY (request_ID)
);

CREATE TABLE Document(
document_ID INT PRIMARY KEY,
type VARCHAR(50),
description VARCHAR(50),
file_name VARCHAR(50),
creation_date DATE,
expiry_date DATE,
status VARCHAR(50),
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
medical_ID INT FOREIGN KEY REFERENCES Medical_Leave(request_ID),
unpaid_ID INT  FOREIGN KEY REFERENCES Unpaid_Leave(request_ID),
CHECK (status IN ('valid','expired'))
);

CREATE TABLE Payroll (
ID INT PRIMARY KEY,
payment_date DATE,
final_salary_amount DECIMAL(10,1),
from_date DATE,
to_date DATE,
comments VARCHAR(150),
bonus_amount DECIMAL(10,2),
deductions_amount DECIMAL(10,2),
emp_ID INT FOREIGN KEY  REFERENCES Employee(employee_ID)
);

CREATE TABLE Attendance(
attendance_ID INT PRIMARY KEY,
date DATE,
check_in_time TIME,
check_out_time TIME,
total_duration AS  DATEDIFF(MINUTE, check_in_time, check_out_time),
status VARCHAR(50) DEFAULT 'Absent',
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
CHECK(status IN ('Absent','Attended'))
);

CREATE TABLE deduction(
deduction_ID INT,
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
date DATE, 
amount DECIMAL(10,2),
type VARCHAR(50),
status VARCHAR(50) DEFAULT 'pending',
unpaid_ID INT FOREIGN KEY REFERENCES Unpaid_Leave(request_ID),
attendance_ID INT FOREIGN KEY REFERENCES Attendance(attendance_ID),
CHECK(type IN ('unpaid','missing_hours','missing_days')),
CHECK(status IN ('pending','finalized')),
PRIMARY KEY (deduction_ID,emp_ID)
);

CREATE TABLE Performance (
performance_ID int PRIMARY KEY,
rating INT,
comments VARCHAR(50),
semester CHAR(3),
emp_ID int FOREIGN KEY REFERENCES Employee(employee_ID),
CHECK(rating IN(1,2,3,4,5))
);

CREATE TABLE Employee_Replace_Employee (
Emp1_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
Emp2_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
from_date DATE,
to_date DATE,
PRIMARY KEY (Emp1_ID,Emp2_ID)
);

CREATE TABLE Employee_Approve_Leave (
Emp1_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
Leave_ID int FOREIGN KEY  REFERENCES Leave(request_ID),
status VARCHAR(50),
PRIMARY KEY ( Emp1_ID, Leave_ID )
);
END
GO

EXEC createAllTables
GO

CREATE PROC dropAllTables 
AS
BEGIN
DROP TABLE Employee_Approve_Leave;
DROP TABLE Employee_Replace_Employee;
DROP TABLE Performance;
DROP TABLE Deduction;
DROP TABLE Attendance;
DROP TABLE Payroll;
DROP TABLE Document;
DROP TABLE Compensation_Leave;
DROP TABLE Unpaid_Leave;
DROP TABLE Medical_Leave;
DROP TABLE Accidental_Leave;
DROP TABLE Annual_Leave;
DROP TABLE Leave;
DROP TABLE Role_existsIn_Department ;
DROP TABLE Employee_Role;
DROP TABLE Role;
DROP TABLE Employee_Phone;
DROP TABLE Employee;
DROP TABLE Department;
END
GO

EXEC dropAllTables
GO

CREATE PROC clearAllTables 
AS
BEGIN
TRUNCATE TABLE Employee_Approve_Leave;
TRUNCATE TABLE Employee_Replace_Employee;
TRUNCATE TABLE Performance;
TRUNCATE TABLE Deduction;
TRUNCATE TABLE Attendance;
TRUNCATE TABLE Payroll;
TRUNCATE TABLE Document;
TRUNCATE TABLE Compensation_Leave;
TRUNCATE TABLE Unpaid_Leave;
TRUNCATE TABLE Medical_Leave;
TRUNCATE TABLE Accidental_Leave;
TRUNCATE TABLE Annual_Leave;
TRUNCATE TABLE Leave;
TRUNCATE TABLE Role_existsIn_Department ;
TRUNCATE TABLE Employee_Role;
TRUNCATE TABLE Role;
TRUNCATE TABLE Employee_Phone;
TRUNCATE TABLE Employee;
TRUNCATE TABLE Department;
END
GO

EXEC clearAllTables
GO

CREATE PROC dropAllProceduresFunctionsViews
AS
BEGIN
DROP PROC createAllTables;
DROP PROC dropAllTables;
DROP PROC clearAllTablesl
END
GO


/*2.2 Samy starts here*/

CREATE VIEW  allEmployeeProfiles 
AS
SELECT employee_ID, first_name,last_name,gender,email,address,years_of_experience,
official_day_off,type_of_contract,employment_status,annual_balance
FROM Employee 
GO
SELECT * FROM allEmployeeProfiles;
GO 

CREATE VIEW NoEmployeeDept 
AS
SELECT dept_name,COUNT(*) AS number_of_employees
FROM Employee
GROUP BY dept_name
GO
SELECT* FROM NoEmployeeDept 
GO

CREATE VIEW allPerformance
AS
SELECT performance_ID, rating, comments, semester, emp_ID
FROM Performance
WHERE semester like 'W%'
GO
SELECT * FROM  allPerformance
GO

CREATE VIEW allRejectedMedicals 
AS
SELECT  m.request_ID,m.insurance_status, m.disability_details, m.type, m.Emp_ID,
l.date_of_request,l.start_date,l.end_date,l.num_days, l.final_approval_status
FROM Medical_Leave m INNER JOIN Leave l ON m.request_ID = l.request_ID
WHERE l.final_approval_status = 'rejected';
GO
SELECT * FROM  allPerformance
GO

CREATE VIEW allEmployeeAttendance
AS
SELECT attendance_ID, date, check_in_time, check_out_time, total_duration, status, emp_ID
FROM Attendance
WHERE date = CONVERT(date, DATEADD(DAY, -1, GETDATE()))
GO