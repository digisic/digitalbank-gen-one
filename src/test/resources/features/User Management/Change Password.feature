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
  And I enter 'LgvsNgjNjHuOVl17' into the New Password field
  And I enter 'pvgtJBEUhxajWaoSMV79' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'fmuxlFitHw75' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'qxBKYxaRgoh' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'vvynbrad19' into the New Password field
  And I enter 'vvynbrad19' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'CNNPRUURFNYL51' into the New Password field
  And I enter 'DDZdCqkAYOeSfKpo8' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'h974' into the New Password field
  And I enter 'h974' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'ADrWKWjWjyk253' into the Confirm Password field
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
  And I enter 'VlqiTjltQz680' into the Current Password field
  And I enter 'NIhIaLqhrpzCSF' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'gAYuAWHEyuoCYNgriwdV13' into the Current Password field
  And I enter 'lrhcfsjnsv9' into the New Password field
  And I enter 'lrhcfsjnsv9' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'fwQRAXaLylRY15' into the Current Password field
  And I enter 'FTUZTEGBIWJSHQMICZ8' into the New Password field
  And I enter 'NyCmZHInYnDUay67518' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'pcWispfoP2520' into the Current Password field
  And I enter 'jqw274' into the New Password field
  And I enter 'jqw274' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'hwKbExyWeUwGTLXIfe8795' into the Current Password field
  And I enter 'SYQJtmqEEZ36543' into the New Password field
  And I enter 'zEzVmubzQ09723' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'NVlleuhLiPKGdQ12038' into the Current Password field
  And I enter 'gkkiTihoU8' into the New Password field
  And I enter 'gkkiTihoU8' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'XkLtUPTHOTqPrNDJfVX05138' into the Current Password field
  And I enter 'jzNYmThKkpngTqYXjW6' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'UaVlZkSRLBaY5888' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'eEIqUBzUltjYjcl64' into the Current Password field
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
  And I enter 'i42' into the New Password field
  And I enter 'i42' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'OAREUNPZANJVTHS45' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'PLoOCyQitgOLtKh' into the New Password field
  And I enter 'PLoOCyQitgOLtKh' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'otwseknq8' into the New Password field
  And I enter 'otwseknq8' into the Confirm Password field
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
  And I enter 'ZKZakxiPXLRAMWGtJNq305' into the New Password field
  And I enter 'DqmwbsbANxREaEBq0851' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am an Authenticated User
  And I am at the Home page
  When I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'LIaunVhta29' into the New Password field
  And I enter 'LIaunVhta29' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Success Message
