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
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'lHuFqlGNwLbavGtnx37' into the New Password field
  And I enter 'fJSeUmRlqByBzFLhG81' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'llmXWUJfbkMAJaAF5473' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'mImqTEEhiIm' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'rxozddnp2' into the New Password field
  And I enter 'rxozddnp2' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'YZILHJFGXRSBCKBN5' into the New Password field
  And I enter 'uyYLNvKqeCqNQ7' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'jjf82' into the New Password field
  And I enter 'jjf82' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'movqiocwoOAdZ8' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'sMLbXflyJvejBg917' into the Current Password field
  And I enter 'kjwUZBEMtMqqGtAuXkq' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'UBnRaOOfG453' into the Current Password field
  And I enter 'ftmliqetkbyevstnk38' into the New Password field
  And I enter 'ftmliqetkbyevstnk38' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'hgXRnXJoahQHITqGJP927' into the Current Password field
  And I enter 'ZGQEDGSFPKHL206' into the New Password field
  And I enter 'dKjYCeNuUGNOmKFe934' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'RCfZcZTyuaUWNJlDPW28' into the Current Password field
  And I enter 'rx974' into the New Password field
  And I enter 'rx974' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'jTtEmJkzPhgHKNEbcRr727' into the Current Password field
  And I enter 'SbVlhIDljuGtLoQcG78' into the New Password field
  And I enter 'piTEzYlcNpvgPiGPc703' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'KvPmLTtE16964' into the Current Password field
  And I enter 'rDKoVSmMhaDS24309' into the New Password field
  And I enter 'rDKoVSmMhaDS24309' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'nUfzNKXQMOdAljpQwt3747' into the Current Password field
  And I enter 'ubpkobiw3737' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'hBAxOQUx9124' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'rMUmQYiWj1' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'k92' into the New Password field
  And I enter 'k92' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'FPCMQPZU80' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'jTKfyGphDdeYlA' into the New Password field
  And I enter 'jTKfyGphDdeYlA' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'gpyfighrghodit4' into the New Password field
  And I enter 'gpyfighrghodit4' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'dLdXmiBFekFyESVWa41058' into the New Password field
  And I enter 'suFioiPJwsTpnP5' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'dsUYechPYbYS74904' into the New Password field
  And I enter 'dsUYechPYbYS74904' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Success Message indicating a successful change password
