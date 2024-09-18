-- Exibir as bases de dados
show databases;

-- criar base de dados (data base)
create database if not exists pizzaria;

-- apagar database
drop database if exists pizzaria;

-- utilizar a base de dados
use pizzaria;

-- criar tabela de clientes
create table if not exists clientes (
id int auto_increment not null primary key,
nome varchar(30) ,
telefone varchar (14),
logradouro varchar (30),
numero int,
complemento varchar (30),
bairro varchar (30),
referencia varchar (30)
);

-- tabela de pizzas

create table if not exists pizzas (
id int not null auto_increment primary key,
nome varchar (30),
descricao varchar (100),
valor decimal (15,2)
);

-- tabela de pedidos
create table if not exists pedidos (
id int not null auto_increment primary key,
cliente_id integer not null,
data datetime,
valor decimal(15,2)
);

-- tabela de pedidos_item
create table if not exists itens_pedidos (
pedido_id integer,
pizza_id integer,
quantidade int,
valor decimal (15,2),
foreign key (pizza_id)
references Pizzas (id),
foreign key (pedido_id)
references Pedidos (id),
primary key (pedido_id, pizza_id)
);

insert into clientes (telefone, nome, logradouro, numero, complemento,
bairro, referencia) 
values ('(11) 1111-1111', 'Alexandre Santos', 'Rua das Palmeiras', 111, Null, 'Bela Vista', 'Em frente a escola');
insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(22) 2222-2222', 'Bruna Dantas', 'Rua das Rosas', 222, Null, 'Canteira', Null);
insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(33) 3333-3333', 'Bruno Vieira', 'Rua das Avencas', 333, Null, 'Bela Vista', Null);
insert into clientes (telefone,nome, logradouro, numero, complemento, bairro, referencia)
values ('(44) 4444-4444', 'Giulia Silva', 'Rua dos Cravos', 4444, Null, 'Canteira', 'Esquina do mercado');
insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(55) 5555-5555', 'José Silva', 'Ruadas Acácias', 555,Null, 'Bela Vista', Null);
insert into clientes (telefone, nome, logradouro, numero, complemento, bairro, referencia)
values ('(66) 6666-6666', 'Laura Madureira', 'Rua das Gardências', 666, Null, 'Cantareira', Null);

insert into pizzas (nome, valor)
values ('Provolone', 17), ('Portuguesa', 15), ('4 queijos', 20), ('Calabresa', 17);
insert into pizzas (nome) values ('Escarola');
alter table pizzas modify valor decimal (15,2) default 99;
insert into pizzas (nome) values ('Moda da Casa');

insert into pedidos (id, cliente_id, data, valor)
values (1, 1, '2016-12-15 20:30:00', 32),
(2, 2, '2016-12-15 20:38:00', 40),
(3, 3, '2016-12-15 20:59:00', 22 ),
(4, 1, '2016-12-17 22:00:00', 42),
(5, 2, '2016-12-18 19:00:00', 45),
(6, 3, '2016-12-18 21:12:00', 44),
(7, 4, '2016-12-19 22:22:00', 72),
(8, 6, '2016-12-19 22:26:00', 34.0);

insert into itens_pedidos (pedido_id, pizza_id, quantidade, valor)
values (1, 1, 1, 15.00),
(1, 4, 1, 17.00),
(2, 3, 2, 40.00),
(3, 5, 1, 22.00),
(4, 3, 1, 20.00),
(4, 5, 1, 22.00),
(5, 1, 3, 45.00),
(6, 5, 2, 44.00),
(7, 1, 2, 30.00),
(7, 3, 1, 20.00),
(7, 5, 1, 22.00),
(8, 4, 2, 34.00);

/*
select [distinct] <colunas>
from <tabelas>
[where condição]
[group by <coluna>]
[having <condição>]
[order by <coluna>]
*/

select * from clientes order by nome, bairro;

-- selecionar todos os valores
select * from pizzas;
select id , nome, valor from pizzas;

-- A Sequencia das colunas podem ser alteradas
select valor, id, nome from pizzas;

-- nome da coluna exibido na resposta do comando pode ser alterado com a cláusula  AS
select id as codigo, nome, valor as 'Valor R$' from pizzas;

-- operações aritiméticas
select 10 + 3, 10 - 3, 10 / 3, 10 * 3;
select 10 + 3 as Soma, 10 - 3 as SUBTRACAO, 10 / 3 as DIVISAO ,10 * 3 as MULTIPLICACAO;

select *, (valor*10)/100 + valor as 'valor com +10%' from pizzas; 
select *, (valor*1.1) as 'valor com +10%' from pizzas;


select * from pizzas;

select * from clientes;

-- alterar o nome da coluna 
alter table clientes change tel telefone varchar(14);

-- alterar o tipo de dados de um campo da tabela
alter table clientes modify tel varchar (14);

-- alterar a tabela
alter table pedidos add foreign key (cliente_id) references clientes (id);

-- exibir a estrutura da tabela
describe pedidos;

-- excluir a tabela
drop table if exists pedidos;

-- exibir tabelas
show tables;

drop database pizzaria;