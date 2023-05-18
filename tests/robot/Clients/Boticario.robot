*** Settings ***
Documentation    Organização e chamada dos testes regressivos da api BFF

Resource    ../TestCases/Login.robot
Resource    ../TestCases/Health_Check.robot
Resource    ../TestCases/Bank.robot
Resource    ../TestCases/Icon.robot

*** Test Cases ***
Login
    [Tags]    BFF - Login
    CT: Login com sucesso

Bank
    [Tags]    BFF - Bancos
    CT: Login com sucesso
    CT: Status da api
    CT: Pegar todos os ícones

    CT: Tentar criar banco que já existe e esperar erro


