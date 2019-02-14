Feature: User Authentication
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts

Scenario: Authenticate user with Valid Username, Valid Password and Remember Me Selected
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present

Scenario: Authenticate user with Valid Username, Valid Password and Remember Me not Selected
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is not present

Scenario: Authenticate user with Valid Username, Invalid Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'NTmepGUfIMwMoPsc2' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Invalid Username, Valid Password
  Given I am at the Login page
  When I enter 'iuZDDh8@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Authenticate user with Invalid Username, Invalid Password
  Given I am at the Login page
  When I enter '6j4irFo@demo.io' into the Username field
  And I enter 'SVSgfKzuxRKQ36631' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message
