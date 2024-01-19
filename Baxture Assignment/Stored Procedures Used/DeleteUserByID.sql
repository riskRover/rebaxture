USE [BaxtureAssignmentDB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteUserByID]    Script Date: 19-01-2024 20:05:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteUserByID]
    @Id INT
AS
BEGIN
    Delete from Users
    WHERE Id = @Id
END
GO

