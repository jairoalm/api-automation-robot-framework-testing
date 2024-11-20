*** Settings ***

Resource        ../support/base.robot

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TEST}    status_code=201
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um usuário existente
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TEST}    status_code=201
    Vou repetir o cadastro do usuário
    Validar Status Code "400"
    Verificar se a API não permitiu o cadastro repetido

Cenário 03: Consultar os dados de um novo usuário
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest    email=${EMAIL_TEST}    status_code=201
    Consultar os dados do novo usuario
    Validar Status Code "200"
    Conferir os dados do novo usuario