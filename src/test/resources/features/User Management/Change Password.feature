@ui, @user, @security
Feature: Change Password
  As a logged in user
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
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'BlFxryrdGF933' into the change password New Password field
  And he or she enters 'wUNFVYGGDIgnNELbx88392' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'hpTBsiTqv9597' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'AnplGnHxWKLxIwoHNH' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'dzqmmwygzifdxktc985' into the change password New Password field
  And he or she enters 'dzqmmwygzifdxktc985' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'SGSFYFQCWQDOJDP51' into the change password New Password field
  And he or she enters 'jIUpXXmSffy42334' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'uhm039' into the change password New Password field
  And he or she enters 'uhm039' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'EXRxJtmGalFy1' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'KNfPLJsWylPVdyLdtu4388' into the change password Current Password field
  And he or she enters 'hpddUmVwc' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'yWMfVilPFTfJ14' into the change password Current Password field
  And he or she enters 'jgmwzwet8861' into the change password New Password field
  And he or she enters 'jgmwzwet8861' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'MvhsEqsaqsDAUsjYmMP48' into the change password Current Password field
  And he or she enters 'VWCNHBYFK8108' into the change password New Password field
  And he or she enters 'ebooxuFw33' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'IffClatLVYs1' into the change password Current Password field
  And he or she enters 'ch7' into the change password New Password field
  And he or she enters 'ch7' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'WodHonDRQGuiY25' into the change password Current Password field
  And he or she enters 'oTpjbATaHjOcHyvrjZ5606' into the change password New Password field
  And he or she enters 'bzBXtpfTOZnOo06029' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'AmgQhtcDwOygVPhnY1' into the change password Current Password field
  And he or she enters 'KsfpAhbaMxajhNPzRQPd1' into the change password New Password field
  And he or she enters 'KsfpAhbaMxajhNPzRQPd1' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is not correct


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'YwOfhLLGeoLyrRNJkyx13535' into the change password Current Password field
  And he or she enters 'ILErgCqEnOWgwfI729' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'yHKUMbEUj7808' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password is the same as the Current Password


Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'FcxFZIOoqlEkD7' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'd278' into the change password New Password field
  And he or she enters 'd278' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'GDPGQYSGUPVEZZ2' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'UBtwqJQj' into the change password New Password field
  And he or she enters 'UBtwqJQj' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'oyiujlppcan2' into the change password New Password field
  And he or she enters 'oyiujlppcan2' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'hqUEiHeBYypTPK47060' into the change password New Password field
  And he or she enters 'wJIADhoHgLDZxwVEX2755' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'TlaKMcasq3' into the change password New Password field
  And he or she enters 'TlaKMcasq3' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Success Message indicating a successful change password