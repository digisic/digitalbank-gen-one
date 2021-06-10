@ui @user @security @logout
Feature: Logout User (UI)
  As a user logged into the application
  I want to logout
  so that my accounts remain secure


@positive
Scenario: Logout user and end the application session
  Given Keanu is logged into the application with Keanu05681@gmail.com
  When Keanu navigates to the User Profile menu
  And they select 'Logout' from the User Profile menu
  Then Keanu verifies they are at the Login page
  And they verify they are presented with a successful message indicating he or she is logged out of the application