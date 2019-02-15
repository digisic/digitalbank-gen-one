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



Scenario: User changes password using data values representing valid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'gIEVCYoJBZPOJWvVwc87' into the New Password field
  And I enter 'HIMefatONpSxZUVvuU9387' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: User changes password using data values representing valid Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'rYilfWNUtgUgHd' into the New Password field
  And I enter 'rYilfWNUtgUgHd' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'TkokgmUihszFP' into the New Password field
  And I enter 'zekeknrMXlDUgFPcQW8' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'normdjtstrjtgxveqjr28' into the New Password field
  And I enter 'normdjtstrjtgxveqjr28' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'cywpmiinqaimlnhbmh16291' into the New Password field
  And I enter 'tCxMUXRNHNMMDrR31' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'JONXKMBNKYLVOQXMVXIQ58015' into the New Password field
  And I enter 'JONXKMBNKYLVOQXMVXIQ58015' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is not present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'UXQRRQOV7728' into the New Password field
  And I enter 'CmKxXZymAcrxUCM3965' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'xt83' into the New Password field
  And I enter 'xt83' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password less than 8 characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'b7' into the New Password field
  And I enter 'tWMMfbfY34901' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing valid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: User changes password using data values representing valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'jHtXLLOB38541' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: User changes password using data values representing invalid Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'KBmHttIfwrThlfMvLE09' into the Current Password field
  And I enter 'IHwBCOBwyVZOy' into the New Password field
  And I enter 'IHwBCOBwyVZOy' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'INwTxVRMaqWrec21' into the Current Password field
  And I enter 'FmHcOQZV' into the New Password field
  And I enter 'McmbfjWZ773' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'edEWIGtZStDmklDJw378' into the Current Password field
  And I enter 'kgycldbsvfpifqy3931' into the New Password field
  And I enter 'kgycldbsvfpifqy3931' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'idkCEbvpkZqibZHeVM7' into the Current Password field
  And I enter 'qvllnesfa3391' into the New Password field
  And I enter 'NWTQfDwBEVvDFa66' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'LvDOVWtVqhjoIXHlJJ63' into the Current Password field
  And I enter 'HWWBCZVCYVQ17249' into the New Password field
  And I enter 'HWWBCZVCYVQ17249' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'eUMCQOnMzXrkt549' into the Current Password field
  And I enter 'ENXEELGXSUJFRUEKVB851' into the New Password field
  And I enter 'TbCSQWDkEMhw41' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'yGpuQyghcAEeinjyYnl85929' into the Current Password field
  And I enter 'd910' into the New Password field
  And I enter 'd910' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password less than 8 characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'ftgyLfkklsgXLUx2' into the Current Password field
  And I enter 'lc476' into the New Password field
  And I enter 'IxuHXjajsEmDlTE6' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: User changes password using data values representing invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'mFNAuDDJjBUDphAAZ09371' into the Current Password field
  And I enter 'KyTIChWWrUWQhQ888' into the New Password field
  And I enter 'kMsrDdgx8708' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: User changes password using data values representing invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'vUUlkyPhUxRZPjy2511' into the Current Password field
  And I enter 'SUztKxfTBMxoMqeusXt7699' into the New Password field
  And I enter 'SUztKxfTBMxoMqeusXt7699' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: User changes password using data values representing invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'tUSlWGhUdltEOtoJsUP1' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: User changes password using data values representing invalid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'YyQPUWEULvcoHlxS187' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'lnrXTWsDWBWQQn00' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: User changes password using data values representing valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'testuser@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'mttvcWoduTBcxaKbluqc4' into the New Password field
  And I enter 'mttvcWoduTBcxaKbluqc4' into the Confirm Password field
  And I click the Update Password button
  And I verify I am presented with a Success Message
  And I click the User Profile menu
  And I click the Logout menu option
  And I verify I am at the Login page
  And I verify I am presented with a Success Message
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is not present
