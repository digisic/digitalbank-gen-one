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


@negative
Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'mkELkOHzh70891' into the change password New Password field
  And he or she enters 'GtghGIWNXCKchFPRbs6164' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'FKtsoMQTj47' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'BlQIMLbyaEvnBShV' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'ndppzdedqynnggtaad0655' into the change password New Password field
  And he or she enters 'ndppzdedqynnggtaad0655' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'OFZKKMYMJOSGJQUD59838' into the change password New Password field
  And he or she enters 'stPwHLuvnUzYmwwlW558' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'l92' into the change password New Password field
  And he or she enters 'l92' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'wiFQWWeIgDabV97' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'bWeTGpjSEu61' into the change password Current Password field
  And he or she enters 'yKBFcjKwmzF' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'oEqjsMLySDqsnRzTWqDD4213' into the change password Current Password field
  And he or she enters 'zitubklfcxxjhucorca0569' into the change password New Password field
  And he or she enters 'zitubklfcxxjhucorca0569' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'QuALYOHkp0' into the change password Current Password field
  And he or she enters 'ABTGJTDBDTCPYRVJA56727' into the change password New Password field
  And he or she enters 'jhfdSdydgwlrYPIBZmY85' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'GjzkySqCrYJWv08' into the change password Current Password field
  And he or she enters 'enx3' into the change password New Password field
  And he or she enters 'enx3' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'WeyMUlDPkFa7695' into the change password Current Password field
  And he or she enters 'GQZMqoqz328' into the change password New Password field
  And he or she enters 'LXXgHHBqMJTTBzE75924' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'MCaWygtWDhacMeS792' into the change password Current Password field
  And he or she enters 'zKbFBPfhOMOOogqvo2869' into the change password New Password field
  And he or she enters 'zKbFBPfhOMOOogqvo2869' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is not correct

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'lTVDQmJSPeonAK1' into the change password Current Password field
  And he or she enters 'piwHxQfJDZ04' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'NlRtaGDbI043' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password is the same as the Current Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'SOzEEoORemrlw366' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters '' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'nhcq6' into the change password New Password field
  And he or she enters 'nhcq6' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'SKAROIANHGHDEAI006' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'gUMTZuTifQJPY' into the change password New Password field
  And he or she enters 'gUMTZuTifQJPY' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'aoxrporr77' into the change password New Password field
  And he or she enters 'aoxrporr77' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'CqvAgIuzYKYnyli2646' into the change password New Password field
  And he or she enters 'gRBfkWHIvgQcGfDnpO657' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

@positive
Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'ZVMcKwGsmLFlZcYSMO63052' into the change password New Password field
  And he or she enters 'ZVMcKwGsmLFlZcYSMO63052' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Success Message indicating a successful change password