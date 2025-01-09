*** Settings ***
Documentation               Testes das ações do carrinho de compras

Resource            ../support/base.robot
Resource            ../resources/ms-carrinho/api_testing_carrinho.resource

Suite Setup        Criar Sessão na ServeRest

*** Test Cases ***

Cenário 01: Adicionar no produto ao carrinho
    [Tags]    carrinho
    Cadastrar um novo usuário
    Realizar Login com o usuário
    Cadastrar um produto criado na ServeRest
    Adicionar produtos no carrinho    
    Validar Status Code "201"
    Valida mensagem do carrinho de produto "Cadastro realizado com sucesso"


Cenário 01: Listar todos carrinhos cadastrados
    [Tags]    itens
    GET Endpoint na api    /carrinhos
