*** Settings ***
Documentation            Armazenar keywords usando no projeto

Resource                ../../support/base.robot

*** Keywords ***
POST Endpoint na api "${route}"
    ${response}    POST On Session    alias=ServeRest    url=${route}    json=${body}    expected_status=ANY   verify=${False}
    Log To Console    Response: ${response.content}
    Set Test Variable    ${response}

GET Endpoint na api "${route}"
    ${response}            GET On Session    alias=ServeRest    url=${route}/${ID_USUARIO}    expected_status=ANY   verify=${False}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint na api "${route}"
    ${response}            PUT On Session    alias=ServeRest    url=&{route}/${ID_USUARIO}    json=${body}    expected_status=ANY   verify=${False}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint na api "${route}"
    ${response}        DELETE On Session        alias=ServeRest    url=${route}/${ID_USUARIO}    expected_status=ANY   verify=${False}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Fazer uma chamada POST com autenticacao na rota "${route}"
    ${header}              Create Dictionary    authorization=${AUTHORIZATION}
    ${response}            POST On Session    alias=ServeRest    url=${route}    json=${body}    expected_status=ANY   verify=${False}    headers=${header}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

DELETE cadastro com autenticacao
    [Arguments]    ${route}    ${ID}
    ${header}              Create Dictionary    authorization=${AUTHORIZATION}
    ${response}            DELETE On Session    alias=ServeRest    url=${route}/${ID}    json=${body}    expected_status=ANY   verify=${False}    headers=${header}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Status Should Be    ${statuscode}

Cadastrar um novo usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TEST}  status_code=201

Valida mensagem de cadastrado "${message}"
    Log    ${message}
    Dictionary Should Contain Item    ${RESPONSE}    message    ${message}

Verifica se campo email foi preenchido corretamente "${email}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    email    ${email}

Verifica se campo senha foi preenchido corretamente "${password}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    password    ${password}

Verifica se campo nome foi preenchido corretamente "${name}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    nome    ${name}

Verifica se campo descricao foi preenchido corretamente "${descricao}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    descricao    ${descricao}

Verifica se campo quantidade foi preenchido corretamente "${quantidade}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    quantidade    ${quantidade}

Verifica se campo preço foi preenchido corretamente "${preco}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    preco    ${preco}