*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

Resource    ../../support/base.robot

*** Variables ***

*** Keywords ***

Criar um usuário novo
    ${NOME}    Generate Random String    length=4    chars=[LETTERS]
    ${NOME}    Convert To Lower Case    ${NOME}  
    Set Test Variable    ${EMAIL_TEST}    ${NOME}@mailsac.com
    Log To Console    ${EMAIL_TEST}

Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}    ${status_code}
    ${body}    Create Dictionary    
    ...    nome=Teste09    
    ...    email=${email}    
    ...    password=5789    
    ...    administrador=true
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    POST Endpoint na api "/usuarios"
    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()}    

Conferir se o usuário foi cadastrado corretamente
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key        ${RESPONSE}    _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TEST}    status_code=400

Cadstrar novo usuario sem informar nome
    ${body}    Create Dictionary    
    ...    nome=${EMPTY}    
    ...    email=fulano@teste.com.br    
    ...    password=5789    
    ...    administrador=true
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    POST Endpoint na api "/usuarios"
    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()} 

Cadstrar novo usuario com email inválido
    [Arguments]    ${email}
    ${body}    Create Dictionary    
    ...    nome=Usuario sem email    
    ...    email=${email}    
    ...    password=5789    
    ...    administrador=true
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    POST Endpoint na api "/usuarios"
    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()}

Cadstrar novo usuario sem informar senha
    ${body}    Create Dictionary    
    ...    nome=Usuario sem email    
    ...    email=testet@teste.com.br    
    ...    password=${EMPTY}    
    ...    administrador=true
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    POST Endpoint na api "/usuarios"
    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()}

Cadstrar novo usuario com administrador invalido
    [Arguments]    ${adm}
    ${body}    Create Dictionary    
    ...    nome=Usuario sem email    
    ...    email=testet@teste.com.br    
    ...    password=12356   
    ...    administrador=${adm}
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    POST Endpoint na api "/usuarios"
    Log    ${response.json()}
    IF  ${response.status_code} == 201
        Set Test Variable    ${ID_USUARIO}    ${response.json()["_id"]}        
    END    
    Set Test Variable    ${RESPONSE}      ${response.json()}

Verificar se a API não permitiu o cadastro repetido
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Este email já está sendo usado    

Consultar os dados do novo usuario
    GET Endpoint na api    /usuarios/${ID}
    Log      ${response.status_code}
    Log      ${response.reason}
    Log      ${response.headers}
    Log      ${response.text}
    Log      ${response.elapsed}
    Log      ${response.json()}
    Set Test Variable    ${RESPONSE_CONSULTA}    ${response.json()}

Conferir os dados do novo usuario
    Log    ${RESPONSE_CONSULTA}
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    nome               Teste09
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    email              ${EMAIL_TEST}
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    password           5789
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    administrador      true
    Dictionary Should Contain Item    ${RESPONSE_CONSULTA}    _id                ${ID}

Verifica se campo administrador foi preenchido corretamente "${administrador}"
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    administrador    ${administrador}