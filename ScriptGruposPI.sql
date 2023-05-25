create database GruposPI;
use GruposPI;

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
fkGrupo int,
foreign key (fkProfessor) references professor(idProfessor),
foreign key (fkGrupo) references grupo(idGrupo),
primary key (idAvaliacao,fkGrupo,fkProfessor)
);



insert into avaliacao values 
(null, default, 8.5, 10000, 1),
(null, default, 7.5, 10000, 2),
(null, default, 9.5, 10001, 1),
(null, default, 8.5, 10002, 2),
(null, default, 7.5, 10003, 1),
(null, default, 9.5, 10004, 2),
(null, default, 8.5, 10005, 1);


select * from grupo;
select * from aluno;
select * from professor;
select * from avaliacao;

select * from grupo join aluno on fkGrupo = idGrupo;
select * from grupo join aluno on fkGrupo = idGrupo 
where idGrupo = 1;

select avg(nota) from avaliacao;
select min(nota), max(nota) from avaliacao;
select sum(nota) from avaliacao;

select professor.nome as nomeProfessor,
professor.disciplina as Disciplina,
grupo.nome as nomeGrupo,
grupo.descricao as DescricaoProjeto,
avaliacao.dataHora as DataEHora from avaliacao join professor 
on fkProfessor = idProfessor
join grupo on fkGrupo = idGrupo;


select professor.nome as nomeProfessor,
professor.disciplina as Disciplina,
grupo.nome as nomeGrupo,
grupo.descricao as DescricaoProjeto,
avaliacao.dataHora as DataEHora from avaliacao join professor 
on fkProfessor = idProfessor
join grupo on fkGrupo = idGrupo
where idGrupo = 1;

select grupo.nome from avaliacao join grupo
on fkGrupo = idGrupo
join professor on fkProfessor = idProfessor
where professor.nome = 'Caramico';

select * from avaliacao join professor
on fkProfessor = idProfessor
join grupo on fkGrupo = idGrupo;

select distinct nota from avaliacao;

select professor.nome, avg(nota), sum(nota) from avaliacao join professor
on fkProfessor = idProfessor
group by professor.nome;

select grupo.nome, avg(nota), sum(nota) from avaliacao join grupo
on fkGrupo = idGrupo
group by grupo.nome;

select professor.nome, min(nota), max(nota) from avaliacao join professor
on fkProfessor = idProfessor
group by professor.nome;


select grupo.nome, min(nota), max(nota) from avaliacao join grupo
on fkGrupo = idGrupo
group by grupo.nome;

