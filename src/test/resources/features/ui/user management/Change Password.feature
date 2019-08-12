@ui @user @security @password
Feature: Change Password (UI)
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
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'ynzHKqnwwQNkqYA344' into the change password New Password field
  And they enter 'WOegHhnzREnaBCrXH229' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'qUoJfjfDDUHpVfpAnbiE03267' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'HeYaOSTuZAoDmjNc' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'zljxufgufsq14796' into the change password New Password field
  And they enter 'zljxufgufsq14796' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'FCZOLAETZXRTNZ69' into the change password New Password field
  And they enter 'pAQisqJkRElXfYOEXmP79171' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'pv13' into the change password New Password field
  And they enter 'pv13' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'Demo123!' into the change password New Password field
  And they enter 'uQgrlARrXZVoXWJ3' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'Demo123!' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter '' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'tnajlOPKK3' into the change password Current Password field
  And they enter 'IYtZwncsEGbwWNT' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'vDHfKJkrEoX699' into the change password Current Password field
  And they enter 'jvnnnhtixlcqnxorihvy584' into the change password New Password field
  And they enter 'jvnnnhtixlcqnxorihvy584' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'ibaYwxRDQIz19' into the change password Current Password field
  And they enter 'DDPQCDTRWC299' into the change password New Password field
  And they enter 'lyAiuAUfHGbMN18' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'BTywcHPWzCbDT86092' into the change password Current Password field
  And they enter 'dhvn7' into the change password New Password field
  And they enter 'dhvn7' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'LfrvcUNMjFLoE199' into the change password Current Password field
  And they enter 'PzelGdFDqO7' into the change password New Password field
  And they enter 'xtgiFERzkWkyXo493' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'IWgbAERFZfI0' into the change password Current Password field
  And they enter 'FFeBMTyBhpxdjRhEK0084' into the change password New Password field
  And they enter 'FFeBMTyBhpxdjRhEK0084' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is not correct

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'kCcnNdQuaSHFwcvQ05570' into the change password Current Password field
  And they enter 'AJCCyljuBakc73' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Confirm Passsword does not match New Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'BOrkrWBoTEeQcKGuPu44' into the change password Current Password field
  And they enter 'Demo123!' into the change password New Password field
  And they enter 'Demo123!' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password is the same as the Current Password

@negative
Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'xSAEbJjoibWFYwaj22384' into the change password Current Password field
  And they enter '' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating New Password does not meet format requirements

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter '' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'h8' into the change password New Password field
  And they enter 'h8' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'IPUTPHXZAFHZYOBXL6124' into the change password New Password field
  And they enter '' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'xJIuJiWnflRcGdHXIxO' into the change password New Password field
  And they enter 'xJIuJiWnflRcGdHXIxO' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'epngzpthvfgaauaj18372' into the change password New Password field
  And they enter 'epngzpthvfgaauaj18372' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'Demo123!' into the change password New Password field
  And they enter 'Demo123!' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@negative
Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Jamie is logged into the application with Jamie9729@gmail.com
  When Jamie navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter '' into the change password Current Password field
  And they enter 'yyqLhSLcJkj2' into the change password New Password field
  And they enter 'jEjjZGHYbZJgjKO6' into the change password Confirm Password field
  And they submit the Update Password request
  Then Jamie verifies they are presented with a Error Message indicating Current Password is required

@positive
Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Ally is logged into the application with Ally04493@gmail.com
  When Ally navigates to the User Profile menu
  And they select 'Change Password' from the User Profile menu
  And they enter 'Demo123!' into the change password Current Password field
  And they enter 'HTlbCHIPCrbGZQjB076' into the change password New Password field
  And they enter 'HTlbCHIPCrbGZQjB076' into the change password Confirm Password field
  And they submit the Update Password request
  Then Ally verifies they are presented with a Success Message indicating a successful change password