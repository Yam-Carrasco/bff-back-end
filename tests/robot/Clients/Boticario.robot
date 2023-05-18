*** Settings ***
Documentation    Organização e chamada dos testes regressivos da api BFF

Resource    ../TestCases/Login.robot


*** Test Cases ***
Login
    [Tags]    BFF - Login
    CT: Login com sucesso
