USE [BaxtureAssignmentDB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateUserByID]    Script Date: 19-01-2024 20:10:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdateUserByID]
    @Id INT,
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @IsAdmin BIT,
    @Age INT,
    @Hobbies VARCHAR(50)
AS
BEGIN
    UPDATE Users
    SET
        Username = @Username,
        Password = @Password,
        IsAdmin = @IsAdmin,
        Age = @Age,
        Hobbies = @Hobbies
    WHERE
        Id = @Id
END
GO

