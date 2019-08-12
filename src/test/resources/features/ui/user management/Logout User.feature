@ui @user @security @logout
Feature: Logout User (UI)
  As a user logged into the application
  I want to logout
  so that my accounts remain secure


@positive
Scenario: Logout user and end the application session
  Given Swarup is logged into the application with Swarup919593@gmail.com
  When Swarup navigates to the User Profile menu
  And he or she selects 'Logout' from the User Profile menu
  Then Swarup verifies he or she is at the Login page
  And he or she verifies he or she is presented with a successful message indicating he or she is logged out of the application