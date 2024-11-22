*** Settings ***

Resource        ../support/base.robot

*** Variables ***

*** Test Cases ***
Cenário 01: Cadastrar um novo usuário com sucesso na ServeRest
    Cadastrar um novo usuário
    Conferir se o usuário foi cadastrado corretamente

Cenário 02: Cadastrar um novo usuário sem informar nome
    [Tags]    required
    Cadstrar novo usuario sem informar nome
    Validar Status Code "400"
    Verifica se campo nome foi preenchido corretamente "nome não pode ficar em branco"
Cenário 03: Cadastrar um novo usuário sem informar email
    [Tags]    required
    Cadstrar novo usuario com email inválido    email=${EMPTY}
    Validar Status Code "400"
    Verifica se campo email foi preenchido corretamente "email não pode ficar em branco"

Cenário 04: Cadastrar um novo usuário informando email invalido
    [Tags]    required
    Cadstrar novo usuario com email inválido    email=teste$teste.com.br
    Validar Status Code "400"
    Verifica se campo email foi preenchido corretamente "email deve ser um email válido"

Cenário 05: Cadastrar um novo usuário sem informar senha
    [Tags]    required
    Cadstrar novo usuario sem informar senha
    Validar Status Code "400"
    Verifica se campo senha foi preenchido corretamente "password não pode ficar em branco"

Cenário 06: Cadastrar um novo usuário informando administrador invalido
    [Tags]    required
    Cadstrar novo usuario com administrador invalido    administrador=${EMPTY}
    Validar Status Code "400"
    Verifica se campo administrador foi preenchido corretamente "administrador deve ser 'true' ou 'false'"

Cenário 07: Cadastrar um novo usuário informando administrador com textos
    [Tags]    required
    Cadstrar novo usuario com administrador invalido    administrador=teste
    Validar Status Code "400"
    Verifica se campo administrador foi preenchido corretamente "administrador deve ser 'true' ou 'false'"

Cenário 08: Cadastrar um novo usuário informando administrador com números
    [Tags]    required
    Cadstrar novo usuario com administrador invalido    administrador=12345
    Validar Status Code "400"
    Verifica se campo administrador foi preenchido corretamente "administrador deve ser 'true' ou 'false'"

Cenário 09: Cadastrar um novo usuário informando administrador com caraceteres especiais
    [Tags]    required
    Cadstrar novo usuario com administrador invalido    administrador=12345
    Validar Status Code "400"
    Verifica se campo administrador foi preenchido corretamente "administrador deve ser 'true' ou 'false'"

Cenário 10: Cadastrar um usuário existente
    Cadastrar um novo usuário
    Vou repetir o cadastro do usuário
    Validar Status Code "400"
    Verificar se a API não permitiu o cadastro repetido

Cenário 11: Consultar os dados de um novo usuário
    Cadastrar um novo usuário
    Consultar os dados do novo usuario
    Validar Status Code "200"
    Conferir os dados do novo usuario