*** Settings ***
Resource        ../keywords/login_user_keywords.robot

*** Test Cases ***
Login user with valid username, invalid password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    jsmith@demo.io
    Input Password    gTlVmQZh4
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with valid username, empty password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    jsmith@demo.io
    Input Password    
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with valid username, valid password, remember me selected, account is enabled, account not expired, account not locked, credentials not expired
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    jsmith@demo.io
    Input Password    Demo123!
    Select Remember Me
    Submit Credentials
    Home Page Should be Open
    Validate Remember Me Cookie is Present
    [Teardown]    Close All Browsers


Login user with valid username, valid password, remember me not selected, account is enabled, account not expired, account not locked, credentials not expired
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    jsmith@demo.io
    Input Password    Demo123!
    Submit Credentials
    Home Page Should be Open
    [Teardown]    Close All Browsers


Login user with valid username, valid password, account is enabled, account not expired, account not locked, credentials expired
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    expiredPassword@demo.io
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with valid username, valid password, account is enabled, account is expired, account not locked
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    expired@demo.io
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with valid username, valid password, account is enabled, account is locked
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    locked@demo.io
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with valid username, valid password, account is disabled
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    disabled@demo.io
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with invalid username, valid password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    ErPE7@demo.io
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with invalid username, invalid password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    MWKBTNQPfcX@demo.io
    Input Password    yrJVDBQWMfBg287
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with empty username, valid password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    
    Input Password    Demo123!
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


Login user with empty username, invalid password
    Open Browser To Login Page
    Login Page Should Be Open
    Input Username    
    Input Password    UKwVFdYekNaEROiNRY608
    Submit Credentials
    Login Error Message Should Be Displayed
    [Teardown]    Close All Browsers


