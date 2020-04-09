#!/bin/bash

echo ==========================================================================================
echo ==========================================================================================
echo ====                                                                                  ====
echo ==== Digital Bank MSSQL Server Database Setup                                         ====
echo ====                                                                                  ====
echo ==== Initializing Application Database and User will start in 90 seconds...           ====
echo ====                                                                                  ====
echo ==========================================================================================
echo ==========================================================================================

# wait for SQL Server to come up before create any new objects

sleep 90

echo ==========================================================================================
echo ==========================================================================================
echo ====                                                                                  ====
echo ==== Initializing Application Database and User                                       ====
echo ====                                                                                  ====

# run the init.sql script to create the databases and user

/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P Demo123! -i /usr/src/init.sql

echo ====                                                                                  ====
echo ====                                                                                  ====
echo ==== Initialization Complete!                                                         ====
echo ====                                                                                  ====
echo ==========================================================================================
echo ==========================================================================================
