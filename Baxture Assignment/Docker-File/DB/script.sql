CREATE DATABASE IF NOT EXISTS BaxtureAssignmentDB;
USE `BaxtureAssignmentDB`;
-- Create Users table
CREATE TABLE `Users`(
	`Id` int NULL,
	`Username` varchar(50) NULL,
	`Password` varchar(50) NULL,
	`IsAdmin` Tinyint NULL,
	`Age` int NULL,
	`Hobbies` nvarchar(50) NULL);
-- Script Date: 11-12-2024 19:55:41
-- Procedure to delete a user by ID
CREATE PROCEDURE `DeleteUserByID` (
    Id INT)
BEGIN
    Delete from Users
    WHERE Id = Id;
END;
-- Script Date: 11-12-2024 19:55:41
-- Procedure to get all users
create procedure `GetAllUsers`()
begin 
      SELECT * FROM Users;
end;
-- Script Date: 11-12-2024 19:55:41
-- Procedure to get a user by ID
create procedure `GetUserByID` (Id int)
begin 
     select * from Users where Id = Id;
end;
-- Script Date: 11-12-2024 19:55:41
-- Procedure to insert a user
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
-- Script Date: 11-12-2024 19:55:41
-- Procedure to update a user by ID
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
