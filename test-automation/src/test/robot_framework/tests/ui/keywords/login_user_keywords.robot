*** Settings ***
Resource        common_keywords.robot
Resource        login_user_page_objects.robot

*** Variables ***
${LOGIN_URL}    ${C_ROOT_URL}/bank/login
${HOME_URL}     ${C_ROOT_URL}/bank/home
${TITLE}        Digital Bank


*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN_URL}    ${C_BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${C_DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Location Should Be    ${LOGIN_URL}
    Title Should Be    ${TITLE}

Input Username
    [Arguments]  ${username}=${EMPTY}
    Input Text    ${LOGIN_USERNAME}    ${username}

Input Password
    [Arguments]  ${password}=${EMPTY}
    Input Text    ${LOGIN_PASSWORD}    ${password}
    
Select Remember Me
    Click Element    ${LOGIN_REMEMBER_ME}

Submit Credentials
    Click Button    ${LOGIN_SUBMIT}
    
Login Error Message Should Be Displayed
    Page Should Contain Element    ${SHARED_ALERT_ERROR}

Home Page Should be Open
    Location Should Be    ${HOME_URL}
    Title Should Be    ${TITLE}
  
Validate Remember Me Cookie is Present
    Get Cookie    ${LOGIN_REMEMBER_ME_COOKIE}