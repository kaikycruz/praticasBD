create database praticas;
drop database praticas;

use pratica;

create table hotel (
idHotel int primary key auto_increment,
nome varchar(45),
CEP varchar(45),
numero int,
fkMatriz int,
foreign key (fkMatriz) references hotel(idHotel)
);


create table quarto (
idQuarto int auto_increment,
nome varchar(45),
tipo varchar(45), 
constraint chkTipo check( tipo = 'casal' or tipo = 'solteiro'),
andar int,
fkHotel int,
foreign key (fkHotel) references hotel(idHotel),
primary key (idQuarto, fkHotel)
);


insert into hotel values 
(null, 'SPTech', '12312-001', 504, null),
(null, 'Ibis', '12456-012', 333, null);


insert into hotel values
(null, 'Consultoria', '12312-111', 704 , 1),
(null, 'IbisSP', '12322-132', 334 , 2),
(null, 'Lojinha', '12312-002', 503 , 1);


select * from hotel;


insert into quarto values 
(null, 'mario', 'solteiro', 15, 4);


select * from hotel join quarto
on fkHotel = idHotel;

update quarto set nome = 'Luigi' where idQuarto = 1 and fkHotel = 4;

alter table hotel add constraint chkHotel check(idHotel <> fkMatriz);

select * from hotel as filial join hotel as matriz
on filial.fkMatriz = matriz.idHotel
join quarto on filial.idHotel = quarto.fkHotel;

drop table quarto;
drop table hotel;

create table ator (
idAtor int primary key auto_increment,
nome varchar(45),
dtNasc date,
fkDuble int,
foreign key (fkDuble) references ator(idAtor)
);


insert into ator values
(null, 'ayrton senna', '1976-09-26', null),
(null, 'Vivian Silva', '1970-10-29', null);

insert into ator values 
(null, 'Milton Neves', '1978-07-01', 1),
(null, 'Milton Nascimento', '1977-11-25', 1),
(null, 'Caio Santos', '1990-04-19', 2),
(null, 'WIlliam Sousa', '1991-03-20', 2);


select * from ator;


select * from ator as ator join ator as duble
on ator.fkDuble = duble.idAtor;

select * from ator as Ator join ator as Duble
on Ator.fkDuble = Duble.idAtor
order by Ator.nome desc;

select ator.nome,
ator.dtNasc,
duble.nome,
duble.dtNasc
From ator as ator join ator as duble
on ator.fkDuble = duble.idAtor;

select ator.nome,
ator.dtNasc,
duble.nome,
duble.dtNasc
from ator as ator join ator as duble
on ator.fkDuble = duble.idAtor
where ator.nome like 'M%'
order by duble.nome desc;
