@ui 
Feature: Create Savings Account (UI)
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money


@negative
Scenario: NewAcctTestCase1-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Paris is logged into the application with Paris82775@gmail.com
  And they attempt to open a new 'Savings Account'
  When Paris enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '1276' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Paris verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase2-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Conor is logged into the application with Conor24098@gmail.com
  And they attempt to open a new 'Savings Account'
  When Conor enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-34' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Conor verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase3-MoneyMarketAcctCreated
  Given Siwazuri is logged into the application with Siwazuri6366@gmail.com
  And they attempt to open a new 'Savings Account'
  When Siwazuri enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Siwazuri verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: NewAcctTestCase4-MoneyMarketAcctCreated
  Given Esra is logged into the application with Esra459940@gmail.com
  And they attempt to open a new 'Savings Account'
  When Esra enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3654' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Esra verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3654'

@positive
Scenario: NewAcctTestCase5-SavingsAcctCreated
  Given Ganesh is logged into the application with Ganesh24471@gmail.com
  And they attempt to open a new 'Savings Account'
  When Ganesh enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Ganesh verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase6-SavingsAcctCreated
  Given Sudeshna is logged into the application with Sudeshna8786@gmail.com
  And they attempt to open a new 'Savings Account'
  When Sudeshna enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '581' into the Savings Inital Deposit field
  And they click the Submit button
  Then Sudeshna verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '581'

@negative
Scenario: NewAcctTestCase7-SavingsAcctNotCreated_InsufficientBalance
  Given Snehanshn is logged into the application with Snehanshn003744@gmail.com
  And they attempt to open a new 'Savings Account'
  When Snehanshn enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '12' into the Savings Inital Deposit field
  And they click the Submit button
  Then Snehanshn verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase8-SavingsAcctNotCreated_InsufficientBalance
  Given Timir is logged into the application with Timir596869@gmail.com
  And they attempt to open a new 'Savings Account'
  When Timir enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-95' into the Savings Inital Deposit field
  And they click the Submit button
  Then Timir verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase9-FormValidationFailure
  Given Nena is logged into the application with Nena56722@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nena enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Nena verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase10-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Dena is logged into the application with Dena513800@gmail.com
  And they attempt to open a new 'Savings Account'
  When Dena enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2392' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Dena verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase11-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Chapala is logged into the application with Chapala647947@gmail.com
  And they attempt to open a new 'Savings Account'
  When Chapala enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-97' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Chapala verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase12-MoneyMarketAcctCreated
  Given Mopsus is logged into the application with Mopsus35498@gmail.com
  And they attempt to open a new 'Savings Account'
  When Mopsus enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Mopsus verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: NewAcctTestCase13-MoneyMarketAcctCreated
  Given Persis is logged into the application with Persis5098@gmail.com
  And they attempt to open a new 'Savings Account'
  When Persis enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2685' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Persis verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2685'

@positive
Scenario: NewAcctTestCase14-SavingsAcctCreated
  Given Adla is logged into the application with Adla678265@gmail.com
  And they attempt to open a new 'Savings Account'
  When Adla enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Adla verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase15-SavingsAcctCreated
  Given Mtumwa is logged into the application with Mtumwa891307@gmail.com
  And they attempt to open a new 'Savings Account'
  When Mtumwa enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '938' into the Savings Inital Deposit field
  And they click the Submit button
  Then Mtumwa verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '938'

@negative
Scenario: NewAcctTestCase16-SavingsAcctNotCreated_InsufficientBalance
  Given Swetaketu is logged into the application with Swetaketu42054@gmail.com
  And they attempt to open a new 'Savings Account'
  When Swetaketu enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '16' into the Savings Inital Deposit field
  And they click the Submit button
  Then Swetaketu verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase17-SavingsAcctNotCreated_InsufficientBalance
  Given Fiorella is logged into the application with Fiorella519015@gmail.com
  And they attempt to open a new 'Savings Account'
  When Fiorella enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-28' into the Savings Inital Deposit field
  And they click the Submit button
  Then Fiorella verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase18-FormValidationFailure
  Given Nyokabi is logged into the application with Nyokabi35855@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nyokabi enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Nyokabi verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase19-FormValidationFailure
  Given Jurre is logged into the application with Jurre691583@gmail.com
  And they attempt to open a new 'Savings Account'
  When Jurre enters 'AKP Savings' into the Account Name field
  And they select 'None Selected' from the Ownership radio button
  And they click the Submit button
  Then Jurre verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase20-FormValidationFailure
  Given Darshan is logged into the application with Darshan838706@gmail.com
  And they attempt to open a new 'Savings Account'
  When Darshan enters '' into the Account Name field
  And they click the Submit button
  Then Darshan verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase21-FormValidationFailure
  Given Mtangulizi is logged into the application with Mtangulizi91732@gmail.com
  And they attempt to open a new 'Savings Account'
  When Mtangulizi enters 'AKP Savings ))$()$*' into the Account Name field
  And they click the Submit button
  Then Mtangulizi verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error