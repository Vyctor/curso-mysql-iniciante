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

# Chave estrangeira
create table pedidos(
    id int primary key,
    produto_id int not null,
    quantidade int not null,
    foreign key(produto_id) references produtos(id)
);

# Alterando tabelas
alter table
    pedidos
add
    column total double;

# Removendo colunas
alter table
    pedidos drop column total;

# Adicionando constraints (restrições)
alter table
    clientes
add
    column cpf varchar(20);

alter table
    clientes constraint cpf_unico UNIQUE(cpf);
    
# Modificando tamanho
alter table
    clientes
modify
    cpf varchar(14) not null;

# Adicionando valor padrão
alter table pedidos alter column total set default 0;

# Removendo valor padrão
alter table pedidos alter column total drop default;

# Inserindo registros
insert into clientes(
    id, nome, email, cpf
) values(1, "Vyctor", "dev.vyctor@gmail.com", "123.123.123-12");

insert into clientes(2, "Mario", "mario@mario.com", "111.111.111.11");

# Alterando registros
update clientes set nome="Vyctor Guimaraes" where id=1;

# Buscando registros
select nome from clientes;

# Alias
insert into clientes values(3, "José", "jose@jose.com.br", "321.511-513-12");
insert into clientes values(4, "Maria Silva", "maria@silvax.com.br", "333.555-091-22");

select id as "Código", nome as Nome from clientes;

# Distinct
alter table clientes add column uf char(2);
update clientes set uf="RJ";
select DISTINCT uf from clientes;

# Order By
select * from clientes ORDER BY nome DESC;

# Where
SELECT * FROM clientes WHERE uf <> 'SP' ORDER BY nome DESC;

insert into produtos values(1, 'Produto 1', 100);
insert into produtos values(2, 'Produto 2', 150);
insert into produtos values(3, 'Produto 3', 200);
insert into produtos values(4, 'Produto 4', 450);

select * from produtos where preco > 50 and preco < 200;
select * from produtos where preco <= 150;

# Like
insert into produtos values(5, "Dell XPS", 10000);
insert into produtos values(6, "Macbook Pro M2", 20000);
insert into produtos values(7, "HP", 4000);
insert into produtos values(8, "Dell XPS Premium", 12500);

select * from produtos where nome like 'Produto%';
select * from produtos where nome like 'Mac%';
select * from produtos where nome like 'Dell%';

# Funções
select count(*) from produtos;
select max(preco) as preço from produtos;
select min(preco) as preco from produtos;
select avg(preco) as preco from produtos;
select sum(preco) as preco from produtos;

# Group
select uf, count(*) as Quantidade de clientes from clientes group by uf;

# Join
insert into pedidos values(1,1,2,100);

select pedidos.id, nome, quantidade, preco as valor unitario, total from pedidos, produtos where pedidos.produto_id = produtos.id;

# Criando primeira procedure
select * from INFORMATION_SCHEMA.ROUTINES;

CREATE PROCEDURE PRIMEIRA()
BEGIN 
    SELECT 'Minha primeira rotina';
END;

CALL PRIMEIRA();

# Criando procedure de pedido
alter table produtos add column estoque int;
update produtos set estoque=10;
select * from produtos;

DELIMITER &&
CREATE PROCEDURE faz_pedido(produto_id int, quantidade int, valor double)
BEGIN    
	insert into pedidos values(produto_id, quantidade, valor);
	update produtos set estoque=estoque-quantidade where id = produto_id;
END &&
DELIMITER ;

CALL faz_pedido(2,3,300);

# Views
create view view_clientes_go AS select * from clientes where uf='GO';
select * from view_clientes_go;