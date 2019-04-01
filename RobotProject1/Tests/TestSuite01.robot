*** Settings ***
Library  SeleniumLibrary
Suite Setup    Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup    Log    I am inside Test Setup
Test Teardown    Log    I am inside Test Teardown                


*** Test Cases ***
MyFirstTest
    Log    Hello World...
    
FirstSeleniumTest
    Open Browser  https://google.com  edge
    Set Browser Implicit Wait    5
    Input Text    name=q    Automation step by step
    Press Key    name=q    \\13
    Click Button    name=btnK
    Sleep    2
    Close Browser
    Log    Test Completed
 
SampleLoginTest
    [Documentation]    This is a simple login test    
    Open Browser    ${URL}      edge
    Sleep    2s    
    #Set Browser Implicit Wait    5s
    Log    This test was executed by %{username} on %{os}
    Log    Current test case name ${TEST NAME}
    LoginKW
    Sleep    2s
    Click Element    id=welcome
    Sleep    2s
    Click Element    link=Logout
    Close Browser
    Log              Text Completed
    
*** Variables ***
${URL}   https://opensource-demo.orangehrmlive.com/ 
@{CREDENTIALS}    Admin    admin123
&{LOGINGDATA}    username=Admin    password=admin123

*** Keywords ***
LoginKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]
    Input Password    id=txtPassword    &{LOGINGDATA}[password]
    Click Button     id=btnLogin    