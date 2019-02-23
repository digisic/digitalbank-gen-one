Feature: Logout User
  As an Authenticated User
  I want to Logout of the application
  so that my accounts remain secure

Scenario: Logout Authenticated User and End Session
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Logout menu option
  Then I verify I am at the Login page
  And I verify I am presented with a Logout Success Message
