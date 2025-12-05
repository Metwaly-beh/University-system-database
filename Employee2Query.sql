USE University_HR_ManagementSystem_Team_40;
GO

CREATE PROCEDURE ApplyAccidentalLeave
    @EmpID int,
    @StartDate date,
    @EndDate date
AS
BEGIN
    INSERT INTO Leave (start_date, end_date, date_of_request, final_approval_status)
    VALUES (@StartDate, @EndDate, GETDATE(), 'Pending');

    INSERT INTO Accidental_Leave (request_ID, emp_ID)
    VALUES (SCOPE_IDENTITY(), @EmpID);
END
GO

CREATE PROCEDURE ApplyMedicalLeave
    @EmpID int,
    @StartDate date,
    @EndDate date,
    @Type varchar(50) 
AS
BEGIN
    INSERT INTO Leave (start_date, end_date, date_of_request, final_approval_status)
    VALUES (@StartDate, @EndDate, GETDATE(), 'Pending');

    INSERT INTO Medical_Leave (request_ID, emp_ID, type, insurance_status)
    VALUES (SCOPE_IDENTITY(), @EmpID, @Type, 0); 
END
GO

CREATE PROCEDURE ApplyUnpaidLeave
    @EmpID int,
    @StartDate date,
    @EndDate date
AS
BEGIN
    INSERT INTO Leave (start_date, end_date, date_of_request, final_approval_status)
    VALUES (@StartDate, @EndDate, GETDATE(), 'Pending');

    INSERT INTO Unpaid_Leave (request_ID, Emp_ID)
    VALUES (SCOPE_IDENTITY(), @EmpID);
END
GO

CREATE PROCEDURE ApplyCompensationLeave
    @EmpID int,
    @Reason varchar(50),
    @OriginalWorkDate date
AS
BEGIN
    INSERT INTO Leave (start_date, end_date, date_of_request, final_approval_status)
    VALUES (@OriginalWorkDate, @OriginalWorkDate, GETDATE(), 'Pending');

    INSERT INTO Compensation_Leave (request_ID, emp_ID, reason, date_of_original_workday)
    VALUES (SCOPE_IDENTITY(), @EmpID, @Reason, @OriginalWorkDate);
END
GO

CREATE PROCEDURE ApproveRejectLeave
    @AdminID int,        
    @LeaveID int,        
    @Status varchar(50)  
AS
BEGIN
    IF EXISTS (
        SELECT 1 FROM Employee_Role ER 
        WHERE ER.emp_ID = @AdminID 
        AND ER.role_name IN ('Dean', 'Vice Dean', 'President')
    )
    BEGIN
        UPDATE Leave
        SET final_approval_status = @Status
        WHERE request_ID = @LeaveID;

        INSERT INTO Employee_Approve_Leave (Emp1_ID, leave_ID, status)
        VALUES (@AdminID, @LeaveID, @Status);
    END
END
GO

CREATE PROCEDURE EvaluateEmployee
    @DeanID int,
    @TargetEmpID int,
    @Rating int,
    @Comment varchar(50),
    @Semester char(3)
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Employee_Role WHERE emp_ID = @DeanID AND role_name = 'Dean')
    BEGIN
        DECLARE @DeanDept varchar(50)
        DECLARE @TargetDept varchar(50)
        
        SELECT @DeanDept = dept_name FROM Employee WHERE employee_id = @DeanID;
        SELECT @TargetDept = dept_name FROM Employee WHERE employee_id = @TargetEmpID;
        
        IF (@DeanDept = @TargetDept)
        BEGIN
            INSERT INTO Performance (rating, comments, semester, emp_ID)
            VALUES (@Rating, @Comment, @Semester, @TargetEmpID);
        END
    END
END
