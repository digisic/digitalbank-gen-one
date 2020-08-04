@ui @account @savings
Feature: Create Savings Account (UI)
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money


@negative
Scenario: NewAcctTestCase1-MoneyMarketAcctNotCreated-InsufficientBalance
  Given Cian is logged into the application with Cian95072@gmail.com
  And they attempt to open a new 'Savings Account'
  When Cian enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '1553' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Cian verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase2-MoneyMarketAcctNotCreated-InsufficientBalance
  Given Li is logged into the application with Li009609@gmail.com
  And they attempt to open a new 'Savings Account'
  When Li enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-95' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Li verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase3-MoneyMarketAcctCreated
  Given Nafisika is logged into the application with Nafisika0740@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nafisika enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Nafisika verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive @special
Scenario: NewAcctTestCase4-MoneyMarketAcctCreated
  Given Shukrani is logged into the application with Shukrani18756@gmail.com
  And they attempt to open a new 'Savings Account'
  When Shukrani enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3953' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Shukrani verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3953'

@positive
Scenario: NewAcctTestCase5-SavingsAcctCreated
  Given Deeptiman is logged into the application with Deeptiman269426@gmail.com
  And they attempt to open a new 'Savings Account'
  When Deeptiman enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Deeptiman verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase6-SavingsAcctCreated
  Given Chasity is logged into the application with Chasity547010@gmail.com
  And they attempt to open a new 'Savings Account'
  When Chasity enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '359' into the Savings Inital Deposit field
  And they click the Submit button
  Then Chasity verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '359'

@negative
Scenario: NewAcctTestCase7-SavingsAcctNotCreated-InsufficientBalance
  Given Abhayananda is logged into the application with Abhayananda8283@gmail.com
  And they attempt to open a new 'Savings Account'
  When Abhayananda enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '2' into the Savings Inital Deposit field
  And they click the Submit button
  Then Abhayananda verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase8-SavingsAcctNotCreated-InsufficientBalance
  Given Zacharias is logged into the application with Zacharias4205@gmail.com
  And they attempt to open a new 'Savings Account'
  When Zacharias enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-14' into the Savings Inital Deposit field
  And they click the Submit button
  Then Zacharias verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase9-FormValidationFailure
  Given Sumait is logged into the application with Sumait17606@gmail.com
  And they attempt to open a new 'Savings Account'
  When Sumait enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Sumait verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase10-MoneyMarketAcctNotCreated-InsufficientBalance
  Given Amala is logged into the application with Amala475631@gmail.com
  And they attempt to open a new 'Savings Account'
  When Amala enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2168' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Amala verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase11-MoneyMarketAcctNotCreated-InsufficientBalance
  Given Shawnn is logged into the application with Shawnn991648@gmail.com
  And they attempt to open a new 'Savings Account'
  When Shawnn enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-98' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Shawnn verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase12-MoneyMarketAcctCreated
  Given Anastasios is logged into the application with Anastasios8364@gmail.com
  And they attempt to open a new 'Savings Account'
  When Anastasios enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Anastasios verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: NewAcctTestCase13-MoneyMarketAcctCreated
  Given Inerney is logged into the application with Inerney81239@gmail.com
  And they attempt to open a new 'Savings Account'
  When Inerney enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2752' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Inerney verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2752'

@positive
Scenario: NewAcctTestCase14-SavingsAcctCreated
  Given Jaishree is logged into the application with Jaishree156889@gmail.com
  And they attempt to open a new 'Savings Account'
  When Jaishree enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Jaishree verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase15-SavingsAcctCreated
  Given Karunashankar is logged into the application with Karunashankar299223@gmail.com
  And they attempt to open a new 'Savings Account'
  When Karunashankar enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '854' into the Savings Inital Deposit field
  And they click the Submit button
  Then Karunashankar verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '854'

@negative
Scenario: NewAcctTestCase16-SavingsAcctNotCreated-InsufficientBalance
  Given Monima is logged into the application with Monima449828@gmail.com
  And they attempt to open a new 'Savings Account'
  When Monima enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '19' into the Savings Inital Deposit field
  And they click the Submit button
  Then Monima verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase17-SavingsAcctNotCreated-InsufficientBalance
  Given Ghaniy is logged into the application with Ghaniy46455@gmail.com
  And they attempt to open a new 'Savings Account'
  When Ghaniy enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-31' into the Savings Inital Deposit field
  And they click the Submit button
  Then Ghaniy verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase18-FormValidationFailure
  Given Shauden is logged into the application with Shauden04483@gmail.com
  And they attempt to open a new 'Savings Account'
  When Shauden enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Shauden verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase19-FormValidationFailure
  Given Anora is logged into the application with Anora504843@gmail.com
  And they attempt to open a new 'Savings Account'
  When Anora enters 'AKP Savings' into the Account Name field
  And they select 'None Selected' from the Ownership radio button
  And they click the Submit button
  Then Anora verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase20-FormValidationFailure
  Given Yaakov is logged into the application with Yaakov1803@gmail.com
  And they attempt to open a new 'Savings Account'
  When Yaakov enters '' into the Account Name field
  And they click the Submit button
  Then Yaakov verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: NewAcctTestCase21-FormValidationFailure
  Given Naima is logged into the application with Naima051493@gmail.com
  And they attempt to open a new 'Savings Account'
  When Naima enters 'AKP Savings %($!(*)))' into the Account Name field
  And they click the Submit button
  Then Naima verifies the account coould not be created
  And they verify they are presented with a message indicating form validation error