USE [BaxtureAssignmentDB]
GO

/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 19-01-2024 20:08:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[GetAllUsers]

as 

begin 
      SELECT * FROM Users
end
GO

