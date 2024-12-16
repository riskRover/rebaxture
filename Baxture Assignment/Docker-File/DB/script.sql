USE `BaxtureAssignmentDB`;
 
/* SQLINES DEMO *** le [dbo].[Users]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
-- SQLINES FOR EVALUATION USE ONLY (14 DAYS)
CREATE TABLE `Users`(
	`Id` int NULL,
	`Username` varchar(50) NULL,
	`Password` varchar(50) NULL,
	`IsAdmin` Tinyint NULL,
	`Age` int NULL,
	`Hobbies` nvarchar(50) NULL
);
/* SQLINES DEMO *** redProcedure [dbo].[DeleteUserByID]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
DELIMITER //

CREATE PROCEDURE `DeleteUserByID` (
    Id INT)
BEGIN
    Delete from Users
    WHERE Id = Id;
END;
//

DELIMITER ;


/* SQLINES DEMO *** redProcedure [dbo].[GetAllUsers]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 


delimiter //

create procedure `GetAllUsers`()


begin 
      SELECT * FROM Users;
end;
//

delimiter ;


/* SQLINES DEMO *** redProcedure [dbo].[GetUserByID]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 


delimiter //

create procedure `GetUserByID` (

Id int) 


begin 
     select * from Users where Id = Id;
end;
//

delimiter ;


/* SQLINES DEMO *** redProcedure [dbo].[InsertUser]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
delimiter //

create procedure `InsertUser` (

Id int ,
Username varchar(50),
Password varchar(50) ,
IsAdmin tinyint ,
Age int ,
Hobbies varchar(50)) 


begin 
    insert into Users (Id  , Username , Password, IsAdmin , Age , Hobbies)
	values (Id  , Username , Password, IsAdmin , Age , Hobbies);
end;
//

delimiter ;


/* SQLINES DEMO *** redProcedure [dbo].[UpdateUserByID]    Script Date: 11-12-2024 19:55:41 ******/
/* SET ANSI_NULLS ON */
 
/* SET QUOTED_IDENTIFIER ON */
 
DELIMITER //

CREATE PROCEDURE `UpdateUserByID` (
    Id INT,
    Username VARCHAR(50),
    Password VARCHAR(50),
    IsAdmin TINYINT,
    Age INT,
    Hobbies VARCHAR(50))
BEGIN
    UPDATE Users
    SET
        Username = Username,
        Password = Password,
        IsAdmin = IsAdmin,
        Age = Age,
        Hobbies = Hobbies
    WHERE
        Id = Id;
END;
//

DELIMITER ;


