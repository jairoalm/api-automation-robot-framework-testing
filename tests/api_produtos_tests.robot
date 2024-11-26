*** Settings ***
Documentation           Suite de teste de Login

Resource                ../support/base.robot


*** Test Cases ***
Cenário 01: Cadastrar um novo produto na ServeRest
    [Tags]    produtos
    Cadastrar um novo usuário
    Realizar Login com o usuário
    Cadastrar um produto criado na ServeRest
    Valida mensagem de cadastrado "Cadastro realizado com sucesso"
    # DELETE cadastro com autenticacao    /produtos    ${ID}