USE [BaxtureAssignmentDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertUser]    Script Date: 19-01-2024 20:09:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[InsertUser]

@Id int ,
@Username varchar(50),
@Password varchar(50) ,
@IsAdmin bit ,
@Age int ,
@Hobbies varchar(50) 

as 

begin 
    insert into Users (Id  , Username , Password, IsAdmin , Age , Hobbies)
	values (@Id  , @Username , @Password, @IsAdmin , @Age , @Hobbies)
end
GO

