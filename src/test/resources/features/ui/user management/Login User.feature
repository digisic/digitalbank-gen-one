@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Dau is a registered user with email address Dau7009@gmail.com
  When Dau navigates to the Login page
  And they enter 'Dau7009@gmail.com' into the login Username field
  And they enter 'ZYGStNSsH922' into the login Password field
  And they submit the login request
  Then Dau verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with valid username, empty password
  Given Nalinaksha is a registered user with email address Nalinaksha18796@gmail.com
  When Nalinaksha navigates to the Login page
  And they enter 'Nalinaksha18796@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Nalinaksha verifies they are presented with a error message indicating invalid credentials or access denied


@positive
Scenario: Login user with valid username, valid password, remember me selected
  Given Munyiga is a registered user with email address Munyiga19371@gmail.com
  When Munyiga navigates to the Login page
  And they enter 'Munyiga19371@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they click the Remember Me checkbox
  And they submit the login request
  Then Munyiga verifies they are at the Home page
  And they verify the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password
  Given Nourbese is a registered user with email address Nourbese46196@gmail.com
  When Nourbese navigates to the Login page
  And they enter 'Nourbese46196@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Nourbese verifies they are at the Home page
  And they verify the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, credentials expired
  Given Angel is a registered user with email address Angel1496@gmail.com
  And they have an account with expired credentials
  When Angel navigates to the Login page
  And they enter 'Angel1496@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Angel verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with valid username, valid password, account is expired
  Given Ierne is a registered user with email address Ierne4219@gmail.com
  And they have an expired account
  When Ierne navigates to the Login page
  And they enter 'Ierne4219@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Ierne verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with valid username, valid password, account is locked
  Given Cameron is a registered user with email address Cameron57931@gmail.com
  And they have a locked account
  When Cameron navigates to the Login page
  And they enter 'Cameron57931@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Cameron verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Johnathan is a registered user with email address Johnathan873928@gmail.com
  And they have a disabled account
  When Johnathan navigates to the Login page
  And they enter 'Johnathan873928@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Johnathan verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with invalid username, valid password
  Given Fanish is a registered user with email address Fanish252290@gmail.com
  When Fanish navigates to the Login page
  And they enter 'MdFanish252290@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Fanish verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with invalid username, invalid password
  Given Kelal is a registered user with email address Kelal518648@gmail.com
  When Kelal navigates to the Login page
  And they enter 'BesKelal518648@gmail.com' into the login Username field
  And they enter 'UiacBCRVBPxQZ572' into the login Password field
  And they submit the login request
  Then Kelal verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with invalid username, empty password
  Given Nathen is a registered user with email address Nathen0615@gmail.com
  When Nathen navigates to the Login page
  And they enter 'HNathen0615@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Nathen verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with empty username, valid password
  Given Erysichthon is a registered user with email address Erysichthon3329@gmail.com
  When Erysichthon navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Erysichthon verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with empty username, invalid password
  Given Anatolio is a registered user with email address Anatolio35619@gmail.com
  When Anatolio navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'taFPzBULBMGOUNJv10687' into the login Password field
  And they submit the login request
  Then Anatolio verifies they are presented with a error message indicating invalid credentials or access denied


@negative
Scenario: Login user with empty username, empty password
  Given Aled is a registered user with email address Aled1969@gmail.com
  When Aled navigates to the Login page
  And they enter '' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Aled verifies they are presented with a error message indicating invalid credentials or access denied
