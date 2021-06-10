@ui @account @savings
Feature: Create Savings Account (UI)
 As a DigitalBank user
 I want to create a new Savings Account
 So I can deposit and withdraw money


@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Money Market' and Deposit '0-2499' with result 'Account Not Created'
  Given Carleen is logged into the application with Carleen6231@gmail.com
  And they attempt to open a new 'Savings Account'
  When Carleen enters 'Figs Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '1807' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Carleen verifies the account could not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Money Market' and Deposit '&lt;0' with result 'Account Not Created'
  Given Busara is logged into the application with Busara4792@gmail.com
  And they attempt to open a new 'Savings Account'
  When Busara enters 'Nectarines Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-30' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Busara verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Money Market' and Deposit '2500' with result 'Money Market Account Created'
  Given Ducha is logged into the application with Ducha793045@gmail.com
  And they attempt to open a new 'Savings Account'
  When Ducha enters 'Tangerine Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Ducha verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Money Market' and Deposit '&gt;2500' with result 'Money Market Account Created'
  Given Kamalkali is logged into the application with Kamalkali45522@gmail.com
  And they attempt to open a new 'Savings Account'
  When Kamalkali enters 'Jujube Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3311' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Kamalkali verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3311'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Savings' and Deposit '25' with result 'Reg. Savings Account Created'
  Given Citiwala is logged into the application with Citiwala79985@gmail.com
  And they attempt to open a new 'Savings Account'
  When Citiwala enters 'Barberry Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Initial Deposit field
  And they click the Submit button
  Then Citiwala verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Savings' and Deposit '&gt;25' with result 'Reg. Savings Account Created'
  Given CamronCamshron is logged into the application with CamronCamshron879652@gmail.com
  And they attempt to open a new 'Savings Account'
  When CamronCamshron enters 'Mandarin Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '687' into the Savings Initial Deposit field
  And they click the Submit button
  Then CamronCamshron verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '687'

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Savings' and Deposit '0-24' with result 'Account Not Created'
  Given Izhar is logged into the application with Izhar202550@gmail.com
  And they attempt to open a new 'Savings Account'
  When Izhar enters 'Watermelon Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '19' into the Savings Initial Deposit field
  And they click the Submit button
  Then Izhar verifies the account could not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'Savings' and Deposit '&lt;0' with result 'Account Not Created'
  Given Keyur is logged into the application with Keyur2368@gmail.com
  And they attempt to open a new 'Savings Account'
  When Keyur enters 'Jujube Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-60' into the Savings Initial Deposit field
  And they click the Submit button
  Then Keyur verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Individual' and Type 'None Selected' and Deposit '' with result 'Account Not Created'
  Given Madaha is logged into the application with Madaha72830@gmail.com
  And they attempt to open a new 'Savings Account'
  When Madaha enters 'Key Lime Savings' into the Account Name field
  And they select 'Individual' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Madaha verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Money Market' and Deposit '0-2499' with result 'Account Not Created'
  Given Nureet is logged into the application with Nureet70644@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nureet enters 'Pineapple Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '411' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Nureet verifies the account could not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Money Market' and Deposit '&lt;0' with result 'Account Not Created'
  Given Phoebe is logged into the application with Phoebe81976@gmail.com
  And they attempt to open a new 'Savings Account'
  When Phoebe enters 'Custard Apple Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '-42' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Phoebe verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Money Market' and Deposit '2500' with result 'Money Market Account Created'
  Given Marcos is logged into the application with Marcos789361@gmail.com
  And they attempt to open a new 'Savings Account'
  When Marcos enters 'Raspberry Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '2500' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Marcos verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '2500'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Money Market' and Deposit '&gt;2500' with result 'Money Market Account Created'
  Given Frances is logged into the application with Frances323900@gmail.com
  And they attempt to open a new 'Savings Account'
  When Frances enters 'Barberry Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Money Market' from the Account Type radio button
  And they enter '3619' into the Money Market Initial Deposit field
  And they click the Submit button
  Then Frances verifies a 'Money Market Savings Account' should be created
  And they verify account balance should be '3619'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Savings' and Deposit '25' with result 'Reg. Savings Account Created'
  Given Evadne is logged into the application with Evadne2633@gmail.com
  And they attempt to open a new 'Savings Account'
  When Evadne enters 'Passion Fruit Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '25' into the Savings Initial Deposit field
  And they click the Submit button
  Then Evadne verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '25'

@positive
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Savings' and Deposit '&gt;25' with result 'Reg. Savings Account Created'
  Given Autolycus is logged into the application with Autolycus615233@gmail.com
  And they attempt to open a new 'Savings Account'
  When Autolycus enters 'Vanilla Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '439' into the Savings Initial Deposit field
  And they click the Submit button
  Then Autolycus verifies a 'Regular Savings Account' should be created
  And they verify account balance should be '439'

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Savings' and Deposit '0-24' with result 'Account Not Created'
  Given Kefira is logged into the application with Kefira7788@gmail.com
  And they attempt to open a new 'Savings Account'
  When Kefira enters 'Pawpaw Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '12' into the Savings Initial Deposit field
  And they click the Submit button
  Then Kefira verifies the account could not be created
  And they verify they are presented with a message indicating insufficient balance 

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'Savings' and Deposit '&lt;0' with result 'Account Not Created'
  Given Nurisha is logged into the application with Nurisha0309@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nurisha enters 'Blueberry Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'Savings' from the Account Type radio button
  And they enter '-77' into the Savings Initial Deposit field
  And they click the Submit button
  Then Nurisha verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'Joint' and Type 'None Selected' and Deposit '' with result 'Account Not Created'
  Given Tsoka is logged into the application with Tsoka36489@gmail.com
  And they attempt to open a new 'Savings Account'
  When Tsoka enters 'Orange Savings' into the Account Name field
  And they select 'Joint' from the Ownership radio button
  And they select 'None Selected' from the Account Type radio button
  And they click the Submit button
  Then Tsoka verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Valid' Name with Ownership 'None Selected' and Type '' and Deposit '' with result 'Account Not Created'
  Given Nicodemus is logged into the application with Nicodemus4858@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nicodemus enters 'Crabapple Savings' into the Account Name field
  And they select 'None Selected' from the Ownership radio button
  And they click the Submit button
  Then Nicodemus verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Empty' Name with Ownership '' and Type '' and Deposit '' with result 'Account Not Created'
  Given Nishant is logged into the application with Nishant190233@gmail.com
  And they attempt to open a new 'Savings Account'
  When Nishant enters '' into the Account Name field
  And they click the Submit button
  Then Nishant verifies the account could not be created
  And they verify they are presented with a message indicating form validation error

@negative
Scenario: New Savings Account with 'Invalid' Name with Ownership '' and Type '' and Deposit '' with result 'Account Not Created'
  Given Lipi is logged into the application with Lipi7131@gmail.com
  And they attempt to open a new 'Savings Account'
  When Lipi enters 'Rhubarb Savings ()($' into the Account Name field
  And they click the Submit button
  Then Lipi verifies the account could not be created
  And they verify they are presented with a message indicating form validation error