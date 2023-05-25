USE sprint2;

create table curso (
idCurso int primary key auto_increment,
nome varchar(50),
sigla char(3), constraint chkS check( sigla in('ADS', 'SIS', 'CCO')),
coordenador varchar(45)
);

create table matricula (
ra int primary key auto_increment,
nome varchar(50),
periodo varchar(15), constraint chkP check (periodo in('noturno', 'vespertino', 'manha')),
sala char(3),
fkCurso int, constraint fkC foreign key (fkCurso)
	references curso(idCurso)
);


insert into curso values 
(null, 'Análise e desenvolvimento de sistemas', 'ADS', 'Gerson'),
(null, 'Sistemas da informação', 'SIS', 'Vivian'),
(null, 'Ciência da computação', 'CCO', 'Monica');

insert into matricula values 
(null, 'Kaiky Cruz', 'manha', '3A', 1),
(null , 'Gustavo Medeiros', 'noturno', '2A', 2),
(null, 'Vinicius Inácio', 'vespertino', '1A', 3) ;

select * from curso join matricula on fkCurso = idCurso;

select * from curso join matricula
	on fkCurso = idCurso
		where matricula.ra = 1;
        
select 
matricula.nome as nomeAluno,
curso.nome as nomeCurso,
curso.sigla as siglaCurso,
curso.coordenador as Coordenador,
matricula.sala as SalaAluno
from curso join matricula 
	on fkCurso = idCurso
		where matricula.ra = 1;
