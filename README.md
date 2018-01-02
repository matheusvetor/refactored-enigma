# Readme
Este projeto está hospedado no [Heroku](https://afternoon-retreat-47588.herokuapp.com)
Esta aplicação provê uma api de manutenção de registros de Livros e Autores.

## Dependências
* rvm
* ruby 2.5
* postgresql (9 ou superior)
* redis (4 ou superior)
* elasticsearch (6 ou superior)

## Testes Unitários
Os testes unitários foram escritos utilizando Rspec.
Além do Rspec, foram utilizadas outras ferramentas para medir a qualidade do código:
- brakeman (Escaneia a aplicação para encontrar vulnerabilidades) 
- fasterer (Sugestões de melhoria de performance)
- rubocop (Analisa o código e sugere melhorias baseadas no Style Guide da Comunidade Ruby/Rails)
- rubycritic (Analisa a complexidade do código)
- simplecov (Analiza a porcentagem de cobertura de teste do código)

Execute rake para rodar toda suite de testes
```bundle exec rake```

## Continuous Integration
Este repositório está configurado para executar os scripts de Integração Contínua a cada push.
O status da build pode ser acompanhada pelos botões a seguir:
[![Build Status](https://travis-ci.org/matheusvetor/refactored-enigma.svg?branch=master)](https://travis-ci.org/matheusvetor/refactored-enigma) [![Coverage Status](https://coveralls.io/repos/github/matheusvetor/refactored-enigma/badge.svg?branch=master)](https://coveralls.io/github/matheusvetor/refactored-enigma?branch=master)
## Rodando a aplicação
Clone a aplicação
```git clone https://github.com/matheusvetor/refactored-enigma.git```
Então entre na pasta
```cd refactored-enigma```
O RVM irá alternar para a versão 2.5.0 do ruby ou informará o comando para a instalação
```rvm install ruby-2.5.0```
Rode o bundle para instalar as dependências do projeto
```bundle install```
O Sidekiq precisa estar rodando para em conjunto com a aplicação para realizar processamento em background
```bundle exec sidekiq```
Em seguida, basta executar o Servidor Web
```rails s```
## Api
Esta aplicação é uma Api Rest e possui os seguintes recursos
### Paginação
Requisições que retornem multiplos registros estão limitados por padrão a 20 registros por página. Você pode acessar outras págin usando o parâmetro ```page```, você pode também incrementar a quantidade de registros retornados em cada requisição usando o parâmetro ```per_page```.
Ex.:
```sh
curl -X GET "https://afternoon-retreat-47588.herokuapp.com/api/v1/authors?per_page=1&page=2"
```
### Authors
#### **GET** - /api/v1/authors
```sh
curl -X GET "https://afternoon-retreat-47588.herokuapp.com/api/v1/authors?per_page=1&page=2"
```
##### Query Parameters
- **per_page**:
```
{
  "type": "string",
  "enum": [
    "1"
  ]
}
```
- **page**:
```
{
  "type": "string",
  "enum": [
    "2"
  ]
}
```

#### **POST** - /api/v1/authors
```sh
curl -X POST "https://afternoon-retreat-47588.herokuapp.com/api/v1/authors?name=Matheus%20Vetor"
```
##### Query Parameters
- **name** (Campo Obrigatório):
```
{
  "type": "string",
  "enum": [
    "Matheus Vetor"
  ]
}
```
### Books
#### **GET** - /api/v1/books/
```sh
curl -X GET "https://afternoon-retreat-47588.herokuapp.com/api/v1/books?per_page=1&page=1"
```
##### Query Parameters
- **per_page**:
```
{
  "type": "string",
  "enum": [
    "1"
  ]
}
```
- **page**:
```
{
  "type": "string",
  "enum": [
    "1"
  ]
}
```

#### **POST** - /api/v1/books
```sh
curl -X POST "https://afternoon-retreat-47588.herokuapp.com/api/v1/books?author_id=3&name=Book%20Name&description=Book%20Description&tag_list=a%2C%20b%2C%20c"
```
##### Query Parameters
- **\*author_id** (Campo Obrigatório):
```
{
  "type": "string",
  "enum": [
    "3"
  ]
}
```
- **name** (Campo Obrigatório):
```
{
  "type": "string",
  "enum": [
    "Book Name"
  ]
}
```
- **description**:
```
{
  "type": "string",
  "enum": [
    "Book Description"
  ]
}
```
- **tag_list**:
```
{
  "type": "string",
  "enum": [
    "a, b, c"
  ]
}
```

#### **GET** - /api/v1/books/:id
```sh
curl -X GET "https://afternoon-retreat-47588.herokuapp.com/api/v1/books/1"
```
#### **Response**
```
{
  "id": 1,
  "name": "Author Name"
}
```
#### **PUT** - /api/v1/books/:id

```sh
curl -X PUT "https://afternoon-retreat-47588.herokuapp.com/api/v1/books/1?name=Novo%20Nome&description=Nova%20descri%C3%A7%C3%A3o"
```
#### Query Parameters
- **name**:
```
{
  "type": "string",
  "enum": [
    "Novo Nome"
  ]
}
```
- **description**:
```
{
  "type": "string",
  "enum": [
    "Nova descrição"
  ]
}
```
#### **GET** - /api/v1/books/search

```sh
curl -X GET "https://afternoon-retreat-47588.herokuapp.com/api/v1/books/search?query=nome"
```

##### Query Parameters
- **query**:
```
{
  "type": "string",
  "enum": [
    "nome"
  ]
}
```
#### **Response**
```
[
  {
    "id":3,
    "name":"Novo Nome",
    "description":"Nova descrição",
    "isbn":"399520836-3",
    "published_at":null,
    "tag_list":"a, b, c",
    "author": {
      "id":3,
      "name":"dOb3KYqcLRaJNfWMAButiA=="
    }
  }
]
```
