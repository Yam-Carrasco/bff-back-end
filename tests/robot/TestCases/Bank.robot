*** Settings ***
Documentation    Teste regressivo para verificar o login

Library  RequestsLibrary
Library   Collections

*** Keywords ***
CT: Tentar criar banco que já existe e esperar erro
    ${user}=    Create Dictionary    cpf=566.578.530-09    cellphone=89981242943    name=João Lucas    email=teste@gmail.com    bankId=988978779
    ${bank}=    Create Dictionary    code=1233    sapCode=3321    name=Banco dos bancos    corporateName=Teste Corporativo    cnpj=13.282.865/0001-30    email=teste@gmail.com    emailDomain=teste@gmail.com    mainPhone=89981242943    alternatePhone=89981242922    esg=true
    ${address}=    Create Dictionary    street=São Luiz    number=12    city=Santo Antônio de Lisboa    neighborhood=Centro    state=PI    zipCode=64640000    complement=string
    ${icon}=    Create Dictionary    iconId=${ICON_UID}

    ${data}=    Create Dictionary    user=${user}    bank=${bank}    address=${address}    icon=${icon}

    ${headers}    Create Dictionary    Authorization=Bearer ${ACCESS_TOKEN}

    Create Session    Creat Bank    https://dfacilita-bff-api.produto-financeiro.grupoboticario.digital
    ${RESPONSE}=    POST On Session    Creat Bank    /api/v1/bank    headers=${headers}    json=${data}    expected_status=anything

    ${MESSAGE}=  Get From Dictionary  ${RESPONSE.json()}  message
    ${STATUS_CODE}=  Get From Dictionary  ${RESPONSE.json()}  statusCode

    Should Be Equal As Strings    ${STATUS_CODE}    409
    Should Be Equal As Strings    ${MESSAGE}    Banco já criado