*** Settings ***
Documentation           Suite de teste de Login

Resource                ../support/base.robot


*** Test Cases ***
Cenário 04: Logar com o novo usuário criado
    [Tags]    login
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TEST}  status_code=201
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso

Cenário 05: Logar com e-mail não cadastrado
    [Tags]    required
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TEST}  status_code=201
    Realizar Login com email inválido
    Valida que usuário não esta cadastrado "Email e/ou senha inválidos"

Cenário 06: Logar sem informar e-mail
    [Tags]    required
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TEST}  status_code=201
    Campo email é obrigatorio
    Verifica se campo email foi preenchido corretamente "email não pode ficar em branco"

Cenário 07: Login com email inválido
    [Tags]    required
    Criar um usuário novo
    Cadastrar o usuário criado na ServeRest  email=${EMAIL_TEST}  status_code=201
    Email informado é inválido
    Verifica se campo email foi preenchido corretamente "email deve ser um email válido"