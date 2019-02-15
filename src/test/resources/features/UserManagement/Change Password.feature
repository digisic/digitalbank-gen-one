Feature: Change Password
  As an Authenticated User
  I want to change my password
  so that my accounts remain secure

     Current Password must be correct.
     New Password must meet the following format.
       - 8 or more characters
       - at least 1 number
       - at least 1 capital letter
       - at least 1 lower case letter
     New Password cannot be the same as the Current Password.
     Confirm Password must match New Password.



Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'EuwOCVWvCGmkkimDnZOc7' into the New Password field
  And I enter 'RFvlgwpxbLug98320' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'KUGAjjSEyeDLTWSRJH19' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'ZYQScUEJyhjTrYREd' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'sspbaoghgfuphkxjhnho80' into the New Password field
  And I enter 'sspbaoghgfuphkxjhnho80' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'GBSHLJOZNK149' into the New Password field
  And I enter 'nuNjCKWUyFW27' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'kt66' into the New Password field
  And I enter 'kt66' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'IKujKbGnicH63' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'xfapfOkjW34' into the Current Password field
  And I enter 'uSKPFlEbDgPQxXQs' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'MsyUTjRiGmegHBOck67568' into the Current Password field
  And I enter 'hokcbmyjcyvacp22' into the New Password field
  And I enter 'hokcbmyjcyvacp22' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'ssfLkuOYO39' into the Current Password field
  And I enter 'GGLYRBGAFDZANNHL5' into the New Password field
  And I enter 'nzPdvIYnmZOiGkvEDicw46229' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'fJBluasmtkkcpqm9974' into the Current Password field
  And I enter 'q915' into the New Password field
  And I enter 'q915' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'aJmgMpKhwlFQrU24530' into the Current Password field
  And I enter 'NYMmEQKSEWCVlTzzd121' into the New Password field
  And I enter 'eOaKagAepd50' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'TpEUNIozq88650' into the Current Password field
  And I enter 'BUTHlXREesMjriyyAII94' into the New Password field
  And I enter 'BUTHlXREesMjriyyAII94' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'HpuJmsUuQRthrs52' into the Current Password field
  And I enter 'StonFDoJqGrfXtBpOULw8174' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'eTICtdtGzIHApdMX13' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'QnGaVSKPbt213' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'smej2' into the New Password field
  And I enter 'smej2' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'NFKMFRBNRGKUOLYIOQT1' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'uGTQLrFvNduG' into the New Password field
  And I enter 'uGTQLrFvNduG' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'crcwwxnvqxyyhxhq8' into the New Password field
  And I enter 'crcwwxnvqxyyhxhq8' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'bTYlDxorbozSqCSd0' into the New Password field
  And I enter 'OOnrgjGSQNjbqk660' into the Confirm Password field
  And I click the Update Password button

  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'xpIHOTzLnqJMCOcv2' into the New Password field
  And I enter 'xpIHOTzLnqJMCOcv2' into the Confirm Password field
  And I click the Update Password button
  And I verify I am presented with a Success Message
  And I click the User Profile menu
  And I click the Logout menu option
  And I verify I am at the Login page
  And I verify I am presented with a Success Message
  And I am at the Login page
  And I enter 'testuser@demo.io' into the Username field
  And I enter 'xpIHOTzLnqJMCOcv2' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is not present
