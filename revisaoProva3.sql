create database revisandoProva3;
use revisandoProva3;

create table grupo (
idGrupo int primary key auto_increment,
nome varchar(45),
descricao varchar(45)
);

insert into grupo values
(null, 'Grupo 6', 'Controle de temp/umi no transp de morango'),
(null, 'Grupo 5', 'Controle de temp/umi no transp de carne');

create table aluno (
Ra char(8) primary key,
nome varchar(45),
email varchar(45), constraint chkEmail check(email like '%@%'),
fkGrupo int,
foreign key (fkGrupo) references grupo(idGRupo)
);

insert into aluno values 
('01231007', 'Kaiky Cruz', 'kaiky.sousa@sptech.school', 1),
('01231015', 'Gustavo Medeiros', 'gustavo.medeiros@sptech.school', 1),
('01231001', 'Matheus Anjos', 'matheus.anjos@sptech.school', 2),
('01231011', 'Gabriel Yukio', 'gabriel.yukio@sptech.school', 2);

create table professor (
idProfessor int primary key auto_increment,
nome varchar(45),
disciplina char(2), constraint chkDisc check (disciplina in('PI', 'BD', 'AL', 'TI', 'AC', 'SE'))
)auto_increment=10000;


insert into professor values
(null, 'Caramico', 'PI'),
(null, 'Vivian', 'BD'),
(null, 'Caio', 'AL'),
(null, 'Mônica', 'TI'),
(null, 'Eduardo', 'AC'),
(null, 'Kaline', 'SE');


create table avaliacao(
idAvaliacao int auto_increment,
dataHora datetime default current_timestamp,
nota float,
fkProfessor int,
foreign key (fkProfessor) references professor(idProfessor),
fkGrupo int,
foreign key (fkGrupo) references grupo (idGrupo),
primary key (idAvaliacao,fkGrupo, fkProfessor)
);


insert into avaliacao values 
(null, default, 8.5, 10000, 1),
(null, default, 7.5, 10000, 2),
(null, default, 9.5, 10001, 1),
(null, default, 8.5, 10002, 2),
(null, default, 7.5, 10003, 1),
(null, default, 9.5, 10004, 2),
(null, default, 8.5, 10005, 1);


select * from aluno join grupo
on fkGrupo = idGrupo;

select * from aluno join grupo
on fkGrupo = idGrupo
where aluno.nome like '%Kaiky%';

-- quantidades
select count(nota) from avaliacao;

-- min e max
select max(nota) from avaliacao;
select min(nota) from avaliacao;

-- soma
select sum(nota) from avaliacao;

-- media
select avg(nota) from avaliacao;

-- arredondamentos
select round(avg(nota), 1) from avaliacao;
select round(avg(nota), 2) from avaliacao;

-- soma
select sum(distinct nota) from avaliacao;
select sum(nota) from avaliacao where fkGrupo = 1 group by fkGrupo; 

-- quantidades
select count(nota) from avaliacao where fkGrupo = 1 group by fkGrupo;

-- Arredondamento
select truncate(avg(nota), 1) from avaliacao;

update professor set nome =  'Rayssa' where idProfessor = 10005;
select * from professor;

alter table professor add column email varchar(45);
desc professor;

alter table professor add constraint chkEmailPro check(email like '%@%');

insert into professor (email) values
('fernandacaramico@sptech.school');

insert into professor (email) values
('fernandacaramico#sptech.school');

select * from professor;

update professor set email = 'fernandacaramico@sptech.school' where idProfessor = 10000;
update professor set email = 'vivianSilva@sptech.school' where idProfessor = 10001;
update professor set email = 'caiosantos@sptech.school' where idProfessor = 10002;
update professor set email = 'monicaherrero@sptech.school' where idProfessor = 10003;
update professor set email = 'eduardoverri@sptech.school' where idProfessor = 10004;
update professor set email = 'rayssasilva@sptech.school' where idProfessor = 10005;

select * from professor;

delete from professor where idProfessor = 10006;