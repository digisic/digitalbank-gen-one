@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Siddheshwar is a registered user with email address Siddheshwar752490@gmail.com
  When Siddheshwar navigates to the Login page
  And they enter 'Siddheshwar752490@gmail.com' into the login Username field
  And they enter 'jUDaBpdwfjpHejvFghAb9' into the login Password field
  And they submit the login request
  Then Siddheshwar verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Caitie is a registered user with email address Caitie159728@gmail.com
  When Caitie navigates to the Login page
  And they enter 'Caitie159728@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Caitie verifies they are presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected
  Given Madilyn is a registered user with email address Madilyn148910@gmail.com
  When Madilyn navigates to the Login page
  And they enter 'Madilyn148910@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they click the Remember Me checkbox
  And they submit the login request
  Then Madilyn verifies they are at the Home page
  And they verify the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password
  Given Shrabana is a registered user with email address Shrabana68463@gmail.com
  When Shrabana navigates to the Login page
  And they enter 'Shrabana68463@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Shrabana verifies they are at the Home page
  And they verify the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, credentials expired
  Given Mailsi is a registered user with email address Mailsi1889@gmail.com
  And they have an account with expired credentials
  When Mailsi navigates to the Login page
  And they enter 'Mailsi1889@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Mailsi verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is expired
  Given Shravani is a registered user with email address Shravani9953@gmail.com
  And they have an expired account
  When Shravani navigates to the Login page
  And they enter 'Shravani9953@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Shravani verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is locked
  Given Chandra is a registered user with email address Chandra892544@gmail.com
  And they have a locked account
  When Chandra navigates to the Login page
  And they enter 'Chandra892544@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Chandra verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Anemone is a registered user with email address Anemone0236@gmail.com
  And they have a disabled account
  When Anemone navigates to the Login page
  And they enter 'Anemone0236@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Anemone verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Nolyn is a registered user with email address Nolyn6365@gmail.com
  When Nolyn navigates to the Login page
  And they enter 'DNolyn6365@gmail.com' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Nolyn verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Deeptikana is a registered user with email address Deeptikana61771@gmail.com
  When Deeptikana navigates to the Login page
  And they enter 'YeqDeeptikana61771@gmail.com' into the login Username field
  And they enter 'nuMjvRPT73' into the login Password field
  And they submit the login request
  Then Deeptikana verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, empty password
  Given Moselle is a registered user with email address Moselle870788@gmail.com
  When Moselle navigates to the Login page
  And they enter 'EhMoselle870788@gmail.com' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Moselle verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Karlitis is a registered user with email address Karlitis66116@gmail.com
  When Karlitis navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'Demo123!' into the login Password field
  And they submit the login request
  Then Karlitis verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given Marco is a registered user with email address Marco831245@gmail.com
  When Marco navigates to the Login page
  And they enter '' into the login Username field
  And they enter 'zThpgivpBrA041' into the login Password field
  And they submit the login request
  Then Marco verifies they are presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, empty password
  Given Krishna is a registered user with email address Krishna89230@gmail.com
  When Krishna navigates to the Login page
  And they enter '' into the login Username field
  And they enter '' into the login Password field
  And they submit the login request
  Then Krishna verifies they are presented with a error message indicating invalid credentials or access denied