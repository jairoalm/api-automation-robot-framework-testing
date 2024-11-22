*** Settings ***

Resource        ../support/base.robot

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Cadastrar um novo usuário
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário existente
    Cadastrar um novo usuário
    Vou repetir o cadastro do usuário
    Validar Status Code "400"
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    Cadastrar um novo usuário
    Consultar os dados do novo usuario
    Validar Status Code "200"
    Conferir os dados do novo usuario