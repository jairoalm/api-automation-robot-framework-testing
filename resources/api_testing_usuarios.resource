*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***

*** Keywords ***
Criar um usuário novo
    ${NOME}    Generate Random String    length=4    chars=[LETTERS]
    ${NOME}    Convert To Lower Case    ${NOME}  
    Set Test Variable    ${EMAIL_TEST}    ${NOME}@teste.com.br
    Log To Console    ${EMAIL_TEST}

Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}    ${status_code}
    ${body}    Create Dictionary    
    ...    nome=Teste09    
    ...    email=${email}    
    ...    password=5789    
    ...    administrador=true    
    Criar Sessão na ServeRest
    ${response}    POST On Session    alias=ServeRest    url=/usuarios    json=${body}    expected_status=${status_code}

    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()}    

Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}

Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key        ${RESPONSE}    _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    status_code=400

Verificar se a API não permitiu o cadastro repetido
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Este email já está sendo usado    

Consultar os dados do novo usuario
    ${response_usuario}    GET On Session    alias=ServeRest    url=/usuarios/${ID_USUARIO}    expected_status=200
    Log      ${response_usuario.status_code}
    Log      ${response_usuario.reason}
    Log      ${response_usuario.headers}
    Log      ${response_usuario.text}
    Log      ${response_usuario.elapsed}
    Log      ${response_usuario.json()}
    Set Test Variable    ${RESPONSE_CONSULTA}    ${response_usuario.json()}

Conferir os dados do novo usuario
    Log    ${RESPONSE_CONSULTA}
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    nome               Teste09
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    email              ${EMAIL_TEST}
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    password           5789
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    administrador      true
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    _id                ${ID_USUARIO}

Realizar Login com o usuário
    ${body}    Create Dictionary     
    ...    email=${EMAIL_TEST}    
    ...    password=5789       
    Criar Sessão na ServeRest
    ${response}    POST On Session    alias=ServeRest    url=/login    json=${body}    expected_status=any

    # Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}
    Set Test Variable    ${RESPONSE}      ${response.json()}

Conferir se o Login ocorreu com sucesso    
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Login realizado com sucesso
    Dictionary Should Contain Key        ${RESPONSE}    authorization

Realizar Login com email inválido
    ${body}    Create Dictionary     
    ...    email=12355@teste.com    
    ...    password=5789       
    Criar Sessão na ServeRest
    ${response}    POST On Session    alias=ServeRest    url=/login    json=${body}    expected_status=any

    # Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}
    Set Test Variable    ${RESPONSE}      ${response.json()}

Valida que usuário não esta cadastrado
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Email e/ou senha inválidos