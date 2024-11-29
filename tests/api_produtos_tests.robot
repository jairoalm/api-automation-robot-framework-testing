*** Settings ***
Documentation           Suite de teste de Login

Resource                ../support/base.robot

Suite Setup        Criar Sessão na ServeRest


*** Test Cases ***
Cenário 01: Cadastrar um novo produto na ServeRest
    [Tags]    produtos
    Cadastrar um novo usuário
    Realizar Login com o usuário
    Cadastrar um produto criado na ServeRest
    Valida mensagem de cadastrado "Cadastro realizado com sucesso"
    # DELETE cadastro com autenticacao    /produtos    ${ID}

Cenário 02: Duplicar cadastro de produto
    Realizar login com usuário existente
    Vou repetir um cadastro de produto
    Valida mensagem de cadastrado "Já existe produto com esse nome"
    
Cenário 03: Cadastro de produto sem informar nome
    Realizar login com usuário existente
    Cadastrar sem nome do produto
    Verifica se campo nome foi preenchido corretamente "nome não pode ficar em branco"

Cenário 04: Cadastro de produto sem informar preço
    Realizar login com usuário existente
    Cadastrar sem preço do produto
    Verifica se campo preço foi preenchido corretamente "preco deve ser um número"

Cenário 05: Cadastro de produto sem informar descricao
    Realizar login com usuário existente
    Cadastrar sem descricao do produto
    Verifica se campo descricao foi preenchido corretamente "descricao não pode ficar em branco"

Cenário 06: Cadastro de produto sem informar quantidade
    Realizar login com usuário existente
    Cadastrar sem quantidade do produto 
    Verifica se campo quantidade foi preenchido corretamente "quantidade deve ser um número"

Cenário 07: Listar todos produtos cadastrados
    [Tags]    search
    GET Endpoint na api    /produtos?nome=Samsung 60 polegadas
    Consultar os dados do novo produto
    Validar Status Code "200"

Cenário 08: Listar produto por nome cadastrado
    [Tags]    search
    GET Endpoint na api    /produtos?nome=Samsung 60 polegadas
    Consultar os dados do novo produto
    Validar Status Code "200"

Cenário 09: Listar produto por preco cadastrado
    [Tags]    search
    GET Endpoint na api    /produtos?preco=5240
    Consultar os dados do novo produto
    Validar Status Code "200"
Cenário 10: Listar produto por descrição cadastrada
    [Tags]    search
    GET Endpoint na api    /produtos?descricao=TV
    Consultar os dados do novo produto
    Validar Status Code "200"
Cenário 11: Listar produto por quantidade cadastrado
    [Tags]    search
    GET Endpoint na api    /produtos?quantidade=49974
    Consultar os dados do novo produto
    Validar Status Code "200"
Cenário 12: Listar produto por ID
    [Tags]    search
    Buscar por ID os produtos cadastrados
    Validar Status Code "200"