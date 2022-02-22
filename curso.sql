# Criando banco de dados
create database curso_mysql;

# Selecionando tabela
use curso_mysql;

# Criando tabelas
create table clientes(
	id int not null primary key,
  nome varchar(45) not null,
  email varchar(100) not null
);

create table produtos(
	id int not null primary key,
    nome varchar(100) not null,
    preco double not null
);