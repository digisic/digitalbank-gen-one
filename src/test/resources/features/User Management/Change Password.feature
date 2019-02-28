@ui, @user, @security, @password
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
  And he or she enters 'xAxGXLbnksBhqaD59' into the change password New Password field
  And he or she enters 'QTgHiEecGiUbSltCmODK60' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'peFhouTUdBYBr6161' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'XbKRFnIDUIm' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'bhspelmhhcghawhlmze31' into the change password New Password field
  And he or she enters 'bhspelmhhcghawhlmze31' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'ODLJKVONDD526' into the change password New Password field
  And he or she enters 'boimTIMWaR220' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'luvq4' into the change password New Password field
  And he or she enters 'luvq4' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'DHfDdsYiolXNwZ1' into the change password Confirm Password field
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
  And he or she enters 'iUoTnUXhsJPRI95498' into the change password Current Password field
  And he or she enters 'vFwVTDMzvmMDrWaTYdhI' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'lZafWjdFND09' into the change password Current Password field
  And he or she enters 'qzmdpmvsimpdntnnpfxw12' into the change password New Password field
  And he or she enters 'qzmdpmvsimpdntnnpfxw12' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'xZqUBqrlrYooQNrXQV6968' into the change password Current Password field
  And he or she enters 'GAHWRZWFV84' into the change password New Password field
  And he or she enters 'BfSrNyBXWFej73' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'axURbFrmZqKYWBFn79252' into the change password Current Password field
  And he or she enters 'pcxi917' into the change password New Password field
  And he or she enters 'pcxi917' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'dPxNBosweBPPNnanmOUb15' into the change password Current Password field
  And he or she enters 'jXKhgQPIkxiqhxop698' into the change password New Password field
  And he or she enters 'btFbkaiwcaZxYrHVR9415' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'kApzeDvGKnuLOTjw7826' into the change password Current Password field
  And he or she enters 'jXPxkxGUDkNEHCAHb471' into the change password New Password field
  And he or she enters 'jXPxkxGUDkNEHCAHb471' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is not correct


Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'mQayzNueIc40562' into the change password Current Password field
  And he or she enters 'OPfpSFqzMSafXmNji23' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password


Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'iUuWhmhb73' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password is the same as the Current Password


Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'VQsysQWtKGjFzAV30' into the change password Current Password field
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
  And he or she enters 'zomm0' into the change password New Password field
  And he or she enters 'zomm0' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'BGNDULPB8109' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'VIeSTYsKChaacixkiPa' into the change password New Password field
  And he or she enters 'VIeSTYsKChaacixkiPa' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'cioaqgvdkdt3' into the change password New Password field
  And he or she enters 'cioaqgvdkdt3' into the change password Confirm Password field
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
  And he or she enters 'AWsgdYfSoARhy9960' into the change password New Password field
  And he or she enters 'NGaCOtnivxpVhy059' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required


Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'LQjONBuDu5' into the change password New Password field
  And he or she enters 'LQjONBuDu5' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Success Message indicating a successful change password