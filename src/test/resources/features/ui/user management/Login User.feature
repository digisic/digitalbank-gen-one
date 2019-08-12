@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Vedette is a registered user with email address Vedette5429@gmail.com
  When Vedette navigates to the Login page
  And he or she enters 'Vedette5429@gmail.com' into the login Username field
  And he or she enters 'UiYfUzGCTz6' into the login Password field
  And he or she submits the login request
  Then Vedette verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Kesia is a registered user with email address Kesia0392@gmail.com
  When Kesia navigates to the Login page
  And he or she enters 'Kesia0392@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Kesia verifies he or she is presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Danielle is a registered user with email address Danielle390069@gmail.com
  When Danielle navigates to the Login page
  And he or she enters 'Danielle390069@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she clicks the Remember Me checkbox
  And he or she submits the login request
  Then Danielle verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password, remember me not selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Chaitan is a registered user with email address Chaitan802565@gmail.com
  When Chaitan navigates to the Login page
  And he or she enters 'Chaitan802565@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Chaitan verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, account is enabled, account not expired, account not locked, credentials expired
  Given Heather is a registered user with email address Heather173837@gmail.com
  And he or she has an account with expired credentials
  When Heather navigates to the Login page
  And he or she enters 'Heather173837@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Heather verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is expired, account not locked
  Given Pietr is a registered user with email address Pietr47560@gmail.com
  And he or she has an expired account
  When Pietr navigates to the Login page
  And he or she enters 'Pietr47560@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Pietr verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is locked
  Given Keturah is a registered user with email address Keturah126625@gmail.com
  And he or she has a locked account
  When Keturah navigates to the Login page
  And he or she enters 'Keturah126625@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Keturah verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Frederic is a registered user with email address Frederic77582@gmail.com
  And he or she has a disabled account
  When Frederic navigates to the Login page
  And he or she enters 'Frederic77582@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Frederic verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Kirinyaga is a registered user with email address Kirinyaga539395@gmail.com
  When Kirinyaga navigates to the Login page
  And he or she enters 'QaKirinyaga539395@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Kirinyaga verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Cheng is a registered user with email address Cheng181016@gmail.com
  When Cheng navigates to the Login page
  And he or she enters 'Cheng181016@gmail.com' into the login Username field
  And he or she enters 'OKQSCDoVvdHsXz61' into the login Password field
  And he or she submits the login request
  Then Cheng verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Galen is a registered user with email address Galen0236@gmail.com
  When Galen navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Galen verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given D'anton is a registered user with email address D'anton40034@gmail.com
  When D'anton navigates to the Login page
  And he or she enters 'D'anton40034@gmail.com' into the login Username field
  And he or she enters 'ImbfMBaPmhJnS94009' into the login Password field
  And he or she submits the login request
  Then D'anton verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, empty password
  Given Edana is a registered user with email address Edana6307@gmail.com
  When Edana navigates to the Login page
  And he or she enters 'Edana6307@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Edana verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, empty password
  Given Shameena is a registered user with email address Shameena94082@gmail.com
  When Shameena navigates to the Login page
  And he or she enters 'Shameena94082@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Shameena verifies he or she is presented with a error message indicating invalid credentials or access denied