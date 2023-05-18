*** Settings ***
Documentation    Teste de rota de autenticação

Library  RequestsLibrary
Library   Collections

*** Variables ***
${URL_LOGIN}    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital/api/v1/auth/login

*** Keywords ***
CT: Login com sucesso
    ${headers}  Create Dictionary    Content-type=application/json
    ${json}    Create Dictionary
    ...    password=Motor@2023
    ...    username=usuario.aurora@grupoboticario.com.br

    Create Session    Auth    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital
    ${RESPONSE}    POST On Session    Auth    /api/v1/auth/login    headers=${headers}    json=${json}
    Should Be Equal As Strings  ${RESPONSE.status_code}  201

    ${ACCESS_TOKEN}=  Get From Dictionary  ${RESPONSE.json()}  accessToken
    Set Suite Variable    ${ACCESS_TOKEN}    ${ACCESS_TOKEN}
