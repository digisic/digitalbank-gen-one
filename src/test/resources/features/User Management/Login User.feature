@ui, @user, @security, @login
Feature: Login User
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'KbiFFtfOXokj4645' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she clicks the Remember Me checkbox
  And he or she submits the login request
  Then Josh verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password, remember me not selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'jsmith@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, account is enabled, account not expired, account not locked, credentials expired
  Given Eddie is a registered user
  And he or she has an account with expired credentials
  When Eddie navigates to the Login page
  And he or she enters 'expiredPassword@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Eddie verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is expired, account not locked
  Given Emerson is a registered user
  And he or she has an expired account
  When Emerson navigates to the Login page
  And he or she enters 'expired@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Emerson verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is locked
  Given Everson is a registered user
  And he or she has a locked account
  When Everson navigates to the Login page
  And he or she enters 'locked@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Everson verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Emmit is a registered user
  And he or she has a disabled account
  When Emmit navigates to the Login page
  And he or she enters 'disabled@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Emmit verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters '2yXAtQ@demo.io' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters 'FxbWL@demo.io' into the login Username field
  And he or she enters 'wGDfsIDPA0555' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given Josh is a registered user
  When Josh navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'YmSRCgBloRqzxURLIs79' into the login Password field
  And he or she submits the login request
  Then Josh verifies he or she is presented with a error message indicating invalid credentials or access denied