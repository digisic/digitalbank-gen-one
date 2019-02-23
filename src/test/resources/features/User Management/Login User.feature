Feature: Login User
  As a Registered User
  I want to authenticate into the application
  so I can manage my accounts

Scenario: Login user with Valid Username, Valid Password and Remember Me Selected
  Given I am a Registered User
  And I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me Cookie is present

Scenario: Login user with Valid Username, Valid Password and Remember Me not Selected
  Given I am a Registered User
  And I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me Cookie is not present

Scenario: Login user with Valid Username, Invalid Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'qHqLmcfjoSmmFW95' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Login user with Valid Username, Empty Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter '' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Login user with Invalid Username, Valid Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'PcBjr7YCTeGip@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Login user with Invalid Username, Invalid Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'oPj74JIY@demo.io' into the Username field
  And I enter 'xoSDxpfFQDhcDeUVyf1' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Login user with Empty Username, Valid Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'Empty Username' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message

Scenario: Login user with Empty Username, Invalid Password
  Given I am a Registered User
  And I am at the Login page
  When I enter 'Empty Username' into the Username field
  And I enter 'iULsAfVNfvxRneYdmKa9941' into the Password field
  And I click the Submit button
  Then I verify I am presented with a Error Message
