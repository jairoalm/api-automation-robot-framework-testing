*** Settings ***
Documentation           Suite de teste de Login

Resource                ../support/base.robot


*** Test Cases ***
Cenário 01: Logar com o novo usuário criado
    [Tags]    login
    Cadastrar um novo usuário
    Realizar Login com o usuário
    Conferir se o Login ocorreu com sucesso

Cenário 02: Logar com e-mail não cadastrado
    [Tags]    required
    Cadastrar um novo usuário
    Realizar Login com email inválido
    Valida mensagem de cadastrado "Email e/ou senha inválidos"

Cenário 03: Logar sem informar e-mail
    [Tags]    required
    Cadastrar um novo usuário
    Campo email é obrigatorio
    Verifica se campo email foi preenchido corretamente "email não pode ficar em branco"

Cenário 04: Login com email inválido
    [Tags]    required
    Cadastrar um novo usuário
    Email informado é inválido
    Verifica se campo email foi preenchido corretamente "email deve ser um email válido"

Cenário 05: Realizar login sem informar senha
    [Tags]    smoke   
    Cadastrar um novo usuário
    Campo senha é obrigatorio
    Validar Status Code "400"
    Verifica se campo senha foi preenchido corretamente "password não pode ficar em branco"

Cenário 06: Realizar login com senha inválida
    [Tags]    smoke   
    Cadastrar um novo usuário
    Informar senha inválida
    Validar Status Code "401"
    Valida mensagem de cadastrado "Email e/ou senha inválidos"