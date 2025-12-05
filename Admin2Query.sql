CREATE TABLE Official_Holiday (
    holiday_ID int IDENTITY(1,1) PRIMARY KEY,
    date date NOT NULL,
    name varchar(50)
)
GO

CREATE Or Alter PROC FetchYesterdayAttendance
AS
SELECT *
FROM Attendance
WHERE date = DATEADD(day, -1, CAST(GETDATE() AS date))
GO

CREATE  Or Alter PROC FetchWinterPerformance
AS
SELECT *
FROM Performance
WHERE semester = 'Win'
GO

CREATE Or Alter  PROC RemoveHolidayAttendance
AS
DELETE Attendance
FROM Attendance
INNER JOIN Official_Holiday ON Attendance.date = Official_Holiday.date
GO

CREATE  Or Alter PROC RemoveUnattendedDayOff
@id int
AS
DELETE FROM Attendance
WHERE emp_ID = @id AND status = 'Absent'
GO

CREATE Or Alter  PROC RemoveApprovedLeavesFromAttendance
AS
DELETE Attendance
FROM Attendance
INNER JOIN Annual_Leave AL ON Attendance.emp_ID = AL.emp_ID
INNER JOIN Leave L ON AL.request_ID = L.request_ID
WHERE Attendance.date BETWEEN L.start_date AND L.end_date
AND L.final_approval_status = 'Approved';

DELETE Attendance
FROM Attendance
INNER JOIN Accidental_Leave ACL ON Attendance.emp_ID = ACL.emp_ID
INNER JOIN Leave L ON ACL.request_ID = L.request_ID
WHERE Attendance.date BETWEEN L.start_date AND L.end_date
AND L.final_approval_status = 'Approved';

DELETE Attendance
FROM Attendance
INNER JOIN Medical_Leave ML ON Attendance.emp_ID = ML.emp_ID
INNER JOIN Leave L ON ML.request_ID = L.request_ID
WHERE Attendance.date BETWEEN L.start_date AND L.end_date
AND L.final_approval_status = 'Approved';

DELETE Attendance
FROM Attendance
INNER JOIN Unpaid_Leave UL ON Attendance.emp_ID = UL.emp_ID
INNER JOIN Leave L ON UL.request_ID = L.request_ID
WHERE Attendance.date BETWEEN L.start_date AND L.end_date
AND L.final_approval_status = 'Approved';

DELETE Attendance
FROM Attendance
INNER JOIN Compensation_Leave CL ON Attendance.emp_ID = CL.emp_ID
INNER JOIN Leave L ON CL.request_ID = L.request_ID
WHERE Attendance.date BETWEEN L.start_date AND L.end_date
AND L.final_approval_status = 'Approved';
GO

CREATE  Or Alter PROC ReplaceEmployee
@old int,
@new int
AS
UPDATE Attendance SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Annual_Leave SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Accidental_Leave SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Medical_Leave SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Unpaid_Leave SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Compensation_Leave SET emp_ID = @new WHERE emp_ID = @old;
UPDATE Performance SET emp_ID = @new WHERE emp_ID = @old;
GO

CREATE  Or Alter PROC UpdateEmploymentStatusDaily
AS
UPDATE Employee
SET employment_status = 
CASE
    WHEN employee_id IN (
        SELECT AL.emp_ID FROM Annual_Leave AL
        INNER JOIN Leave L ON AL.request_ID = L.request_ID
        WHERE L.final_approval_status = 'Approved'
        AND L.start_date <= CAST(GETDATE() AS date)
        AND L.end_date >= CAST(GETDATE() AS date)
        
        UNION
        
        SELECT ACL.emp_ID FROM Accidental_Leave ACL
        INNER JOIN Leave L ON ACL.request_ID = L.request_ID
        WHERE L.final_approval_status = 'Approved'
        AND L.start_date <= CAST(GETDATE() AS date)
        AND L.end_date >= CAST(GETDATE() AS date)
        
        UNION
        
        SELECT ML.emp_ID FROM Medical_Leave ML
        INNER JOIN Leave L ON ML.request_ID = L.request_ID
        WHERE L.final_approval_status = 'Approved'
        AND L.start_date <= CAST(GETDATE() AS date)
        AND L.end_date >= CAST(GETDATE() AS date)
        
        UNION
        
        SELECT UL.emp_ID FROM Unpaid_Leave UL
        INNER JOIN Leave L ON UL.request_ID = L.request_ID
        WHERE L.final_approval_status = 'Approved'
        AND L.start_date <= CAST(GETDATE() AS date)
        AND L.end_date >= CAST(GETDATE() AS date)
        
        UNION
        
        SELECT CL.emp_ID FROM Compensation_Leave CL
        INNER JOIN Leave L ON CL.request_ID = L.request_ID
        WHERE L.final_approval_status = 'Approved'
        AND L.start_date <= CAST(GETDATE() AS date)
        AND L.end_date >= CAST(GETDATE() AS date)
    )
    THEN 'onleave'
    ELSE 'active'
END
GO