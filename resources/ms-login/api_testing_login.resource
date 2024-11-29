*** Settings ***
Documentation        Ações do microserviço de Login

Resource            ../../support/base.robot
Resource            ../../resources/ms-usuarios/api_testing_usuarios.resource


*** Keywords ***
Realizar Login com o usuário
    ${body}    Create Dictionary     
    ...    email=${EMAIL_TEST}    
    ...    password=5789
    Set Global Variable                ${body}       
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}
    Set Global Variable    ${AUTHORIZATION}     ${RESPONSE["authorization"]}

Realizar login com usuário existente
    ${body}    Create Dictionary     
    ...    email=fulano@qa.com    
    ...    password=teste
    Set Global Variable                ${body}       
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}
    Set Global Variable    ${AUTHORIZATION}     ${RESPONSE["authorization"]}    

Conferir se o Login ocorreu com sucesso    
    Log    ${RESPONSE}
    Dictionary Should Contain Item       ${RESPONSE}    message    Login realizado com sucesso
    Dictionary Should Contain Key        ${RESPONSE}    authorization

Realizar Login com email inválido
    ${body}    Create Dictionary     
    ...    email=12355@teste.com    
    ...    password=5789       
    Set Global Variable                ${body}
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}

Campo email é obrigatorio
    ${body}    Create Dictionary     
    ...    email=${EMPTY}    
    ...    password=5789
    Set Global Variable                ${body}       
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}

Email informado é inválido
    ${body}    Create Dictionary     
    ...    email=fulano#qa.com    
    ...    password=5789     
    Set Global Variable                ${body}  
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}

Campo senha é obrigatorio
    ${body}    Create Dictionary     
    ...    email=${EMAIL_TEST}    
    ...    password=${EMPTY}
    Set Global Variable                ${body}       
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}

Informar senha inválida
    ${body}    Create Dictionary     
    ...    email=${EMAIL_TEST}    
    ...    password=65$%#@#%%$#$##$#%
    Set Global Variable                ${body}       
    Criar Sessão na ServeRest
    POST Endpoint na api "/login"
    Set Test Variable    ${RESPONSE}      ${response.json()}