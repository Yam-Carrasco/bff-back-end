*** Settings ***
Library         ../Helpers/Absolute_path.py
Library         ../Helpers/Get_Tests_Status.py
Library         RequestsLibrary
Library         Collections

*** Tasks ***
Send Curl to Slack
    ${report}    Set Variable    Results\\output.xml
    ${path}    Get Absolute Path    ${report}
    ${msg}    Get Test Status    ${path}
    Curl    ${msg}

*** Keywords ***
Curl
    [Arguments]    ${msg}
    ${endpoint}  Set Variable    https://hooks.slack.com/services/T06JRN0TA/B0586C1S8LS
    ${headers}  Create Dictionary    Content-type=application/json
    ${json_data}  Create Dictionary    text=${msg}

    Create Session  Slack  ${endpoint}
    ${response}  POST On Session  Slack  /asXGPuVCKyfUVPl8l7TGaun4  headers=${headers}  json=${json_data}
    Should Be Equal As Strings  ${response.status_code}  200

