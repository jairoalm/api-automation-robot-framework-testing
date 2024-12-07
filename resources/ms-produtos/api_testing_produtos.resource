*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

Resource    ../../support/base.robot

*** Variables ***

*** Keywords ***
Cadastrar um produto criado na ServeRest
    ${NOME}    Generate Random String    length=4    chars=[LETTERS]
    ${NOME}    Convert To Lower Case    ${NOME} 
    ${body}    Create Dictionary    
    ...    nome=${NOME}  
    ...    preco=12    
    ...    descricao=TV 29 polegadas    
    ...    quantidade=10
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${ID}    ${response.json()["_id"]}
    Set Test Variable    ${RESPONSE}      ${response.json()}

Vou repetir um cadastro de produto
    ${body}    Create Dictionary    
    ...    nome=Samsung 60 polegadas    
    ...    preco=5240    
    ...    descricao=TV 
    ...    quantidade=49974
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}      ${response.json()} 

Cadastrar sem nome do produto
    ${body}    Create Dictionary    
    ...    nome=${EMPTY}   
    ...    preco=12    
    ...    descricao=TV 29 polegadas    
    ...    quantidade=10
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}      ${response.json()}

Cadastrar sem preço do produto
    ${body}    Create Dictionary    
    ...    nome=Produto   
    ...    preco=${null}   
    ...    descricao=TV 29 polegadas     
    ...    quantidade=12
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}      ${response.json()}

Cadastrar sem descricao do produto
    ${body}    Create Dictionary    
    ...    nome=Produto   
    ...    preco=20    
    ...    descricao=${EMPTY}    
    ...    quantidade=10
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}      ${response.json()}


Cadastrar sem quantidade do produto
    ${body}    Create Dictionary    
    ...    nome=Produto   
    ...    preco=20    
    ...    descricao=TV 29 polegadas     
    ...    quantidade=${null}
    Set Global Variable                ${body}    
    Criar Sessão na ServeRest
    Fazer uma chamada POST com autenticacao na rota "/produtos"
    Log    ${response.json()}
    Set Test Variable    ${RESPONSE}      ${response.json()}


Consultar os dados do novo produto
    GET Endpoint na api     /produtos
    Log      ${response.status_code}
    Log      ${response.reason}
    Log      ${response.headers}
    Log      ${response.text}
    Log      ${response.elapsed}
    Log      ${response.json()}
    Set Test Variable    ${RESPONSE_CONSULTA}    ${response.json()}

Buscar por ID os produtos cadastrados
    Realizar login com usuário existente
    Cadastrar um produto criado na ServeRest
    Fazer uma chamada GET com autenticacao na rota    /produtos/${ID}

Criar payload do produto
    [Arguments]    ${body}
    Log    ${body}
    ${body}    Create Dictionary    
    ...        nome=${body["nome"]}  
    ...        preco=${body["preco"]}     
    ...        descricao=${body["descricao"]}    
    ...        quantidade=${body["quantidade"]}
    PUT Endpoint na api    /produtos/${ID} 
    

Fazer edição de um produto cadastrado
    Realizar login com usuário existente
    Cadastrar um produto criado na ServeRest
    Criar payload do produto    ${body}
    