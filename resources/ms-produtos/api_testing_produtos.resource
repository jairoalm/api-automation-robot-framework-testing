*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

Resource    ../../support/base.robot

*** Variables ***

*** Keywords ***
Cadastrar um produto criado na ServeRest
    ${body}    Create Dictionary    
    ...    nome=teste produto 012  
    ...    preco=12    
    ...    descricao=TV 29 polegadas    
    ...    quantidade=10
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${ID}    ${response.json()["_id"]}

Vou repetir um cadastro de produto
    ${body}    Create Dictionary    
    ...    nome=Televisão    
    ...    preco=12    
    ...    descricao=TV 29 polegadas    
    ...    quantidade=10
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}

Consultar os dados do novo produto
    GET Endpoint na api "/usuarios"
    Log      ${response.status_code}
    Log      ${response.reason}
    Log      ${response.headers}
    Log      ${response.text}
    Log      ${response.elapsed}
    Log      ${response.json()}
    Set Test Variable    ${RESPONSE_CONSULTA}    ${response.json()}