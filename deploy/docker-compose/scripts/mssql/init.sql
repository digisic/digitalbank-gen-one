IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'digitalbank')
BEGIN
	CREATE DATABASE digitalbank;
END
GO

IF NOT EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'digitalcredit')
BEGIN
	CREATE DATABASE digitalcredit;
END
GO

IF NOT EXISTS (SELECT NAME from master.dbo.syslogins WHERE NAME = N'digitaluser')
BEGIN
	CREATE LOGIN digitaluser WITH PASSWORD = N'Demo123!';
	USE [digitalbank];

	EXEC sp_changedbowner 'digitaluser';
	USE [digitalcredit];

	EXEC sp_changedbowner 'digitaluser';
END
GO