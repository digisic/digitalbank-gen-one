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



Scenario: Change Password with conditions of Valid Current Password, New Password meeting all rules, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'EbKEpIstw1619' into the New Password field
  And I enter 'EbKEpIstw1619' into the Confirm Password field
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

Scenario: Change Password with conditions of Valid Current Password, New Password meeting all rules, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'xTHNJSEIAFwgSLSqdm85' into the New Password field
  And I enter 'crJgwHlPVAKLpXuyj9' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of Valid Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'qyASSMDcSNzuIewuFcqP' into the New Password field
  And I enter 'qyASSMDcSNzuIewuFcqP' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'AiJmmKtriGiBlgEJMK' into the New Password field
  And I enter 'XVXaxkCdevsosGRhXO6775' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'kgsbjuvcdojdph18' into the New Password field
  And I enter 'kgsbjuvcdojdph18' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'ttbwncqlosrkbzzfbkni7485' into the New Password field
  And I enter 'cTsjYEorb0939' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'PVWCTLGALWWX89073' into the New Password field
  And I enter 'PVWCTLGALWWX89073' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is not present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'RAZOBEHA170' into the New Password field
  And I enter 'cYffvhTkeh3' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Passworkd Less than 8 chacters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'b79' into the New Password field
  And I enter 'b79' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Passworkd Less than 8 chacters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'a56' into the New Password field
  And I enter 'sOimGYjDkiJ73903' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Valid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of Valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Valid Current Password' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'HqIAtzIU9726' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of Invalid Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'BQBFaituLDSlAlTg83487' into the Current Password field
  And I enter 'MhQBdwsgSFXQpxCVNM' into the New Password field
  And I enter 'MhQBdwsgSFXQpxCVNM' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'bJssFcrlwelHHkoddG01' into the Current Password field
  And I enter 'YVUBeayMi' into the New Password field
  And I enter 'VgFywoekHOPihPoTbXoS9806' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'IggVZqHtv01883' into the Current Password field
  And I enter 'hlcipiipuitzlgozvt4' into the New Password field
  And I enter 'hlcipiipuitzlgozvt4' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'yxpchhAcIeewQ6' into the Current Password field
  And I enter 'whhuhcsyerzvfznbeof344' into the New Password field
  And I enter 'IMGYVLMBHAsITrk622' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'fKGYpDURenEXyYCBw04' into the Current Password field
  And I enter 'ABXWNRAMGTEGAFVC43506' into the New Password field
  And I enter 'ABXWNRAMGTEGAFVC43506' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'FHpiLjGtZKXjoVU36652' into the Current Password field
  And I enter 'GHZNOQCGWCYBGN99960' into the New Password field
  And I enter 'cOkJvnAmUJ89463' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Passworkd Less than 8 chacters, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'JTPdCbmuV7' into the Current Password field
  And I enter 'mk956' into the New Password field
  And I enter 'mk956' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Passworkd Less than 8 chacters, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'wvDefItV40' into the Current Password field
  And I enter 'clz0' into the New Password field
  And I enter 'whQsPHRpBNXFF886' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Invalid Current Password, New Password meeting all rules, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'wGCXzPwhmpZNi4' into the Current Password field
  And I enter 'sNKuysms42521' into the New Password field
  And I enter 'pVYQvNeLIoDPrLmDlx21' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of Invalid Current Password, New Password meeting all rules, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'sqQGFgfZCcAiyGqsfxdM6238' into the Current Password field
  And I enter 'tbeXGUgyJ49' into the New Password field
  And I enter 'tbeXGUgyJ49' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of Invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'JRkHMjxJleRN755' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of Invalid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given I am at the Login page
  When I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  Then I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'IWrhpHEzeWwEGkVoKP502' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'HSFSHAYcVbb17785' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password
