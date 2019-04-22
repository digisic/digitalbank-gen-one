@ui, @user, @security, @login
Feature: Login User
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@positive
Scenario: Login user with valid username, valid password and remember me selected
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she clicks the Remember Me checkbox
  And he or she submits the login request
  Then Josh verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password and remember me not selected
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is not present

@negative
Scenario: Login user with valid username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'RhbcvEdg99' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials

@negative
Scenario: Login user with valid username, empty password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials

@negative
Scenario: Login user with invalid username, valid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'lgSzw1MyXSdIYq7@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials

@negative
Scenario: Login user with invalid username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'et1K5@demo.io' into the login Username field
  And he or she enters 'EAVstsXBsLFu67633' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials

@negative
Scenario: Login user with empty username, valid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials

@negative
Scenario: Login user with empty username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'RGHApnaLYbbYEthUmxP639' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid login credentials