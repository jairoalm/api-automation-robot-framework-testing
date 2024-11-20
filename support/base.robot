*** Settings ***
Documentation        Armazenar toda base do projeto
Library            RequestsLibrary
Library            String
Library            Collections

Resource        ../resources/ms-usuarios/api_testing_usuarios.resource
Resource        ../resources/ms-login//api_testing_login.resource
Resource        ../support/common/common_keyword.robot

*** Keywords ***
Criar Sessão na ServeRest
    ${headers}    Create Dictionary    accept=application/json    Content-Type=application/json
    Create Session    alias=ServeRest    url=https://serverest.dev    headers=${headers}