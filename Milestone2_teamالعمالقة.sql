
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
building_location VARCHAR(50)
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
    num_days AS DATEDIFF(DAY, start_date, end_date) +1,
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
document_ID INT PRIMARY KEY IDENTITY(1,1),
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
ID INT PRIMARY KEY IDENTITY(1,1),
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
attendance_ID INT PRIMARY KEY IDENTITY(1,1),
date DATE,
check_in_time TIME,
check_out_time TIME,
total_duration AS  DATEDIFF(MINUTE, check_in_time, check_out_time),
status VARCHAR(50) DEFAULT 'Absent',
emp_ID INT FOREIGN KEY REFERENCES Employee(employee_ID),
CHECK(status IN ('Absent','Attended'))
);

CREATE TABLE deduction(
deduction_ID INT IDENTITY(1,1),
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
performance_ID int PRIMARY KEY IDENTITY(1,1),
rating INT,
comments VARCHAR(50),
semester CHAR(3),
emp_ID int FOREIGN KEY REFERENCES Employee(employee_ID),
CHECK(rating IN(1,2,3,4,5))
);

CREATE TABLE Employee_Replace_Employee (
Table_ID int IDENTITY(1,1),
Emp1_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
Emp2_ID int FOREIGN KEY  REFERENCES Employee(employee_ID),
from_date DATE,
to_date DATE,
PRIMARY KEY (Table_ID,Emp1_ID,Emp2_ID)
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
exec createAllTables
go 


CREATE PROC dropAllProceduresFunctionsViews
AS
BEGIN
DROP VIEW allEmployeeProfiles
DROP VIEW NoEmployeeDept
DROP VIEW allPerformance
DROP VIEW allRejectedMedicals
DROP VIEW allEmployeeAttendance
DROP FUNCTION HRLoginValidation
DROP FUNCTION Bonus_amount
DROP FUNCTION EmployeeLoginValidation
DROP FUNCTION MyPerformance
DROP FUNCTION MyAttendance
DROP FUNCTION Last_month_payroll
DROP FUNCTION Deductions_Attendance
DROP FUNCTION Is_On_Leave
DROP PROCEDURE createAllTables
DROP PROCEDURE dropAllTables
DROP PROCEDURE dropAllProceduresFunctionsViews
DROP PROCEDURE clearAllTables
DROP PROCEDURE Update_Status_Doc
DROP PROCEDURE Remove_Deductions
DROP PROCEDURE Update_Employment_Status
DROP PROCEDURE Create_Holiday
DROP PROCEDURE Add_Holiday
DROP PROCEDURE Intitiate_Attendance
DROP PROCEDURE Update_Attendance
DROP PROCEDURE Remove_Holiday
DROP PROCEDURE Remove_DayOff
DROP PROCEDURE Remove_Approved_Leaves
DROP PROCEDURE Replace_employee
DROP PROCEDURE HR_approval_an_acc
DROP PROCEDURE HR_approval_unpaid
DROP PROCEDURE HR_approval_comp
DROP PROCEDURE Deduction_hours
DROP PROCEDURE Deduction_days
DROP PROCEDURE Deduction_unpaid
DROP PROCEDURE Add_Payroll
DROP PROCEDURE Submit_annual
DROP PROCEDURE Upperboard_approve_annual
DROP PROCEDURE Submit_accidental
DROP PROCEDURE Submit_medical
DROP PROCEDURE Submit_unpaid
DROP PROCEDURE Upperboard_approve_unpaids
DROP PROCEDURE Submit_compensation
DROP PROCEDURE Dean_andHR_Evaluation
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

/*2.3 Omar osama starts here*/

CREATE PROCEDURE Update_Status_Doc
AS
BEGIN
    UPDATE Document
    SET status = 'expired'
    WHERE expiry_date < CURRENT_TIMESTAMP;

    UPDATE Document
    SET status = 'valid'
    WHERE expiry_date >= CURRENT_TIMESTAMP;
END;
GO



CREATE PROCEDURE Remove_Deductions
AS
BEGIN
Delete Deduction from Deduction
JOIN Employee ON Deduction.emp_ID = Employee.employee_ID
WHERE Employee.employment_status = 'resigned';
END;
GO


CREATE PROCEDURE Update_Employment_Status
@Employee_ID int
AS
BEGIN
IF EXISTS(
SELECT 1
FROM Leave L
WHERE L.final_approval_status = 'approved' AND L.start_date <= CURRENT_TIMESTAMP AND L.end_date >= CURRENT_TIMESTAMP
AND (
       EXISTS (SELECT 1 FROM Annual_Leave       A WHERE A.request_ID = L.request_ID AND A.emp_ID = @Employee_ID)
       OR EXISTS (SELECT 1 FROM Accidental_Leave   A WHERE A.request_ID = L.request_ID AND A.emp_ID = @Employee_ID)
       OR EXISTS (SELECT 1 FROM Medical_Leave      M WHERE M.request_ID = L.request_ID AND M.emp_ID = @Employee_ID)
       OR EXISTS (SELECT 1 FROM Unpaid_Leave       U WHERE U.request_ID = L.request_ID AND U.emp_ID = @Employee_ID)
       OR EXISTS (SELECT 1 FROM Compensation_Leave C WHERE C.request_ID = L.request_ID AND C.emp_ID = @Employee_ID))
)
BEGIN
UPDATE Employee
SET employment_status = 'onleave'
WHERE employee_ID = @Employee_ID;
END

    ELSE
BEGIN
UPDATE Employee
SET employment_status = 'active'
WHERE employee_ID = @Employee_ID;
END

END;
GO


CREATE PROCEDURE Create_Holiday
AS
BEGIN
    CREATE TABLE Holiday (
        holiday_id int IDENTITY(1,1) PRIMARY KEY,
        name varchar(50),
        from_date date,
        to_date date
    );
END;
GO

CREATE PROCEDURE Add_Holiday
    @holiday_name varchar(50),
    @from_date date,
    @to_date date
AS
BEGIN
    INSERT INTO Holiday (name, from_date, to_date)
    VALUES (@holiday_name, @from_date, @to_date);
END;
GO

CREATE PROCEDURE Intitiate_Attendance
AS
BEGIN
INSERT INTO Attendance (date, check_in_time, check_out_time, status, emp_ID)
SELECT CURRENT_TIMESTAMP, NULL, NULL, 'Absent', employee_ID FROM Employee;
END;
GO



CREATE PROCEDURE Update_Attendance
@Employee_ID int,
@check_in time,
@check_out time
AS
BEGIN

UPDATE Attendance
SET check_in_time = @check_in,
check_out_time = @check_out,
status = 'attended'
WHERE emp_ID = @Employee_ID AND date = CURRENT_TIMESTAMP;

END;
GO



CREATE PROCEDURE Remove_Holiday
AS
BEGIN
DELETE Attendance FROM Attendance, Holiday
WHERE Attendance.date BETWEEN Holiday.from_date AND Holiday.to_date;
END;
GO


CREATE PROCEDURE Remove_DayOff
@Employee_ID int
AS
BEGIN
DELETE Attendance FROM Attendance, Employee
WHERE Attendance.emp_ID = Employee.employee_ID AND Attendance.emp_ID = @Employee_ID AND MONTH(Attendance.date) = MONTH(CURRENT_TIMESTAMP)
AND YEAR(Attendance.date) = YEAR(CURRENT_TIMESTAMP)
AND DATENAME(weekday, Attendance.date) = Employee.official_day_off
AND Attendance.status = 'Absent';
END;
GO


CREATE PROCEDURE Remove_Approved_Leaves
    @Employee_ID int
AS
BEGIN
    DELETE Attendance
    FROM Attendance, Leave, Annual_Leave
    WHERE Attendance.emp_ID = @Employee_ID
      AND Annual_Leave.emp_ID = @Employee_ID
      AND Annual_Leave.request_ID = Leave.request_ID
      AND Leave.final_approval_status = 'approved'
      AND Attendance.date BETWEEN Leave.start_date AND Leave.end_date;

    DELETE Attendance
    FROM Attendance, Leave, Accidental_Leave
    WHERE Attendance.Emp_ID = @Employee_ID
      AND Accidental_Leave.emp_ID = @Employee_ID
      AND Accidental_Leave.request_ID = Leave.request_ID
      AND Leave.final_approval_status = 'approved'
      AND Attendance.date BETWEEN Leave.start_date AND Leave.end_date;

    DELETE Attendance
    FROM Attendance, Leave, Medical_Leave
    WHERE Attendance.Emp_ID = @Employee_ID
      AND Medical_Leave.emp_ID = @Employee_ID
      AND Medical_Leave.request_ID = Leave.request_ID
      AND Leave.final_approval_status = 'approved'
      AND Attendance.date BETWEEN Leave.start_date AND Leave.end_date;

    DELETE Attendance
    FROM Attendance, Leave, Unpaid_Leave
    WHERE Attendance.Emp_ID = @Employee_ID
      AND Unpaid_Leave.emp_ID = @Employee_ID
      AND Unpaid_Leave.request_ID = Leave.request_ID
      AND Leave.final_approval_status = 'approved'
      AND Attendance.date BETWEEN Leave.start_date AND Leave.end_date;

    DELETE Attendance
    FROM Attendance, Leave, Compensation_Leave
    WHERE Attendance.Emp_ID = @Employee_ID
      AND Compensation_Leave.emp_ID = @Employee_ID
      AND Compensation_Leave.request_ID = Leave.request_ID
      AND Leave.final_approval_status = 'approved'
      AND Attendance.date BETWEEN Leave.start_date AND Leave.end_date;
END;
GO

CREATE PROCEDURE Replace_employee
    @Emp1_ID int,
    @Emp2_ID int,
    @from_date date,
    @to_date date
AS
BEGIN
    INSERT INTO Employee_Replace_Employee (Emp1_ID, Emp2_ID, from_date, to_date)
    VALUES (@Emp1_ID, @Emp2_ID, @from_date, @to_date);
END;
GO



/*2.4 Mostafa starts here*/

USE University_HR_ManagementSystem_Team_40
GO

SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO

IF OBJECT_ID('dbo.HRLoginValidation','FN') IS NOT NULL
DROP FUNCTION dbo.HRLoginValidation
GO

CREATE FUNCTION dbo.HRLoginValidation(@employee_ID INT, @password VARCHAR(50))
RETURNS BIT
AS
BEGIN
DECLARE @result BIT = 0

IF EXISTS (
SELECT 1
FROM Employee E
JOIN Employee_Role ER ON E.employee_ID = ER.emp_ID
JOIN Role R ON ER.role_name = R.role_name
WHERE E.employee_ID = @employee_ID
AND E.password = @password
AND (R.role_name LIKE 'HR_%' OR E.dept_name = 'HR')
)
SET @result = 1

RETURN @result
END
GO

IF OBJECT_ID('dbo.HR_approval_an_acc','P') IS NOT NULL
DROP PROC dbo.HR_approval_an_acc
GO

CREATE PROC dbo.HR_approval_an_acc
@request_ID INT,
@HR_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @emp_ID INT, @num_days INT, @curr_status VARCHAR(50)

SELECT @num_days = L.num_days, @curr_status = L.final_approval_status
FROM [Leave] L
WHERE L.request_ID = @request_ID

IF @curr_status IS NULL
BEGIN
RAISERROR('Leave request not found.',16,1)
RETURN
END

IF EXISTS(SELECT 1 FROM Annual_Leave WHERE request_ID = @request_ID)
BEGIN
SELECT @emp_ID = emp_ID FROM Annual_Leave WHERE request_ID = @request_ID

IF EXISTS(SELECT 1 FROM Employee WHERE employee_ID = @emp_ID AND type_of_contract = 'part_time')
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
RETURN
END

DECLARE @available INT
SELECT @available = annual_balance FROM Employee WHERE employee_ID = @emp_ID

IF @available >= @num_days
BEGIN
BEGIN TRAN
UPDATE [Leave] SET final_approval_status = 'approved' WHERE request_ID = @request_ID
UPDATE Employee SET annual_balance = annual_balance - @num_days WHERE employee_ID = @emp_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'approved')
COMMIT TRAN
END
ELSE
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
END
END
ELSE IF EXISTS(SELECT 1 FROM Accidental_Leave WHERE request_ID = @request_ID)
BEGIN
SELECT @emp_ID = emp_ID FROM Accidental_Leave WHERE request_ID = @request_ID

IF @num_days <= 1
BEGIN
UPDATE [Leave] SET final_approval_status = 'approved' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'approved')
END
ELSE
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
END
END
ELSE
BEGIN
RAISERROR('Request is neither annual nor accidental leave.',16,1)
END
END
GO

IF OBJECT_ID('dbo.HR_approval_unpaid','P') IS NOT NULL
DROP PROC dbo.HR_approval_unpaid
GO

CREATE PROC dbo.HR_approval_unpaid
@request_ID INT,
@HR_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @emp_ID INT, @num_days INT

SELECT @num_days = L.num_days, @emp_ID = UL.Emp_ID
FROM Unpaid_Leave UL
JOIN [Leave] L ON UL.request_ID = L.request_ID
WHERE UL.request_ID = @request_ID

IF @emp_ID IS NULL
BEGIN
RAISERROR('Unpaid leave request not found.',16,1)
RETURN
END

IF EXISTS(SELECT 1 FROM Employee WHERE employee_ID = @emp_ID AND type_of_contract = 'part_time')
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
RETURN
END

IF EXISTS(
SELECT 1 FROM Unpaid_Leave U
JOIN [Leave] L ON U.request_ID = L.request_ID
WHERE U.Emp_ID = @emp_ID AND L.final_approval_status = 'approved'
AND YEAR(L.start_date) = YEAR((SELECT start_date FROM [Leave] WHERE request_ID = @request_ID))
)
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
RETURN
END

IF @num_days <= 30
BEGIN
UPDATE [Leave] SET final_approval_status = 'approved' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'approved')
END
ELSE
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
END
END
GO

IF OBJECT_ID('dbo.HR_approval_comp','P') IS NOT NULL
DROP PROC dbo.HR_approval_comp
GO

CREATE PROC dbo.HR_approval_comp
@request_ID INT,
@HR_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @emp_ID INT, @workday DATE, @minutes INT, @approved BIT = 0

SELECT @emp_ID = CL.emp_ID, @workday = CL.date_of_original_workday
FROM Compensation_Leave CL
WHERE CL.request_ID = @request_ID

IF @emp_ID IS NULL
BEGIN
RAISERROR('Compensation leave request not found.',16,1)
RETURN
END

SELECT @minutes = total_duration
FROM Attendance
WHERE emp_ID = @emp_ID AND date = @workday

IF @minutes IS NOT NULL AND (@minutes / 60.0) >= 8
SET @approved = 1

IF @approved = 1
BEGIN
UPDATE [Leave] SET final_approval_status = 'approved' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'approved')
END
ELSE
BEGIN
UPDATE [Leave] SET final_approval_status = 'rejected' WHERE request_ID = @request_ID
INSERT INTO Employee_Approve_Leave(Emp1_ID, Leave_ID, status) VALUES(@HR_ID, @request_ID, 'rejected')
END
END
GO

IF OBJECT_ID('dbo.Deduction_hours','P') IS NOT NULL
DROP PROC dbo.Deduction_hours
GO

CREATE PROC dbo.Deduction_hours
@employee_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @firstAttendanceID INT, @minutes INT, @missingHours DECIMAL(10,2)
DECLARE @ratePerHour DECIMAL(10,4), @amount DECIMAL(10,2)

SELECT TOP 1 @firstAttendanceID = attendance_ID, @minutes = total_duration
FROM Attendance
WHERE emp_ID = @employee_ID
AND MONTH(date) = MONTH(GETDATE())
AND YEAR(date) = YEAR(GETDATE())
AND (ISNULL(total_duration,0) < 480)
ORDER BY date ASC

IF @firstAttendanceID IS NULL
BEGIN
RAISERROR('No attendance record with less than 8 hours found for this month.',16,1)
RETURN
END

SET @missingHours = (8.0 - (ISNULL(@minutes,0) / 60.0))
IF @missingHours < 0 SET @missingHours = 0

SELECT @ratePerHour = (salary / 22.0) / 8.0
FROM Employee WHERE employee_ID = @employee_ID

SET @amount = ROUND(@ratePerHour * @missingHours, 2)

INSERT INTO Deduction(emp_ID, date, amount, type, status, attendance_ID)
VALUES(@employee_ID, CONVERT(date, GETDATE()), @amount, 'missing_hours', 'pending', @firstAttendanceID)
END
GO

IF OBJECT_ID('dbo.Deduction_days','P') IS NOT NULL
DROP PROC dbo.Deduction_days
GO

CREATE PROC dbo.Deduction_days
@employee_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @ratePerDay DECIMAL(10,4), @attendanceDate DATE

SELECT @ratePerDay = (salary / 22.0) FROM Employee WHERE employee_ID = @employee_ID

IF @ratePerDay IS NULL
BEGIN
RAISERROR('Employee not found.',16,1)
RETURN
END

DECLARE attendance_cursor CURSOR FOR
SELECT date FROM Attendance
WHERE emp_ID = @employee_ID
AND MONTH(date) = MONTH(GETDATE())
AND YEAR(date) = YEAR(GETDATE())
AND status = 'Absent'

OPEN attendance_cursor
FETCH NEXT FROM attendance_cursor INTO @attendanceDate

WHILE @@FETCH_STATUS = 0
BEGIN
IF NOT EXISTS (
SELECT 1 FROM [Leave] L
JOIN Annual_Leave AL ON L.request_ID = AL.request_ID
WHERE AL.emp_ID = @employee_ID AND L.final_approval_status = 'approved' AND @attendanceDate BETWEEN L.start_date AND L.end_date
UNION
SELECT 1 FROM [Leave] L2
JOIN Accidental_Leave AC ON L2.request_ID = AC.request_ID
WHERE AC.emp_ID = @employee_ID AND L2.final_approval_status = 'approved' AND @attendanceDate BETWEEN L2.start_date AND L2.end_date
UNION
SELECT 1 FROM [Leave] L3
JOIN Unpaid_Leave UL ON L3.request_ID = UL.request_ID
WHERE UL.Emp_ID = @employee_ID AND L3.final_approval_status = 'approved' AND @attendanceDate BETWEEN L3.start_date AND L3.end_date
)
BEGIN
INSERT INTO Deduction(emp_ID, date, amount, type, status)
VALUES(@employee_ID, @attendanceDate, ROUND(@ratePerDay,2), 'missing_days', 'pending')
END

FETCH NEXT FROM attendance_cursor INTO @attendanceDate
END

CLOSE attendance_cursor
DEALLOCATE attendance_cursor
END
GO

IF OBJECT_ID('dbo.Deduction_unpaid','P') IS NOT NULL
DROP PROC dbo.Deduction_unpaid
GO

CREATE PROC dbo.Deduction_unpaid
@employee_ID INT
AS
BEGIN
SET NOCOUNT ON
DECLARE @ratePerDay DECIMAL(10,4)
SELECT @ratePerDay = (salary / 22.0) FROM Employee WHERE employee_ID = @employee_ID

IF @ratePerDay IS NULL
BEGIN
RAISERROR('Employee not found.',16,1)
RETURN
END

DECLARE @reqID INT, @s DATE, @e DATE
DECLARE unpaid_cursor CURSOR FOR
SELECT L.request_ID, L.start_date, L.end_date
FROM Unpaid_Leave UL
JOIN [Leave] L ON UL.request_ID = L.request_ID
WHERE UL.Emp_ID = @employee_ID AND L.final_approval_status = 'approved'

OPEN unpaid_cursor
FETCH NEXT FROM unpaid_cursor INTO @reqID, @s, @e

WHILE @@FETCH_STATUS = 0
BEGIN
DECLARE @monthStart DATE = DATEFROMPARTS(YEAR(@s), MONTH(@s), 1)
DECLARE @monthEnd DATE
DECLARE @curStart DATE
DECLARE @curEnd DATE

WHILE @monthStart <= @e
BEGIN
SET @monthEnd = EOMONTH(@monthStart)
SET @curStart = CASE WHEN @s > @monthStart THEN @s ELSE @monthStart END
SET @curEnd = CASE WHEN @e < @monthEnd THEN @e ELSE @monthEnd END

IF @curStart <= @curEnd
BEGIN
DECLARE @days INT = DATEDIFF(DAY, @curStart, @curEnd) + 1
DECLARE @amount DECIMAL(10,2) = ROUND(@ratePerDay * @days, 2)
INSERT INTO Deduction(emp_ID, date, amount, type, status, unpaid_ID)
VALUES(@employee_ID, @curStart, @amount, 'unpaid', 'pending', @reqID)
END

SET @monthStart = DATEADD(MONTH, 1, @monthStart)
END

FETCH NEXT FROM unpaid_cursor INTO @reqID, @s, @e
END

CLOSE unpaid_cursor
DEALLOCATE unpaid_cursor
END
GO

IF OBJECT_ID('dbo.Bonus_amount','FN') IS NOT NULL
DROP FUNCTION dbo.Bonus_amount
GO

CREATE FUNCTION dbo.Bonus_amount(@employee_ID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
DECLARE @extraHours DECIMAL(10,4) = 0.0
DECLARE @overtimeFactor DECIMAL(10,4) = 0.0
DECLARE @ratePerHour DECIMAL(10,4) = 0.0
DECLARE @salary DECIMAL(10,2) = 0.0
DECLARE @bonus DECIMAL(10,2) = 0.0

SELECT @extraHours = SUM(CASE WHEN (ISNULL(total_duration,0)/60.0) - 8 > 0 THEN ((ISNULL(total_duration,0)/60.0) - 8) ELSE 0 END)
FROM Attendance
WHERE emp_ID = @employee_ID
AND MONTH(date) = MONTH(GETDATE())
AND YEAR(date) = YEAR(GETDATE())

IF @extraHours IS NULL SET @extraHours = 0

SELECT TOP 1 @overtimeFactor = R.percentage_overtime
FROM Employee_Role ER
JOIN Role R ON ER.role_name = R.role_name
WHERE ER.emp_ID = @employee_ID
ORDER BY R.rank ASC

IF @overtimeFactor IS NULL SET @overtimeFactor = 0

SELECT @salary = salary FROM Employee WHERE employee_ID = @employee_ID
IF @salary IS NULL SET @salary = 0

SET @ratePerHour = CASE WHEN @salary = 0 THEN 0 ELSE (@salary / 22.0) / 8.0 END
SET @bonus = ROUND(@ratePerHour * ((@overtimeFactor * @extraHours) / 100.0), 2)

RETURN @bonus
END
GO

IF OBJECT_ID('dbo.Add_Payroll','P') IS NOT NULL
DROP PROC dbo.Add_Payroll
GO

CREATE PROC dbo.Add_Payroll
@employee_ID INT,
@from_date DATE,
@to_date DATE
AS
BEGIN
SET NOCOUNT ON
BEGIN TRY
BEGIN TRAN

DECLARE @salary DECIMAL(10,2), @daysInPeriod INT, @daysInMonth INT, @salaryForPeriod DECIMAL(10,2)
DECLARE @bonus DECIMAL(10,2), @deductionsTotal DECIMAL(10,2)
DECLARE @finalSalary DECIMAL(10,2)

SELECT @salary = salary FROM Employee WHERE employee_ID = @employee_ID
IF @salary IS NULL
BEGIN
RAISERROR('Employee not found',16,1)
ROLLBACK TRAN
RETURN
END

SET @daysInPeriod = DATEDIFF(DAY, @from_date, @to_date) + 1
SET @daysInMonth = DAY(EOMONTH(@from_date))
SET @salaryForPeriod = ROUND((@salary * CAST(@daysInPeriod AS DECIMAL(10,4)) / CAST(@daysInMonth AS DECIMAL(10,4))),2)

DECLARE @extraHours DECIMAL(10,4) = 0.0, @overtimeFactor DECIMAL(10,4) = 0.0, @ratePerHour DECIMAL(10,4) = 0.0

SELECT @extraHours = SUM(CASE WHEN (ISNULL(total_duration,0)/60.0) - 8 > 0 THEN ((ISNULL(total_duration,0)/60.0) - 8) ELSE 0 END)
FROM Attendance
WHERE emp_ID = @employee_ID
AND date BETWEEN @from_date AND @to_date

IF @extraHours IS NULL SET @extraHours = 0

SELECT TOP 1 @overtimeFactor = R.percentage_overtime
FROM Employee_Role ER
JOIN Role R ON ER.role_name = R.role_name
WHERE ER.emp_ID = @employee_ID
ORDER BY R.rank ASC

IF @overtimeFactor IS NULL SET @overtimeFactor = 0
SET @ratePerHour = CASE WHEN @salary = 0 THEN 0 ELSE (@salary / 22.0) / 8.0 END
SET @bonus = ROUND(@ratePerHour * ((@overtimeFactor * @extraHours) / 100.0), 2)

SELECT @deductionsTotal = ISNULL(SUM(amount),0)
FROM Deduction
WHERE emp_ID = @employee_ID
AND status = 'pending'
AND date BETWEEN @from_date AND @to_date

IF @deductionsTotal IS NULL SET @deductionsTotal = 0

SET @finalSalary = ROUND(@salaryForPeriod + @bonus - @deductionsTotal, 2)

INSERT INTO Payroll(payment_date, final_salary_amount, from_date, to_date, comments, bonus_amount, deductions_amount, emp_ID)
VALUES(CONVERT(date, GETDATE()), @finalSalary, @from_date, @to_date, 'Payroll generated', @bonus, @deductionsTotal, @employee_ID)

UPDATE Deduction
SET status = 'finalized'
WHERE emp_ID = @employee_ID
AND status = 'pending'
AND date BETWEEN @from_date AND @to_date

COMMIT TRAN
END TRY
BEGIN CATCH
IF XACT_STATE() <> 0 ROLLBACK TRAN
DECLARE @ErrMsg NVARCHAR(4000) = ERROR_MESSAGE()
RAISERROR('Error in Add_Payroll: %s',16,1,@ErrMsg)
END CATCH
END
GO

/*2.5 Adham starts here*/



create function EmployeeLoginValidation
(@employee_ID int,@password varchar(50))
returns BIT
AS
BEGIN
declare @x BIT=0
if EXISTS(
    SELECT 1 from Employee e where e.employee_ID=@employee_ID
    and password= @password
)
begin set @x=1
END
RETURN @x 
END
GO

create FUNCTION MyPerformance
(@employee_ID int,@semester char(3))
returns TABLE
as 
RETURN
(
select *
from Performance 
where @employee_ID=emp_ID and @semester = semester
)

GO
CREATE function MyAttendance
(@employee_ID int)
RETURNS table 
AS
RETURN
(
select a.date, a.STATUS
from Attendance a inner join  Employee e on a.emp_ID=e.employee_ID
where @employee_ID=a.emp_ID and MONTH(date)=MONTH(GETDATE()) and year(date)=year(GETDATE()) and (DATENAME(weekday,a.date) !=e.official_day_off)
)

GO


create function Last_month_payroll
(@employee_ID int)
returns TABLE
as 
RETURN
(
    SELECT *
    from Payroll
    where Month(payment_date)=MONTH(dateadd(month ,-1,GETDATE())) and year(payment_date)=YEAR(DATEADD(MONTH, -1, GETDATE()))   /*the year addition was done partially using claude AI*/
    
)



GO

CREATE FUNCTION Deductions_Attendance
( @employee_ID int, @month int)
returns table 
as 
RETURN
(
    select d.date , d.amount,d.type ,d.status 
    from deduction d inner join attendance a on d.attendance_ID=a.attendance_ID
    where @employee_ID = d.emp_ID and a.status= 'absent' and (d.date >= dateadd(month ,-@month,GETDATE()))

)


GO



--change leave table mafeehash emp id
create function Is_On_Leave 
(@employee_ID int, @from date ,@to date)
returns bit 
as 
BEGIN
declare @x BIT =0
if exists(
   select 1 from Annual_Leave l1 inner join  Leave l on l1.request_ID = l.request_ID
        where l1.emp_ID = @employee_ID 
            and l.start_date = @from 
            and l.end_date = @to 
            and l.final_approval_status != 'rejected'
    )
    or exists(
   select 1 from Accidental_Leave l2 inner join  Leave l on l2.request_ID = l.request_ID
        where l2.emp_ID = @employee_ID 
            and l.start_date = @from 
            and l.end_date = @to 
            and l.final_approval_status != 'rejected'
    )
     or exists(
   select 1 from Medical_Leave l3 inner join  Leave l on l3.request_ID = l.request_ID
        where l3.emp_ID = @employee_ID 
            and l.start_date = @from 
            and l.end_date = @to 
            and l.final_approval_status != 'rejected'
    )
     or exists(
     select 1 from Unpaid_Leave l4 inner join  Leave l on l4.request_ID = l.request_ID
        where l4.emp_ID = @employee_ID 
            and l.start_date = @from 
            and l.end_date = @to 
            and l.final_approval_status != 'rejected'
    )

     or exists(
   select 1 from Compensation_Leave l5 inner join  Leave l on l5.request_ID = l.request_ID
        where l5.emp_ID = @employee_ID 
            and l.start_date = @from 
            and l.end_date = @to 
            and l.final_approval_status != 'rejected'
    )

begin set @x=1
END
RETURN @x 
END
GO


/*7ad yekamel men hena ;-;*/


/*needs review and checking*/
create proc Submit_annual
(@employee_ID int, @replacement_emp int, @start_date date, @end_date date)
as 
BEGIN
  
    insert into leave( date_of_request , start_date, end_date)
    VALUES(getdate(),@start_date,@end_date)
    declare @x int =SCOPE_IDENTITY()
    insert into Annual_Leave(request_ID,emp_ID,replacement_emp)
    values(@x,@employee_ID,@replacement_emp)
    
    declare @z varchar(50) = 'pending'
    if EXISTS(
        SELECT 1 from Employee where employee_ID=@employee_ID and type_of_contract= 'part_time'
    )
    
    begin set @z= 'rejected'
    END
    insert into Employee_Approve_Leave(Emp1_ID,Leave_ID,status)
    VALUES (@employee_ID,@x,@z)
    
end

   go

   /*kamel bokra*/
    create function Status_leaves
    (@employee_ID int)
 returns table 
 as 
 RETURN
    (
    select l.request_ID,l.date_of_request,l.final_approval_status 
    from leave l
    where  exists(select 1 from Annual_Leave a where a.emp_ID=@employee_ID and l.request_ID=a.request_ID) or
     exists(select 1 from Accidental_Leave a where a.emp_ID=@employee_ID and l.request_ID=a.request_ID)
    
)
GO



/*procedure bayza 99% sure*/
create procedure Upperboard_approve_annual
    (@request_ID int,@Upperboard_ID int,@replacement_ID int)
as
begin
    declare @x int
    declare @y varchar(50)
    declare @z varchar(50)
    declare @zs varchar(50)
    declare @as varchar(50)
    declare @w varchar(50)
    declare @j date
    declare @k date
    declare @i bit
    
    select start_date=@j , end_date=@k from Leave  where request_ID=@replacement_ID
    set @i = dbo.Is_On_Leave(@replacement_ID,@j,@k)
    if(@i=1)
    begin return end
    
    begin 
    return
    end
    
      select top 1 @w = e.role_name from Employee_Role e inner join Role r on e.role_name = r.role_name
    where e.emp_ID = @Upperboard_ID and e.role_name in ('Dean', 'Vice Dean', 'President')
    order by r.rank asc
    
    if (@w is null)
        return

    select @x = emp_ID from Annual_Leave where request_ID = @request_ID
    
    select @y = dept_name from Employee where employee_ID = @x
      select @z = dept_name, @zs = employment_status from Employee where employee_ID = @replacement_ID
    
      if (@z = @y and @zs != 'onleave')
    begin
        set @as = 'approved'
    end
        else
        begin
        set @as = 'rejected'
        end
    
         if exists (select 1 from Employee_Approve_Leave where Emp1_ID = @Upperboard_ID and Leave_ID = @request_ID)
    begin
        update Employee_Approve_Leave
        set status = @as
        where Emp1_ID = @Upperboard_ID and Leave_ID = @request_ID
         end
    else
    begin
        insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
        values (@Upperboard_ID, @request_ID, @as)
    end
    
        if (@as = 'rejected')
    begin
        update Leave
        set final_approval_status = 'rejected'
        where request_ID = @request_ID
    end
end
go


create procedure Submit_accidental
    (@employee_ID int, @start_date date , @end_date date)
as
begin
    declare @x int
    declare @num_days int
    declare @dept_name varchar(50)
    declare @hr_rep_role varchar(50)
    declare @hr_rep_ID int
      set @num_days = datediff(day, @start_date, @end_date)
        select @dept_name = dept_name from Employee where employee_ID = @employee_ID
    
        insert into Leave (date_of_request, start_date, end_date, final_approval_status)
                   values (getdate(), @start_date, @end_date, 'pending')
    
        set @x = scope_identity()
        insert into Accidental_Leave (request_ID, emp_ID)
        values (@x, @employee_ID)
        set @hr_rep_role = 'HR_Representative_' + @dept_name
    
    select @hr_rep_ID = e.employee_ID
    from Employee e inner join Employee_Role r on e.employee_ID = r.emp_ID
    where r.role_name = @hr_rep_role
    
    if (@hr_rep_ID is not null)
    begin
    insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
    values (@hr_rep_ID, @x, 'pending')
    end
end
go
create procedure Submit_medical
    (@employee_ID int,@start_date date,@end_date date,@type varchar(50),@insurance_status bit,@disability_details varchar(50),
    @document_description varchar(50),@file_name varchar(50))
as
begin
    declare @x int
    declare @num_days int
    DECLARE @dept_name varchar(50)
    declare @hr_rep_role varchar(50)
    declare @hr_rep_ID int
    declare @document_ID int
       set @num_days = datediff(day, @start_date, @end_date)
    
       SELECT @dept_name = dept_name
    from Employee
    where employee_ID = @employee_ID
    
        insert into Leave (date_of_request, start_date, end_date, final_approval_status)
        values (getdate(), @start_date, @end_date, 'pending')
    
        set @x = scope_identity()
    
        insert into Medical_Leave (request_ID, insurance_status, disability_details, type, Emp_ID)
        values (@x, @insurance_status, @disability_details, @type, @employee_ID)
    
        insert into Document ( description, file_name, creation_date, status, emp_ID, medical_ID, unpaid_ID)
         values ( @document_description, @file_name, getdate(), 'valid', @employee_ID, @x, null)
    
        set @hr_rep_role = 'HR_Representative_' + @dept_name
    
    select @hr_rep_ID = e.employee_ID
    from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
    where er.role_name = @hr_rep_role
       if (@hr_rep_ID is not null)
    begin
        insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
        values (@hr_rep_ID, @x, 'pending')
    end
end
go

create procedure Submit_unpaid
(@employee_ID int,@start_date date, @end_date date,@document_description varchar(50), @file_name varchar(50))
as
begin
    declare @x int
    declare @y int
    declare @dept_name varchar(50)
    declare @employee_role varchar(50)
    declare @z int
    declare @dean_ID int
    declare @vice_dean_ID int
    declare @hr_rep_role varchar(50)
    declare @hr_rep_ID int
    declare @hr_manager_ID int
    declare @president_ID int
    declare @dean_status varchar(50)
    
    set @y = datediff(day, @start_date, @end_date)
    
    select @dept_name = dept_name
    from Employee
    where employee_ID = @employee_ID
    
    select top 1 @employee_role = e.role_name, @z = r.rank
    from Employee_Role e inner join Role r on e.role_name = r.role_name
    where e.emp_ID = @employee_ID
    order by r.rank asc
    
    insert into Leave (date_of_request, start_date, end_date, final_approval_status)
    values (getdate(), @start_date, @end_date, 'pending')
    
    set @x = scope_identity()
    
    insert into Unpaid_Leave (request_ID, Emp_ID)
    values (@x, @employee_ID)
    
    insert into Document ( description, file_name, creation_date, status, emp_ID, medical_ID, unpaid_ID)
    values ( @document_description, @file_name, getdate(), 'valid', @employee_ID, null, @x)
    
    if (@employee_role in ('Dean', 'Vice Dean'))
    begin
        select @president_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = 'President'
        
        set @hr_rep_role = 'HR_Representative_' + @dept_name
        select @hr_rep_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = @hr_rep_role
        
        if (@president_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@president_ID, @x, 'pending')
        end
        
        if (@hr_rep_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@hr_rep_ID, @x, 'pending')
        end
    end
    else if (@employee_role like 'HR_Representative%')
    begin
        select @president_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = 'President'
        
        select @hr_manager_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = 'HR Manager'
        
        if (@president_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@president_ID, @x, 'pending')
        end
        
        if (@hr_manager_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@hr_manager_ID, @x, 'pending')
        end
    end
    else
    begin
        select @dean_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = 'Dean' and e.dept_name = @dept_name
        
        select @vice_dean_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = 'Vice Dean' and e.dept_name = @dept_name
        
        set @hr_rep_role = 'HR_Representative_' + @dept_name
        select @hr_rep_ID = e.employee_ID
        from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
        where er.role_name = @hr_rep_role
        
        if (@dean_ID is not null)
        begin
            select @dean_status = employment_status
            from Employee
            where employee_ID = @dean_ID
        end
        
        if (@dean_status = 'onleave' and @vice_dean_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@vice_dean_ID, @x, 'pending')
        end
        else if (@dean_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@dean_ID, @x, 'pending')
        end
        
        if (@hr_rep_ID is not null)
        begin
            insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
            values (@hr_rep_ID, @x, 'pending')
        end
    end
end
go

create procedure Upperboard_approve_unpaids
    (@request_ID int,@Upperboard_ID int)
as
begin
    declare @approval_status varchar(50)
    declare @document_exists bit
    declare @upperboard_role varchar(50)
    
    select top 1 @upperboard_role = er.role_name
    from Employee_Role er inner join Role r on er.role_name = r.role_name
    where er.emp_ID = @Upperboard_ID and er.role_name in ('Dean', 'Vice Dean', 'President')
    order by r.rank asc
    
    if (@upperboard_role is null)
        return
    
    select @document_exists = case when count(*) > 0 then 1 else 0 end
    from Document
    where unpaid_ID = @request_ID  and status = 'valid'
    if (@document_exists = 1)
    begin
        set @approval_status = 'approved'
    end
    else
    begin
        set @approval_status = 'rejected'
    end
    
    if exists (select 1 from Employee_Approve_Leave where Emp1_ID = @Upperboard_ID and Leave_ID = @request_ID)
    begin
        update Employee_Approve_Leave
        set status = @approval_status
        where Emp1_ID = @Upperboard_ID and Leave_ID = @request_ID
    end
    else
    begin
        insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
        values (@Upperboard_ID, @request_ID, @approval_status)
    end
    
    if (@approval_status = 'rejected')
    begin
        update Leave
        set final_approval_status = 'rejected'
        where request_ID = @request_ID
    end
end
go

create procedure Submit_compensation
    (@employee_ID int,@compensation_date date,@reason varchar(50),@date_of_original_workday date,@replacement_emp int)
    as
    begin
    declare @request_ID int
    declare @dept_name varchar(50)
    declare @hr_rep_role varchar(50)
    declare @hr_rep_ID int

    select @dept_name = dept_name
    from Employee
    where employee_ID = @employee_ID
    
    insert into Leave (date_of_request, start_date, end_date, final_approval_status)
    values (getdate(), @compensation_date, @compensation_date, 'pending')
    
    set @request_ID = scope_identity()
    
    insert into Compensation_Leave (request_ID, reason, date_of_original_workday, emp_ID, replacement_emp)
    values (@request_ID, @reason, @date_of_original_workday, @employee_ID, @replacement_emp)
    
    set @hr_rep_role = 'HR_Representative_' + @dept_name
    
    select @hr_rep_ID = e.employee_ID
    from Employee e inner join Employee_Role er on e.employee_ID = er.emp_ID
    where er.role_name = @hr_rep_role
    
    if (@hr_rep_ID is not null)
      begin
        insert into Employee_Approve_Leave (Emp1_ID, Leave_ID, status)
        values (@hr_rep_ID, @request_ID, 'pending')
    end
end
go

create procedure Dean_andHR_Evaluation
    (@employee_ID int,@rating int,@comment varchar(50),@semester char(3))
as
begin
    declare @performance_ID int
    
    insert into Performance (rating, comments, semester, emp_ID)
    values (@rating, @comment, @semester, @employee_ID)
end


/*finished الحمد لله*/