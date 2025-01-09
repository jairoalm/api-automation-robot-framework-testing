*** Settings ***
Documentation            Ações da API de carrinho de compras

Resource                ../../support/base.robot


*** Keywords ***
Adicionar produtos no carrinho
    ${body}    Create Dictionary
    ...        idProduto=${ID}
    ...        quantidade=2
    ${produtos}   Create List          ${body}
    Log    ${produtos}
    ${body}    Create Dictionary    produtos=${produtos}
    Set Global Variable    ${body}
    Fazer uma chamada POST com autenticacao na rota "/carrinhos"

Valida mensagem do carrinho de produto "${message}"
    Log    ${message}    
    Dictionary Should Contain Item    ${response.json()}    message    ${message}