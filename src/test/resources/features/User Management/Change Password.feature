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
  And he or she enters 'mrBuZYAkxdnCCM5243' into the change password New Password field
  And he or she enters 'OBlunwXmwaCIVKwLp463' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'YPAILAPWqTEmELErKzAf33' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'pIEaOziSHOxX' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'jfidgqmevcpifnqqcb966' into the change password New Password field
  And he or she enters 'jfidgqmevcpifnqqcb966' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'DEKMNAEWWKYZEAROGE26789' into the change password New Password field
  And he or she enters 'bwyOVAyMRESVYLH590' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 's6' into the change password New Password field
  And he or she enters 's6' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'NndhYKftLWNEhesN90' into the change password Confirm Password field
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
  And he or she enters 'tWwZPKkDgMDncfZx851' into the change password Current Password field
  And he or she enters 'YJrxUFJyXAfOfCHK' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'lmxMODkjqJeuxvEZUEM17894' into the change password Current Password field
  And he or she enters 'xhcozbstbdzjctppw144' into the change password New Password field
  And he or she enters 'xhcozbstbdzjctppw144' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'WGaUOsSe21' into the change password Current Password field
  And he or she enters 'BADPCAKLCZOPJBYIEC20777' into the change password New Password field
  And he or she enters 'uYWGYjuqYjPEelXJ2218' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'osumyCtBHETt40008' into the change password Current Password field
  And he or she enters 'm2' into the change password New Password field
  And he or she enters 'm2' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'YNdaLyeIBvXwsdchm47504' into the change password Current Password field
  And he or she enters 'XAPpJCuXLvL4' into the change password New Password field
  And he or she enters 'acTyrjLS29' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'ZWtQetPShUWas8100' into the change password Current Password field
  And he or she enters 'WOPPwcZkfgExLPSi155' into the change password New Password field
  And he or she enters 'WOPPwcZkfgExLPSi155' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'nAqMQlOG78340' into the change password Current Password field
  And he or she enters 'qvhccaPRUGgrvpyh29' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'WKpzzhaktELf31' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'SLyZwawn183' into the change password Current Password field
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
  And he or she enters 'lcmf9' into the change password New Password field
  And he or she enters 'lcmf9' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'NMDJUTQRILIT0' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'aqTRqkfLkTcGtkU' into the change password New Password field
  And he or she enters 'aqTRqkfLkTcGtkU' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'aubdfjewnsyt3' into the change password New Password field
  And he or she enters 'aubdfjewnsyt3' into the change password Confirm Password field
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
  And he or she enters 'cgYeHXsvYfyDxHvFLG67546' into the change password New Password field
  And he or she enters 'NozStfIMrlJBOCQKMTo04642' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'LwlAtfskxbBXgjP4680' into the change password New Password field
  And he or she enters 'LwlAtfskxbBXgjP4680' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Success Message indicating a successful change password
