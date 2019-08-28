@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Mordecai is a registered user with email address Mordecai14627@gmail.com
  When Mordecai navigates to the Login page
  And they enter 'Mordecai14627@gmail.com' into the login Username field
  And they enter 'UmTSyTOEaEUcktcW1716' into the login Password field
  And they submit the login request
  Then Mordecai verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Sofronio is a registered user with email address Sofronio746752@gmail.com
  When Sofronio navigates to the Login page
  And they enter 'Sofronio746752@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Sofronio verifies they are presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected
  Given Eden is a registered user with email address Eden9353@gmail.com
  When Eden navigates to the Login page
  And they enter 'Eden9353@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they click the Remember Me checkbox
  And they submit the login request
  Then Eden verifies they are at the Home page
  And they verify the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password
  Given Kiambiroiro is a registered user with email address Kiambiroiro7411@gmail.com
  When Kiambiroiro navigates to the Login page
  And they enter 'Kiambiroiro7411@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Kiambiroiro verifies they are at the Home page
  And they verify the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, credentials expired
  Given Shachin is a registered user with email address Shachin01597@gmail.com
  And they have an account with expired credentials
  When Shachin navigates to the Login page
  And they enter 'Shachin01597@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Shachin verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is expired
  Given Dinesh is a registered user with email address Dinesh249427@gmail.com
  And they have an expired account
  When Dinesh navigates to the Login page
  And they enter 'Dinesh249427@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Dinesh verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is locked
  Given Cecilio is a registered user with email address Cecilio27889@gmail.com
  And they have a locked account
  When Cecilio navigates to the Login page
  And they enter 'Cecilio27889@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Cecilio verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Jaiden is a registered user with email address Jaiden6420@gmail.com
  And they have a disabled account
  When Jaiden navigates to the Login page
  And they enter 'Jaiden6420@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Jaiden verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Dallen is a registered user with email address Dallen1292@gmail.com
  When Dallen navigates to the Login page
  And they enter 'GDallen1292@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Dallen verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Vedmohan is a registered user with email address Vedmohan389249@gmail.com
  When Vedmohan navigates to the Login page
  And they enter 'KkqVedmohan389249@gmail.com' into the login Username field
  And they enter 'xWvSnIXxFEQ8' into the login Password field
  And they submit the login request
  Then Vedmohan verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, empty password
  Given Theodric is a registered user with email address Theodric235735@gmail.com
  When Theodric navigates to the Login page
  And they enter 'GjTheodric235735@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Theodric verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Prajit is a registered user with email address Prajit313971@gmail.com
  When Prajit navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Prajit verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given Vinesh is a registered user with email address Vinesh69109@gmail.com
  When Vinesh navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'jOgwgLhDaHeoLXk96947' into the login Password field
  And they submit the login request
  Then Vinesh verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, empty password
  Given Solomon is a registered user with email address Solomon32259@gmail.com
  When Solomon navigates to the Login page
  And they enter '' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Solomon verifies they are presented with a error message indicating invalid credentials or access denied