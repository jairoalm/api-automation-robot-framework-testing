*** Settings ***
Documentation               Testes das ações do carrinho de compras

Resource            ../support/base.robot

Suite Setup        Criar Sessão na ServeRest

*** Test Cases ***

Cenário 01: Adicionar no produto ao carrinho
    [Tags]    carrinho
    Cadastrar um novo usuário
    Realizar Login com o usuário
    Cadastrar um produto criado na ServeRest
    ${body}    Create Dictionary
    ...        idProduto=${ID}
    ...        quantidade=2
    ...    
    ${produtos}   Create List          ${body}
    ${payload}    Create Dictionary    produtos=${produtos}
    Set Global Variable    ${payload}
    Fazer uma chamada POST com autenticacao na rota "/carrinhos"
    Validar Status Code "201"
    Valida mensagem de cadastrado "Cadastro realizado com sucesso"


Cenário 01: Listar todos carrinhos cadastrados
    [Tags]    itens
    GET Endpoint na api    /carrinhos
