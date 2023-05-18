*** Settings ***
Documentation    Teste regressivo para veriicar o status da API

Library  RequestsLibrary
Library   Collections

*** Keywords ***
CT: Status da api
    Create Session    Health Check    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital
    ${RESPONSE}    GET On Session    Health Check    /api/v1/healthcheck
    Should Be Equal As Strings  ${RESPONSE.status_code}  200
    
    Create Session    Health Check Complete    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital
    ${RESPONSE}    GET On Session    Health Check Complete    /api/v1/healthcheck/complete
    Should Be Equal As Strings  ${RESPONSE.status_code}  200