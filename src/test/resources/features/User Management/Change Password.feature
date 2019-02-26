Feature: Change Password
  As a  logged in user
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
  And he or she enters 'UtYhRMjadlGqKtjjBd1' into the change password New Password field
  And he or she enters 'rgzSNEaPs3' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'zwDbvyKhCGeAHZidxZJ62' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'nQTnmBNr' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'ffzgvwfhkztamovh482' into the change password New Password field
  And he or she enters 'ffzgvwfhkztamovh482' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'SYCOTAVK51' into the change password New Password field
  And he or she enters 'xvwHLhjDGePH4671' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'xy82' into the change password New Password field
  And he or she enters 'xy82' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'nyNewJiDuRzPLqeSirU57' into the change password Confirm Password field
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
  And he or she enters 'CyjLcqZSrewefaCCFS2802' into the change password Current Password field
  And he or she enters 'JkLwCJUIzPiOtaujXO' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'iEoNEHNdymNkuuKgf94' into the change password Current Password field
  And he or she enters 'riwqhddcrvmb2385' into the change password New Password field
  And he or she enters 'riwqhddcrvmb2385' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'ToHSCxsdjgkNiOuU6511' into the change password Current Password field
  And he or she enters 'VAEELLACRJVVSDVVTY01' into the change password New Password field
  And he or she enters 'slbwpaNVJBSQQtKWsS9' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'UcauAuiKeguPKWX65' into the change password Current Password field
  And he or she enters 'fun20' into the change password New Password field
  And he or she enters 'fun20' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'TcgWhtmezXbLkjTncob8391' into the change password Current Password field
  And he or she enters 'onloWUgZqdMUlH1010' into the change password New Password field
  And he or she enters 'CrJFlhMmfhY40968' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'hFkUcjrLRLAUJOBWe40643' into the change password Current Password field
  And he or she enters 'LAGjWMAlPZGpskliFng779' into the change password New Password field
  And he or she enters 'LAGjWMAlPZGpskliFng779' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'BCIlmzpKWb02200' into the change password Current Password field
  And he or she enters 'kkNSthxTHRuPmReULTpG7' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'ZwdkBHFILTqDRleVaHH87988' into the change password Current Password field
  And he or she enters 'Demo123!' into the change password New Password field
  And he or she enters 'Demo123!' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'KYwiZQCjeKhECMgCRg8737' into the change password Current Password field
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
  And he or she enters 'k659' into the change password New Password field
  And he or she enters 'k659' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password is empty
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'BDEIKTPQGSQRRMG4' into the change password New Password field
  And he or she enters '' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'XBZPnACu' into the change password New Password field
  And he or she enters 'XBZPnACu' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters '' into the change password Current Password field
  And he or she enters 'gsqdwconyeibzolbnhrv57706' into the change password New Password field
  And he or she enters 'gsqdwconyeibzolbnhrv57706' into the change password Confirm Password field
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
  And he or she enters 'ZhqkOZgcLP54' into the change password New Password field
  And he or she enters 'ZPRIHzUxENOgRXdrBDGC66' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Error Message indicating Current Password is required

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  Given Nicole is logged into the application
  When Nicole navigates to the User Profile menu
  And he or she selects 'Change Password' from the User Profile menu
  And he or she enters 'Demo123!' into the change password Current Password field
  And he or she enters 'FNNHhwhfyqcMLNl8660' into the change password New Password field
  And he or she enters 'FNNHhwhfyqcMLNl8660' into the change password Confirm Password field
  And he or she submits the Update Password request
  Then Nicole verifies he or she is presented with a Success Message indicating a successful change password
