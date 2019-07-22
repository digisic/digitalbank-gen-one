@ui, @user, @security, @password
Feature: New Account
  As a logged in user
  I want to create a new account
  so that I can deposit/withdraw funds


@negative
Scenario: Open Checking Account
    Given a user is logged in to Online Banking
    When they attempt to open a new Checking Account
     And they provide sufficient initial balance of $200
     And they accept the account terms
     And they submit the application
    Then a new Checking Account should be created
     And the balance should be $200