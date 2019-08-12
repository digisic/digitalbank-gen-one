@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Seretse is a registered user with email address Seretse81345@gmail.com
  When Seretse navigates to the Login page
  And he or she enters 'Seretse81345@gmail.com' into the login Username field
  And he or she enters 'QfGQQwZjvzaxXTVu83314' into the login Password field
  And he or she submits the login request
  Then Seretse verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Kirsten is a registered user with email address Kirsten068813@gmail.com
  When Kirsten navigates to the Login page
  And he or she enters 'Kirsten068813@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Kirsten verifies he or she is presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected
  Given Mettabel is a registered user with email address Mettabel4281@gmail.com
  When Mettabel navigates to the Login page
  And he or she enters 'Mettabel4281@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she clicks the Remember Me checkbox
  And he or she submits the login request
  Then Mettabel verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password
  Given Shanae is a registered user with email address Shanae6720@gmail.com
  When Shanae navigates to the Login page
  And he or she enters 'Shanae6720@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Shanae verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, credentials expired
  Given Barnali is a registered user with email address Barnali051844@gmail.com
  And he or she has an account with expired credentials
  When Barnali navigates to the Login page
  And he or she enters 'Barnali051844@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Barnali verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is expired
  Given Suvarnmala is a registered user with email address Suvarnmala4525@gmail.com
  And he or she has an expired account
  When Suvarnmala navigates to the Login page
  And he or she enters 'Suvarnmala4525@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Suvarnmala verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is locked
  Given Elvie is a registered user with email address Elvie26191@gmail.com
  And he or she has a locked account
  When Elvie navigates to the Login page
  And he or she enters 'Elvie26191@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Elvie verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Phineus is a registered user with email address Phineus637363@gmail.com
  And he or she has a disabled account
  When Phineus navigates to the Login page
  And he or she enters 'Phineus637363@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Phineus verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Florian is a registered user with email address Florian756752@gmail.com
  When Florian navigates to the Login page
  And he or she enters 'TbsFlorian756752@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Florian verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Preston is a registered user with email address Preston8894@gmail.com
  When Preston navigates to the Login page
  And he or she enters 'FpnPreston8894@gmail.com' into the login Username field
  And he or she enters 'VMpRmtBYMgcawWmb57' into the login Password field
  And he or she submits the login request
  Then Preston verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, empty password
  Given Tovi is a registered user with email address Tovi8702@gmail.com
  When Tovi navigates to the Login page
  And he or she enters 'WTovi8702@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Tovi verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Ritu is a registered user with email address Ritu200052@gmail.com
  When Ritu navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Ritu verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given Jabali is a registered user with email address Jabali99480@gmail.com
  When Jabali navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'PnLjmtqDCyOcZBGKAsF3731' into the login Password field
  And he or she submits the login request
  Then Jabali verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, empty password
  Given Tumbo is a registered user with email address Tumbo30992@gmail.com
  When Tumbo navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Tumbo verifies he or she is presented with a error message indicating invalid credentials or access denied