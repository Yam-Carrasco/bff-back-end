*** Settings ***
Documentation    Teste regressivo para veriicar o status da API

Library  RequestsLibrary
Library   Collections

*** Keywords ***
CT: Pegar todos os ícones
    ${headers}    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}

    Create Session    Get Icon    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital
    ${ICONS}    GET On Session    Get Icon    /api/v1/icon    headers=${headers}

    ${json}=    Evaluate    json.loads('''${ICONS.content}''')
    ${ICON_UID}=    Set Variable    ${json[0]['id']}
    Set Suite Variable    ${ICON_UID}    ${ICON_UID}