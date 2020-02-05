#!/bin/bash

# wait for SQL Server to come up
echo Initializing Databases will start in 20 seconds...
sleep 20
echo Initializing Databases

# run the init.sql script to create the databases
/opt/mssql-tools/bin/sqlcmd -S 0.0.0.0 -U sa -P Demo123! -i /usr/src/init.sql



