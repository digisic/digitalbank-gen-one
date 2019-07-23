@ui, @savings
Feature: Create Savings Account
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money

 @negative
 Scenario: NewAcctTestCase1-MoneyMarketAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '334' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase2-MoneyMarketAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '-85' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @positive
 Scenario: NewAcctTestCase3-MoneyMarketAcctCreated
  Given a user is logged in to DigitalBank
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
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Money Market' for Account Type
   And enter '3768' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '3768'

 @positive
 Scenario: NewAcctTestCase5-SavingsAcctCreated
  Given a user is logged in to DigitalBank
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
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '711' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '711'

 @negative
 Scenario: NewAcctTestCase7-SavingsAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '20' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase8-SavingsAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'Savings' for Account Type
   And enter '-85' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase9-FormValidationFailure
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Individual' for Ownership
   And select 'None Selected' for Account Type
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase10-MoneyMarketAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '959' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase11-MoneyMarketAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '-23' as Money Market Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @positive
 Scenario: NewAcctTestCase12-MoneyMarketAcctCreated
  Given a user is logged in to DigitalBank
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
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Money Market' for Account Type
   And enter '3054' as Money Market Initial Deposit
   And then click Submit
  Then a 'Money Market Savings Account' should be created
   And the account balance should match the initial deposit of '3054'

 @positive
 Scenario: NewAcctTestCase14-SavingsAcctCreated
  Given a user is logged in to DigitalBank
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
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '293' as Savings Initial Deposit
   And then click Submit
  Then a 'Regular Savings Account' should be created
   And the account balance should match the initial deposit of '293'

 @negative
 Scenario: NewAcctTestCase16-SavingsAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '16' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase17-SavingsAcctNotCreated_InsufficientBalance
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'Savings' for Account Type
   And enter '-79' as Savings Initial Deposit
   And then click Submit
  Then the account should not be created
   And insufficient balance warning should be displayed

 @negative
 Scenario: NewAcctTestCase18-FormValidationFailure
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'Joint' for Ownership
   And select 'None Selected' for Account Type
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase19-FormValidationFailure
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings' as Account Name
   And select 'None Selected' for Ownership
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase20-FormValidationFailure
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter '' as Account Name
   And then click Submit
  Then the account should not be created
   And form validation error should appear

 @negative
 Scenario: NewAcctTestCase21-FormValidationFailure
  Given a user is logged in to DigitalBank
   And they attempt to open a new Savings Account
  When they enter 'AKP Savings *%$' as Account Name
   And then click Submit
  Then the account should not be created
   And form validation error should appear
