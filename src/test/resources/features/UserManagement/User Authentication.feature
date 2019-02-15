Feature: User Authentication
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts

Scenario: Authenticate user with Valid Username, Valid Password and Remember Me Selected
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present

Scenario: Authenticate user with Valid Username, Valid Password and Remember Me not Selected
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is not present

Scenario: Authenticate user with Valid Username, Invalid Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'YYBFHKmbcf324' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Valid Username, Empty Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter '' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Invalid Username, Valid Password
  And I am at the Login page
  And I enter 'awXb1qTysTEui@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Invalid Username, Invalid Password
  And I am at the Login page
  And I enter '9fGkJDgMqoOIG0V@demo.io' into the Username field
  And I enter 'yvGRcViRJdngnDGKjgc783' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Empty Username, Valid Password
  And I am at the Login page
  And I enter '' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Empty Username, Invalid Password
  And I am at the Login page
  And I enter '' into the Username field
  And I enter 'zGcNGZsWBywfMxHMoKv6' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message
