Feature: Logout User
  As an Authenticated User
  I want to logout of the application when I am done
  so that my accounts remain secure

Scenario: Logout Authenticated User with Remember Me not Selected
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is not present
  And I click the User Profile menu
  And I click the Logout menu option
  Then I verify I am at the Login page
  And I verify I am presented with a Success Message

Scenario: Logout Authenticated User with Remember Me Selected
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Logout menu option
  Then I verify I am at the Login page
  And I verify I am presented with a Success Message
