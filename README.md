# Projeto da API da Serverest

O ServeRest é uma API REST gratuita que simula uma loja virtual com intuito de servir de material de estudos de testes de API.

## Índce
- <a href="#funcionalidades">Funcionalidades do Projeto</a>
- <a href="#documentacao">Documentação da API</a>
- <a href="#tecnologias">Tecnologias Utilizadas</a>
- <a href="#bibliotecas">Bibliotecas Existentes no Projeto</a>
- <a href="#dependencias">Instalção de Dependências</a>
- <a href="#rodar">Como Executar o Projeto</a>
- <a href="#pessoas">Autores</a>

## Funcionalidades do Projeto
- [x] Cadastro de Usuário
- [x] Login
- [x] Cadastro de Produtos
- [x] Carrinho de Compras

## Documentação da API
- [x] [API Serverest](https://serverest.dev/#/)

## Tecnologias Utilizadas
- [x] [Node.js](https://nodejs.org/en/download/prebuilt-installer)
- [x] [Robot framework](https://robotframework.org/)
- [x] [Python](https://www.python.org/downloads/)

## Bibliotecas Existentes no Projeto
- [x] [requests](https://pypi.org/project/requests/)
- [x] [robotframework](https://robotframework.org/?tab=1#getting-started)
- [x] [robotframework-jsonlibrary](https://pypi.org/project/robotframework-jsonlibrary/)
- [x] [robotframework-requests](https://github.com/MarketSquare/robotframework-requests#readme)
- [x] [jsonschema](https://pypi.org/project/jsonschema/)

## Instalações de dependências

```
- git clone <link_projeto>
- pip install requirements.txt
```

## Como Executar o projeto
```
- Excutar projeto completo
    - robot -d .\logs tests
- Executar por tags
    - robot -d .\logs -i <tags> tests
    - robot -d .\logs -i <tags> tests\<file_test>.robot
- Executar com arquivo especifico
    - robot -d .\logs tests\<file_test>.robot
```

## Autores
- [x] [Linkedin](https://www.linkedin.com/in/jairoalmeidamonteiro/)