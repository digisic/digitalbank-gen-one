@ui @user @security @login
Feature: Login User (UI)
  As a registered user
  I want to authenticate into the application
  so I can manage my accounts


@negative
Scenario: Login user with valid username, invalid password
  Given Dhwani is a registered user with email address Dhwani12398@gmail.com
  When Dhwani navigates to the Login page
  And he or she enters 'Dhwani79245@gmail.com' into the login Username field
  And he or she enters 'owltDoTNCdNVfhNpu7' into the login Password field
  And he or she submits the login request
  Then Dhwani verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, empty password
  Given Neta is a registered user with email address Neta44889@gmail.com
  When Neta navigates to the Login page
  And he or she enters 'Neta9780@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Neta verifies he or she is presented with a error message indicating invalid credentials or access denied

@positive
Scenario: Login user with valid username, valid password, remember me selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Kadmus is a registered user with email address Kadmus391781@gmail.com
  When Kadmus navigates to the Login page
  And he or she enters 'Kadmus091037@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she clicks the Remember Me checkbox
  And he or she submits the login request
  Then Kadmus verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is present

@positive
Scenario: Login user with valid username, valid password, remember me not selected, account is enabled, account not expired, account not locked, credentials not expired
  Given Sadhvi is a registered user with email address Sadhvi12054@gmail.com
  When Sadhvi navigates to the Login page
  And he or she enters 'Sadhvi783087@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Sadhvi verifies he or she is at the Home page
  And he or she verifies the remember-me cookie is not present

@negative
Scenario: Login user with valid username, valid password, account is enabled, account not expired, account not locked, credentials expired
  Given Bailey is a registered user with email address Bailey6487@gmail.com
  And he or she has an account with expired credentials
  When Bailey navigates to the Login page
  And he or she enters 'Bailey6487@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Bailey verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is expired, account not locked
  Given Pavani is a registered user with email address Pavani78572@gmail.com
  And he or she has an expired account
  When Pavani navigates to the Login page
  And he or she enters 'Pavani78572@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Pavani verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is enabled, account is locked
  Given Cristy is a registered user with email address Cristy28702@gmail.com
  And he or she has a locked account
  When Cristy navigates to the Login page
  And he or she enters 'Cristy28702@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Cristy verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with valid username, valid password, account is disabled
  Given Nwabudike is a registered user with email address Nwabudike077764@gmail.com
  And he or she has a disabled account
  When Nwabudike navigates to the Login page
  And he or she enters 'Nwabudike077764@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Nwabudike verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, valid password
  Given Indukanta is a registered user with email address Indukanta566283@gmail.com
  When Indukanta navigates to the Login page
  And he or she enters 'LIndukanta566283@gmail.com' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Indukanta verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, invalid password
  Given Saadya is a registered user with email address Saadya589905@gmail.com
  When Saadya navigates to the Login page
  And he or she enters 'EnSaadya589905@gmail.com' into the login Username field
  And he or she enters 'RajzUDuEDO0329' into the login Password field
  And he or she submits the login request
  Then Saadya verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, valid password
  Given Ewa is a registered user with email address Ewa28887@gmail.com
  When Ewa navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'Demo123!' into the login Password field
  And he or she submits the login request
  Then Ewa verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, invalid password
  Given Jaliyah is a registered user with email address Jaliyah8087@gmail.com
  When Jaliyah navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters 'hKxDWhUxEyRAGGEnn6' into the login Password field
  And he or she submits the login request
  Then Jaliyah verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with invalid username, empty password
  Given Susan is a registered user with email address Susan0160@gmail.com
  When Susan navigates to the Login page
  And he or she enters 'GSusan0160@gmail.com' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Susan verifies he or she is presented with a error message indicating invalid credentials or access denied

@negative
Scenario: Login user with empty username, empty password
  Given Protesilaus is a registered user with email address Protesilaus692030@gmail.com
  When Protesilaus navigates to the Login page
  And he or she enters '' into the login Username field
  And he or she enters '' into the login Password field
  And he or she submits the login request
  Then Protesilaus verifies he or she is presented with a error message indicating invalid credentials or access denied