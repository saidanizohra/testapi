*** Settings ***
Documentation     Valid Login
Library           SeleniumLibrary

*** Variables ***
${LOGIN URL}      http://tvioo.test.com/admin/check_password_redirection
${BROWSER}        Chrome

*** Test Cases ***
Valid Login
    Open Browser To Login Page
    sleep             2
    Input Username    admin
    Input Password    admin
    Submit Credentials
#    [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
Input Username
    [Arguments]    ${username}
    Input Text    id=usernameInput    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    id=passwordInput   ${password}

Submit Credentials
    Click Button    id=btnLogin

