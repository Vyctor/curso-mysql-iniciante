# Curso de Mysql - Iniciante

- [Curso de Mysql - Iniciante](#curso-de-mysql---iniciante)
  - [O que são bancos de dados?](#o-que-são-bancos-de-dados)
  - [O que é SQL?](#o-que-é-sql)
  - [O que é MySQL?](#o-que-é-mysql)
  - [Relacionando](#relacionando)
    - [CLIENTES](#clientes)
    - [CONTATOS](#contatos)

## O que são bancos de dados?

Banco de dados é o local onde conseguimos armazenar informações. Esses dados são
armazenados em tabelas, que se relacionam com outras tabelas.

## O que é SQL?

SQL é uma Linguagem de Consulta Estruturada (Structured Query Language), ou seja
com ela eu consigo realizar manipulações no banco de dados, como:

- Inserir
- Alterar
- Consultar
- Remover

## O que é MySQL?

MySQL é um SGDB (Sistema de Gerenciamento de Banco de Dados). Surgiu em 1995 e
lançando gratuitamente, para ser melhor que o banco MSQL. Ao se popularizar foi
criada uma empresa MySQL AB, que mantinha o projeto. Em 2008 o projeto começou a
ser mantido pela Oracle, pois a Sun Microsystens comprou a MySQL AB e foi comprada
pela Oracle.
Há um fork chamado MariaDB que foi criado pela comunidade, que não gostou que a
Oracle se tornase mantenedora do MySQL.

## Relacionando

### CLIENTES

- NOME, EMAIL, RG E CPF SÃO ATRIBUTOS DA TABELA.
- CADA REGISTRO É CHAMADO DE TUPLA
- O ID É A CHAVE PRIMÁRIA DE IDENTIFICAÇÃO DE CADA REGISTRO

| ID  | NOME   | E-MAIL            | RG       | CPF         |
| --- | ------ | ----------------- | -------- | ----------- |
| 1   | VYCTOR | VYCTOR@VYCTOR.COM | 12312312 | 12312321321 |

### CONTATOS

- CLIENTE_ID É CHAVE ESTRANGEIRA, QUE FAZ RELACIONAMENTO DE UM REGISTRO EM CLIENTES COM OUTRO(S) EM CONTATOS.

| ID  | CLIENTE_ID | TELEFONE    |
| --- | ---------- | ----------- |
| 1   | 1          | 649999-9999 |
