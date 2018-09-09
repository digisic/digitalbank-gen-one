-- User Role
insert into role (id, name) values (1, 'ROLE_USER');
insert into role (id, name) values (2, 'ROLE_ADMIN');
insert into role (id, name) values (3, 'ROLE_API');

-- User Profile
insert into user_profile (id,address,country,dob,dom,email_address,first_name,gender,home_phone,last_name,locality,mobile_phone,postal_code,region,ssn,title,work_phone) 
				  values (1,'123 Digital Lane','United States','1980-01-01','2016-02-15','jsmith@demo.io','Josh','M','123-456-7890','Smith','Internet City','123-456-7890','94302','CA','123-45-6789','Mr.','123-456-7890');

-- User (Password=Demo123!)
insert into user (id, account_not_expired, account_not_locked, credential_not_expired, enabled, password, username, profile_id) 
		  values (1,1,1,1,1,'$2a$10$ydVEy4fdZ1o0nhXktMUWtO8PvhYDHEhuh.V/Ti7PA0yJm1u/0QCC2','jsmith@demo.io',1);

-- Account Type
insert into account_type (id, code, name) values (1, 'SCK', 'Standard Checking');
insert into account_type (id, code, name) values (2, 'ICK', 'Interest Checking');
insert into account_type (id, code, name) values (3, 'SAV', 'Savings');
insert into account_type (id, code, name) values (4, 'LNS', 'Loan');
insert into account_type (id, code, name) values (5, 'MRG', 'Mortgage');
insert into account_type (id, code, name) values (6, 'MMA', 'Money Market');
insert into account_type (id, code, name) values (7, 'CDA', 'Certificate of Deposit');
insert into account_type (id, code, name) values (8, 'IRA', 'Individual Retirement');

-- Owner Type
insert into owner_type (id, code, name) values (1, 'IND', 'Individual');
insert into owner_type (id, code, name) values (2, 'JOW', 'Joint Owner');
insert into owner_type (id, code, name) values (3, 'JCO', 'Joint Co-Owner');

-- Account Standing
insert into account_standing (id, code, name) values (1, 'A1', 'Open');
insert into account_standing (id, code, name) values (2, 'A2', 'Paid');
insert into account_standing (id, code, name) values (3, 'A3', 'Closed');
insert into account_standing (id, code, name) values (4, 'A4', 'Inactive');
insert into account_standing (id, code, name) values (5, '21', 'Deceased');
insert into account_standing (id, code, name) values (6, '97', 'Charge Off');
insert into account_standing (id, code, name) values (7, '94', 'Foreclosed');
insert into account_standing (id, code, name) values (8, '78', 'Past Due 60 Days');
insert into account_standing (id, code, name) values (9, '80', 'Past Due 90 Days');
insert into account_standing (id, code, name) values (10, '82', 'Past Due 120 Days');
insert into account_standing (id, code, name) values (11, '94', 'Past Due 150+ Days');

-- Transaction Type
insert into transaction_type (id, code, name) values (1, 'ATM', 'ATM');
insert into transaction_type (id, code, name) values (2, 'DBT', 'Debit');
insert into transaction_type (id, code, name) values (3, 'CRG', 'Charge');
insert into transaction_type (id, code, name) values (4, 'CHK', 'Check');
insert into transaction_type (id, code, name) values (5, 'DPT', 'Deposit');
insert into transaction_type (id, code, name) values (6, 'POS', 'Point of Sale');
insert into transaction_type (id, code, name) values (7, 'TRN', 'Transfer');
insert into transaction_type (id, code, name) values (8, 'WTH', 'Withdrawl');
insert into transaction_type (id, code, name) values (9, 'INT', 'Interest Income');
insert into transaction_type (id, code, name) values (10, 'DIV', 'Dividend Credit');
insert into transaction_type (id, code, name) values (11, 'PMT', 'Payment');
insert into transaction_type (id, code, name) values (12, 'FEE', 'Fee');
insert into transaction_type (id, code, name) values (13, 'LTF', 'Late Fee');
insert into transaction_type (id, code, name) values (14, 'OVF', 'Overdraft Fee');
insert into transaction_type (id, code, name) values (15, 'CKF', 'Check Fee');
insert into transaction_type (id, code, name) values (16, 'TNF', 'Transfer Fee');
insert into transaction_type (id, code, name) values (17, 'DDP', 'Direct Deposit');
insert into transaction_type (id, code, name) values (18, 'EFT', 'Electronic Funds Transfer');
insert into transaction_type (id, code, name) values (19, 'RFD', 'Refund');


-- Transaction State
insert into transaction_state (id, code, name) values (1, 'ERR', 'Error');
insert into transaction_state (id, code, name) values (2, 'PND', 'Pending');
insert into transaction_state (id, code, name) values (3, 'COM', 'Complete');
insert into transaction_state (id, code, name) values (4, 'REV', 'Review');

