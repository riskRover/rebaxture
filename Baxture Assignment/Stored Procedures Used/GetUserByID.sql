USE [BaxtureAssignmentDB]
GO

/****** Object:  StoredProcedure [dbo].[GetUserByID]    Script Date: 19-01-2024 20:08:51 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



create proc [dbo].[GetUserByID]

@Id int 

as 

begin 
     select * from Users where Id = @Id
end
GO

