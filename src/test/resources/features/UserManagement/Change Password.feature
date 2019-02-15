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
  And I enter 'aUAcebMiLKWUs44162' into the New Password field
  And I enter 'aUAcebMiLKWUs44162' into the Confirm Password field
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
  And I enter 'OERZRIpbSCmoCGUi45' into the New Password field
  And I enter 'QMiQlExV01083' into the Confirm Password field
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
  And I enter 'SXfEMJPhscAANlAuNIuw' into the New Password field
  And I enter 'SXfEMJPhscAANlAuNIuw' into the Confirm Password field
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
  And I enter 'WJpXywaskvfbWwxEnS' into the New Password field
  And I enter 'lmzxCboASgjNZCyU180' into the Confirm Password field
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
  And I enter 'xuwdovclmvdseruz4' into the New Password field
  And I enter 'xuwdovclmvdseruz4' into the Confirm Password field
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
  And I enter 'wlauvqbxfurafvui9371' into the New Password field
  And I enter 'mRJHTUJKfbzBkMlGe94' into the Confirm Password field
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
  And I enter 'QRNWRPIDJBGXHUZS528' into the New Password field
  And I enter 'QRNWRPIDJBGXHUZS528' into the Confirm Password field
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
  And I enter 'QKYYBFJSNWPTIDVRH24883' into the New Password field
  And I enter 'oqJvkOKCrIoeeCa150' into the Confirm Password field
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
  And I enter 'xuo44' into the New Password field
  And I enter 'xuo44' into the Confirm Password field
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
  And I enter 'ldtu03' into the New Password field
  And I enter 'tVFVfBSxnzSqogldyE7372' into the Confirm Password field
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
  And I enter 'QgjEZCvLGVKdnjFT425' into the Confirm Password field
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
  And I enter 'OVoovSWz415' into the Current Password field
  And I enter 'XWbtlqDUzDauKpIsJMEF' into the New Password field
  And I enter 'XWbtlqDUzDauKpIsJMEF' into the Confirm Password field
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
  And I enter 'JAGAJTKIwrHn124' into the Current Password field
  And I enter 'dJXoLkGhEUQcMaihGj' into the New Password field
  And I enter 'xFLQVaHjaxHKutXX6193' into the Confirm Password field
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
  And I enter 'ryYnOAjEYqeaKPOqkaA5' into the Current Password field
  And I enter 'dxhlrasxjhylqbzfu0809' into the New Password field
  And I enter 'dxhlrasxjhylqbzfu0809' into the Confirm Password field
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
  And I enter 'lVNkvTIUvxjdnIJjXCk28685' into the Current Password field
  And I enter 'jjwhjqxyosfgylb32051' into the New Password field
  And I enter 'clboqccwLgCBstRQX42' into the Confirm Password field
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
  And I enter 'rHreCUiTDymq60' into the Current Password field
  And I enter 'PQBVQSDIYLTYQIX1390' into the New Password field
  And I enter 'PQBVQSDIYLTYQIX1390' into the Confirm Password field
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
  And I enter 'ETHFCWJQebFlThqCxlD922' into the Current Password field
  And I enter 'VJSMGQDYCTUUPDTJ504' into the New Password field
  And I enter 'AfIdlJfTbZ9504' into the Confirm Password field
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
  And I enter 'PGCKxCNAwkC4' into the Current Password field
  And I enter 'wetg9' into the New Password field
  And I enter 'wetg9' into the Confirm Password field
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
  And I enter 'IBcsZKpDeAhkODRMj75248' into the Current Password field
  And I enter 'iqy314' into the New Password field
  And I enter 'cSVJednrHClsbDFS17663' into the Confirm Password field
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
  And I enter 'siSfFFsqKqKarAkW1475' into the Current Password field
  And I enter 'ehkKOndFl779' into the New Password field
  And I enter 'hkckoJqqBL2' into the Confirm Password field
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
  And I enter 'ptwoISvDTUQPZgqeNmD55' into the Current Password field
  And I enter 'NnqSvBwIsCSGe87697' into the New Password field
  And I enter 'NnqSvBwIsCSGe87697' into the Confirm Password field
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
  And I enter 'XTrwrDZB04' into the Current Password field
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
  And I enter 'fHVqtuyIz16' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'oqxsZZSSyHTnBxGqs5788' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password
