# Projeto da API da Serverest

Um ecommerce para testadores

## Índce
- <a href="#funcionalidades">Funcionalidades do Projeto</a>
- <a href="#tecnologias">Tecnologias Utilizadas</a>
- <a href="#bibliotecas">Bibliotecas Existentes no Projeto</a>
- <a href="#dependencias">Instalção de Dependências</a>
- <a href="rodar">Como Executar o Projeto</a>

## Funcionalidades do Projeto

## Tecnologias Utilizadas

## Bibliotecas Existentes no Projeto
- requests
- robotframework
- robotframework-jsonlibrary
- robotframework-requests
- jsonschema

## Instalações de dependências
pip install requirements.txt

## Como Executar o projeto
- Excutar projeto completo
    - robot -d .\logs tests
- Executar por tags
    - robot -d .\logs -i <tags> tests
    - robot -d .\logs -i <tags> tests\<file_test>.robot
- Executar com arquivo especifico
    - robot -d .\logs tests\<file_test>.robot