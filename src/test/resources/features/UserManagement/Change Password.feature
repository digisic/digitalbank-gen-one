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



Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'qVwpSDlXWqdAVeLD' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'JoInzBbRLjgPLVCHrf40' into the New Password field
  And I enter 'QuUMvdflspFbeWrnf498' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'qIxBvanC41959' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'AdWCQzxgrgRJOMWgxqN' into the New Password field
  And I enter 'AdWCQzxgrgRJOMWgxqN' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'RqTEyPgVJFy' into the New Password field
  And I enter 'eWBRPFNOZeoPReVP910' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'ZNGFNCQG3350' into the New Password field
  And I enter 'HilqFxVySqlxsejDFoV72' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'oympynbssqeejzm894' into the New Password field
  And I enter 'oympynbssqeejzm894' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'xhfqdbohhhbycsg010' into the New Password field
  And I enter 'llKCOBWBtb9' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no upper case characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'vlqrhvwuaioafccsnjxn9' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'NGZXTQFWFWPRI50' into the New Password field
  And I enter 'NGZXTQFWFWPRI50' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password is empty, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter '' into the New Password field
  And I enter 'FPDQtTQbVoFpZcXojQ7343' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password with no lower case characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'UIGGLWZOEPLMHCTPOXW47949' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'b34' into the New Password field
  And I enter 'b34' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'j923' into the New Password field
  And I enter 'rhgauGEcZlk5407' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password less than 8 characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'rlha2' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'CzetyAwyxUWBHuf9941' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password same as Current Password, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter '' into the New Password field
  And I enter 'bKJeCfld6' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of valid Current Password, New Password is empty, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'kPczOisNAOsWvpMP9925' into the Current Password field
  And I enter 'gTcEdRCgwoyLKKS' into the New Password field
  And I enter 'VIvQICELHxl839' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no numeric characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'MoSPVrvjT761' into the Current Password field
  And I enter 'TMdONUlXUWFZgASafkYB' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'ALNBLLrlmFJh6984' into the Current Password field
  And I enter 'onbrxqgcrn797' into the New Password field
  And I enter 'onbrxqgcrn797' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no upper case characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'lRbknNyMnMtCmLc18076' into the Current Password field
  And I enter 'wrbpzfvjgzzsdocdnk63429' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'NoSHTFdZghwZpk36970' into the Current Password field
  And I enter 'LDASNGZNHKHKBVRQ8' into the New Password field
  And I enter 'LDASNGZNHKHKBVRQ8' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password with no lower case characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'vRbxhPpfCZYsjUhrY14' into the Current Password field
  And I enter 'FCJAQKYUCQHZWLHHP4' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'YoWQxVZcqvxQbirY081' into the Current Password field
  And I enter 'j3' into the New Password field
  And I enter 'j3' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password less than 8 characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'imwCkAjMmLFAqsidHNX60' into the Current Password field
  And I enter 'ny429' into the New Password field
  And I enter 'BFnnHmUOJDYoQi6420' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'yWVhMsmrzISCkWE8337' into the Current Password field
  And I enter 'fMzyQUTDCAr158' into the New Password field
  And I enter 'JOgDigvkZH41380' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password meets requirements, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'rqQJpJwBDspFT56' into the Current Password field
  And I enter 'LmSYNtOT6327' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'aqotBYIqbRdd869' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'ZHamfgOkRvgXXgybA374' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password same as Current Password, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'qyXaMhLM912' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Confirm Passsword does not match New Password

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'hkBhxiwcrcnNscRS52' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of invalid Current Password, New Password is empty, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'qkukjoGmHTclBw30' into the Current Password field
  And I enter '' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password with no numeric characters, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'kkgBzunXmLPRxcGURNO' into the New Password field
  And I enter 'kkgBzunXmLPRxcGURNO' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password with no upper case characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'wlhsjcsdnxf68' into the New Password field
  And I enter 'QGPlBqgPpoSMpOtmAJXV39' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password with no lower case characters, and Confirm Password does not match New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'RIVWWDYNEBG8' into the New Password field
  And I enter 'vedkPhrVMK763' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password less than 8 characters, and Confirm Password is empty
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'f006' into the New Password field
  And I enter '' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password does not meet format requirements

Scenario: Change Password with conditions of Empty Current Password, New Password meets requirements, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'siWLoogiBpefn2' into the New Password field
  And I enter 'siWLoogiBpefn2' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating Current Password is not correct

Scenario: Change Password with conditions of Empty Current Password, New Password same as Current Password, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Remember Me checkbox
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter '' into the Current Password field
  And I enter 'Demo123!' into the New Password field
  And I enter 'Demo123!' into the Confirm Password field
  And I click the Update Password button
  Then I verify I am presented with a Error Message indicating New Password is the same as the Current Password

Scenario: Change Password with conditions of valid Current Password, New Password meets requirements, and Confirm Password matches New Password
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is not present
  And I click the User Profile menu
  And I click the Change Password menu option
  And I enter 'Demo123!' into the Current Password field
  And I enter 'YCbRvuALLCbNlsc95' into the New Password field
  And I enter 'YCbRvuALLCbNlsc95' into the Confirm Password field
  And I click the Update Password button
  And I verify I am presented with a Success Message
  And I click the User Profile menu
  And I click the Logout menu option
  And I verify I am at the Login page
  And I verify I am presented with a Success Message
  And I am at the Login page
  And I enter 'jsmith@demo.io' into the Username field
  And I enter 'Demo123!' into the Password field
  And I click the Submit button
  And I verify I am at the Home page
  And I verify the Remember Me cookie is not present
