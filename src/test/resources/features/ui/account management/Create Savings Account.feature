@ui 
Feature: Create Savings Account (UI)
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money


@negative
Scenario: NewAcctTestCase1-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Wajid is logged into the application with Wajid180982@gmail.com
  And they attempt to open a new 'Savings Account'
  When Wajid enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '165' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Wajid verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase2-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Isabela is logged into the application with Isabela36114@gmail.com
  And they attempt to open a new 'Savings Account'
  When Isabela enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-61' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Isabela verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase3-MoneyMarketAcctCreated
  Given Draco is logged into the application with Draco9700@gmail.com
  And they attempt to open a new 'Savings Account'
  When Draco enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Draco verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: NewAcctTestCase4-MoneyMarketAcctCreated
  Given Janetta is logged into the application with Janetta453351@gmail.com
  And they attempt to open a new 'Savings Account'
  When Janetta enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3269' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Janetta verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3269'

@positive
Scenario: NewAcctTestCase5-SavingsAcctCreated
  Given Runako is logged into the application with Runako6217@gmail.com
  And they attempt to open a new 'Savings Account'
  When Runako enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Runako verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase6-SavingsAcctCreated
  Given Kasey is logged into the application with Kasey358326@gmail.com
  And they attempt to open a new 'Savings Account'
  When Kasey enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '233' into the Savings Inital Deposit field
  And they click the Submit button
  Then Kasey verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '233'

@negative
Scenario: NewAcctTestCase7-SavingsAcctNotCreated_InsufficientBalance
  Given Priapus is logged into the application with Priapus139107@gmail.com
  And they attempt to open a new 'Savings Account'
  When Priapus enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '11' into the Savings Inital Deposit field
  And they click the Submit button
  Then Priapus verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase8-SavingsAcctNotCreated_InsufficientBalance
  Given Maryann is logged into the application with Maryann821798@gmail.com
  And they attempt to open a new 'Savings Account'
  When Maryann enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-52' into the Savings Inital Deposit field
  And they click the Submit button
  Then Maryann verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase9-FormValidationFailure
  Given Denzel is logged into the application with Denzel4001@gmail.com
  And they attempt to open a new 'Savings Account'
  When Denzel enters 'AKP Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Denzel verifies the account coould not be created
  And they verify they are presented with a a message inidicating form validation error

@negative
Scenario: NewAcctTestCase10-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Damaris is logged into the application with Damaris215179@gmail.com
  And they attempt to open a new 'Savings Account'
  When Damaris enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '438' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Damaris verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase11-MoneyMarketAcctNotCreated_InsufficientBalance
  Given Hannibal is logged into the application with Hannibal1860@gmail.com
  And they attempt to open a new 'Savings Account'
  When Hannibal enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-2' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Hannibal verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@positive
Scenario: NewAcctTestCase12-MoneyMarketAcctCreated
  Given Nuri is logged into the application with Nuri487217@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nuri enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Nuri verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: NewAcctTestCase13-MoneyMarketAcctCreated
  Given Yarkona is logged into the application with Yarkona15095@gmail.com
  And they attempt to open a new 'Savings Account'
  When Yarkona enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3218' into the Money Market Inital Deposit field
  And they click the Submit button
  Then Yarkona verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3218'

@positive
Scenario: NewAcctTestCase14-SavingsAcctCreated
  Given Evelina is logged into the application with Evelina062710@gmail.com
  And they attempt to open a new 'Savings Account'
  When Evelina enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Inital Deposit field
  And they click the Submit button
  Then Evelina verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: NewAcctTestCase15-SavingsAcctCreated
  Given Algrenon is logged into the application with Algrenon06749@gmail.com
  And they attempt to open a new 'Savings Account'
  When Algrenon enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '558' into the Savings Inital Deposit field
  And they click the Submit button
  Then Algrenon verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '558'

@negative
Scenario: NewAcctTestCase16-SavingsAcctNotCreated_InsufficientBalance
  Given Avigdor is logged into the application with Avigdor4163@gmail.com
  And they attempt to open a new 'Savings Account'
  When Avigdor enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '7' into the Savings Inital Deposit field
  And they click the Submit button
  Then Avigdor verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase17-SavingsAcctNotCreated_InsufficientBalance
  Given Neola is logged into the application with Neola0518@gmail.com
  And they attempt to open a new 'Savings Account'
  When Neola enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-41' into the Savings Inital Deposit field
  And they click the Submit button
  Then Neola verifies the account coould not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: NewAcctTestCase18-FormValidationFailure
  Given Donisha is logged into the application with Donisha614513@gmail.com
  And they attempt to open a new 'Savings Account'
  When Donisha enters 'AKP Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Donisha verifies the account coould not be created
  And they verify they are presented with a a message inidicating form validation error

@negative
Scenario: NewAcctTestCase19-FormValidationFailure
  Given Sinai is logged into the application with Sinai595892@gmail.com
  And they attempt to open a new 'Savings Account'
  When Sinai enters 'AKP Savings' into the Account Name field
  And they select 'None Selected' from the Ownership radio button
  And they click the Submit button
  Then Sinai verifies the account coould not be created
  And they verify they are presented with a a message inidicating form validation error

@negative
Scenario: NewAcctTestCase20-FormValidationFailure
  Given Laurel is logged into the application with Laurel470930@gmail.com
  And they attempt to open a new 'Savings Account'
  When Laurel enters '' into the Account Name field
  And they click the Submit button
  Then Laurel verifies the account coould not be created
  And they verify they are presented with a a message inidicating form validation error

@negative
Scenario: NewAcctTestCase21-FormValidationFailure
  Given Mukula is logged into the application with Mukula8707@gmail.com
  And they attempt to open a new 'Savings Account'
  When Mukula enters 'AKP Savings $()(!!!(*$' into the Account Name field
  And they click the Submit button
  Then Mukula verifies the account coould not be created
  And they verify they are presented with a a message inidicating form validation error