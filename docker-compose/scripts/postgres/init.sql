CREATE USER digitaluser WITH PASSWORD 'Demo123!';
CREATE DATABASE digitalbank;
CREATE DATABASE digitalcredit;
GRANT ALL PRIVILEGES ON DATABASE digitalbank TO digitaluser;
GRANT ALL PRIVILEGES ON DATABASE digitalcredit TO digitaluser;