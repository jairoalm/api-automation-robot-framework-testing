*** Settings ***
Documentation            Armazenar keywords usando no projeto

Resource                ../../support/base.robot

*** Keywords ***
POST Endpoint na api "${route}"
    ${response}    POST On Session    alias=ServeRest    url=${route}    json=${body}    expected_status=ANY   verify=${False}
    Log To Console    Response: ${response.content}
    Set Test Variable    ${response}

GET Endpoint na api "${route}"
    ${response}            GET On Session    alias=ServeRest    url=${route}/${ID_USUARIO}    expected_status=ANY   verify=${False}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

PUT Endpoint na api "${route}"
    ${response}            PUT On Session    alias=ServeRest    url=&{route}/${ID_USUARIO}    json=${body}    expected_status=ANY   verify=${False}
    Log To Console         Response: ${response.content}
    Set Global Variable    ${response}

DELETE Endpoint na api "${route}"
    ${response}        DELETE On Session        alias=ServeRest    url=${route}/${ID_USUARIO}    expected_status=ANY   verify=${False}
    Log To Console    Response: ${response.content}
    Set Global Variable    ${response}

Validar Status Code "${statuscode}"
    Status Should Be    ${statuscode}