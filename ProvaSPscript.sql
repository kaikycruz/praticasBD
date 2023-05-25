create database Venda;
use venda;

create table endereco (
idEndereco int primary key auto_increment,
cep varchar(9),
logradouro varchar(45),
cidade varchar(45),
uf char(2),
numero varchar(45)
)auto_increment = 1000;


insert into endereco values 
(null, '03635-001', 'Avenida Paulista', 'Sao Paulo', 'SP', 444),
(null, '03600-101', 'Rua Augusta', 'Sao Paulo', 'SP', 1234),
(null, '00985-001', 'Ibirapuera', 'Sao Paulo', 'SP', 786),
(null, '03699-981', 'Tatuape', 'Sao Paulo', 'SP', 1502);

select * from endereco;


create table cliente (
idCliente int primary key auto_increment,
nome varchar(45),
email varchar(45), constraint chkEmail check(email like '%@%'),
fkEnd int,
constraint fkEndereco foreign key (fkEnd) references endereco(idEndereco),
fkIndicador int,
constraint fkClienteIndicador foreign key (fkIndicador) references cliente(idCliente)
);


insert into cliente values 
(null, 'Kaiky Cruz', 'Kaiky.sousa@sptech.school', 1000, null),
(null, 'Gustavo Medeiros', 'gustavo.medeiros@sptech.school', 1001, null);

insert into cliente values 
(null, 'Matheus Anjos', 'matheus.anjos@sptech.school', 1002, 1),
(null, 'Gabriel Yukio', 'gabriel.yukio@sptech.school', 1003, 1),
(null, 'Joao Vitor', 'joao.vitor@sptech.school', 1003, 2),
(null, 'Tiaki Wauke', 'tiaki.wauke@sptech.school', 1002, 2);


select * from cliente;


create table venda (
idVenda int auto_increment,
totalVenda decimal(8,3),
dataVenda date,
fkCliente int,
constraint fkClien foreign key (fkCliente) references cliente(idCliente),
constraint pk primary key (idVenda, fkCliente)
);  


insert into venda values
(null, 289.55, '2023-02-15', 1),
(null, 200.10, '2023-10-01',2),
(null, 150.00, '2023-11-09', 3),
(null, 86.90, '2023-05-02', 4),
(null, 459.20, '2023-12-25', 5),
(null, 190.75, '2023-11-24', 6),
(null, 300.99, '2023-07-29', 1);


select * from venda;


create table produto (
idProduto int primary key auto_increment,
nome varchar(45),
descricao varchar(45),
valorProduto decimal(8,3),
fkVenda int,
constraint fkVen foreign key (fkVenda) references venda(idVenda)
);


insert into produto values 
(null, 'Camisa nike', 'Roupa', 289.55, 1),
(null, 'Camisa adidas', 'Roupa', 200.10, 2),
(null, 'Teclado', 'Eletronico', 150.00, 3),
(null, 'Moletom', 'Roupa', 86.90, 4),
(null, 'SSD', 'Eletronico', 459.20, 5),
(null, 'Camisa nike', 'Roupa', 190.75, 6),
(null, 'Tenis nike', 'Sapato', 300.99, 7);


create table compra (
fkCliente int,
fkProduto int,
fkVenda int,
idCompra int,
qtdProduto int,
valorDesconto decimal(5,3),
constraint fkCli foreign key (fkCliente) references cliente(idCliente),
constraint fkPro foreign key (fkProduto) references produto(idProduto),
constraint fkVen foreign key (fkVenda) references venda(idVenda),
constraint pkQua primary key (fkCliente, fkProduto, fkVenda, idCompra)
)auto_increment = 10;


insert into compra values 
(1, 1, 1, 10, 2, 15.00),
(1, 7, 7, 11, 1, 10.00),
(2, 2, 2, 12, 2, 20.00),
(3, 3, 3, 13, 1, 21.00),
(4, 4, 4, 14, 1, 5.00),
(5, 5, 5, 15, 1, 35.00),
(6, 6, 6, 16, 2, 25.00);


select * from compra;


select * from cliente join venda
on fkCliente = idCliente;

select * from cliente join venda
on fkCliente = idCliente
where cliente.nome = 'Kaiky Cruz';

select * from cliente as Indicador join Cliente
on cliente.fkIndicador = indicador.idCliente;

select * from cliente as Indicador join Cliente
on cliente.fkIndicador = indicador.idCliente
where indicador.nome = 'Kaiky Cruz';

select * from cliente as Indicador join Cliente
on cliente.fkIndicador = indicador.idCliente
join venda on fkCliente = idCliente
join produto on fkVenda = idVenda;

select venda.dataVenda,
produto.nome,
produto.qtdVenda
from venda join produto
on fkVenda = idVenda;

select venda.dataVenda,
produto.nome,
produto.qtdVenda = (select sum(qtdVenda) from produto)
from venda join produto
on fkVenda = idVenda
where produto.nome = 'Camisa nike';


select min(valorProduto) from produto;

select max(valorProduto) from produto;

select sum(valorProduto) from produto;

select avg(valorProduto) from produto;

select sum(distinct valorPoduto) from produto;

select * from venda join
produto on idVenda = fkProduto
	where valorProduto = (select sum(valorProduto) from produto);