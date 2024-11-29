*** Settings ***
Documentation        Armazenar toda base do projeto
Library            RequestsLibrary
Library            String
Library            Collections
Library            OperatingSystem
Library            JSONLibrary

Resource        ../resources/ms-usuarios/api_testing_usuarios.resource
Resource        ../resources/ms-login//api_testing_login.resource
Resource        ../support/common/common_keyword.robot
Resource        ../resources/ms-produtos/api_testing_produtos.resource

*** Keywords ***
Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Get json fixture
    [Arguments]    ${file_name}        ${scenario}
    ${file}        Get Binary File    ${EXECDIR}/resources/fixtures/${file_name}    
    ${data}        Evaluate    json.loads('''${file}''')    json
    RETURN        ${data}[${scenario}]


Get json fixture1
    [Arguments]    ${file_name}
    ${file}        Get File    ${EXECDIR}/resources/fixtures/${file_name}    
    ${data}        Evaluate    json.loads('''${file}''')    json
    RETURN        ${data}