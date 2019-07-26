@ui, @savings
Feature: Create Savings Account
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money

 @negative
 Scenario: NewAcctTestCase1-MoneyMarketAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '604' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase2-MoneyMarketAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '-34' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @positive
 Scenario: NewAcctTestCase3-MoneyMarketAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '2500' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '2500'

 @positive
 Scenario: NewAcctTestCase4-MoneyMarketAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '2546' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '2546'

 @positive
 Scenario: NewAcctTestCase5-SavingsAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '25' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '25'

 @positive
 Scenario: NewAcctTestCase6-SavingsAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '644' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '644'

 @negative
 Scenario: NewAcctTestCase7-SavingsAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '17' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase8-SavingsAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '-91' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase9-FormValidationFailure
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'None Selected' for Account Type
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase10-MoneyMarketAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '1917' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase11-MoneyMarketAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '-27' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @positive
 Scenario: NewAcctTestCase12-MoneyMarketAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '2500' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '2500'

 @positive
 Scenario: NewAcctTestCase13-MoneyMarketAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '2752' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '2752'

 @positive
 Scenario: NewAcctTestCase14-SavingsAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '25' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '25'

 @positive
 Scenario: NewAcctTestCase15-SavingsAcctCreated
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '955' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '955'

 @negative
 Scenario: NewAcctTestCase16-SavingsAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '8' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase17-SavingsAcctNotCreated_InsufficientBalance
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '-27' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase18-FormValidationFailure
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'None Selected' for Account Type
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase19-FormValidationFailure
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'None Selected' for Ownership
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase20-FormValidationFailure
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter '' as Account Name
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase21-FormValidationFailure
  Given 'Valid User' is logged into the application
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings %$*' as Account Name
   And then click Submit
  Then the account should not be created
   And form validation error should appear
