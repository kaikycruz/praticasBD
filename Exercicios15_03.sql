-- Exercício 1

USE sprint2;

CREATE TABLE País (
idPais int primary key auto_increment,
nome varchar(30),
capital varchar(40)
);

CREATE TABLE atleta (
idAtleta int primary key auto_increment,
nome varchar(40),
modalidade varchar(40),
qtdMedalha int
);

insert into País values
(null, 'Brasil', 'Brasília'),
(null, 'EUA', 'Washington'),
(null, 'Inglaterra', 'Londres'),
(null, 'França', 'Paris');

select * from País;

insert into atleta values 
(null, 'Neymar', 'Futebol', 20),
(null, 'Michael Felps', 'Natação', 19),
(null, 'Ronaldo', 'Futebol', 25),
(null, 'Rudy Goubert', 'Basquete', 5),
(null, 'Lebron James', 'Basquete', 25),
(null, 'XUXA', 'Natação', 15);

select * from atleta;

alter table atleta add column fkPais int,
	add constraint fkP foreign key (fkPais)
		references País(idPais);
        
update atleta set fkPais = 1
	where idAtleta = 1;
    
update atleta set fkPais = 2
	where idAtleta = 2;
    
update atleta set fkPais = 1
	where idAtleta = 3;
    
update atleta set fkPais = 4
	where idAtleta = 4;
    
update atleta set fkPais = 3
	where idAtleta = 5;
    
update atleta set fkPais = 1
	where idAtleta = 6;
    
    
select * from atleta;

select * from atleta join País
	on fkPais = idPais;
    
select
atleta.nome as nomeAtleta,
País.nome as nomePais
	from atleta join País
		on fkPais = idPais;
        

select 
atleta.nome as nomeAtleta,
atleta.qtdMedalha as medalhas,
País.nome as nomePais,
País.capital as Capital
from atleta join País
	on fkPais = idPais
    where capital = 'Brasília';
    
 
 
 -- Exercício 2
 
use sprint2;

create table album (
idAlbum int primary key auto_increment,
nome varchar(45),
tipo varchar(45),
	constraint chkTipo check( tipo in( 'digital', 'fisico')),
dtLancamento date
);

create table musica (
idMusica int primary key auto_increment,
titulo varchar(40),
artista varchar(40),
genero varchar(40),
fkAlbum int, constraint fkAlb foreign key (fkAlbum)
	references album(idAlbum)
);


insert into album values
(null, 'Dois', 'fisico', '1986-05-18'),
(null, 'Nevermind', 'digital', '1991-09-24'),
(null, 'V', 'digital', '2014-02-05');


insert into musica values
(null, 'Animals', 'Maroon 5', 'POP', 3),
(null, 'Maps', 'Maroon 5', 'POP', 3),
(null, 'Tempo Perdido', 'Legião Urbana', 'ROCK', 1),
(null, 'Índios', 'Legião Urbana', 'ROCK', 1),
(null, 'Come As You Are', 'Nirvana', 'ROCK', 2),
(null, 'Smells Like Teen Spirit', 'Nivarna', 'ROCK', 2);


select * from album;
select * from musica;

update musica set fkAlbum = 2
	where idMusica = 1;
    
update musica set fkAlbum = 2
	where idMusica = 2;
    
update musica set fkAlbum = 3
	where idMusica = 3;
    
update musica set fkAlbum = 3
	where idMusica = 4;
    
update musica set fkAlbum = 1
	where idMusica = 5;
    
update musica set fkAlbum = 1
	where idMusica = 6;
    
select * from musica join album
	on fkAlbum = idAlbum;
    
select
musica.titulo as tituloMusica,
album.nome as nomeAlbum
from musica join album
	on fkAlbum = idAlbum;
    
select 
musica.titulo as tituloMusica,
musica.artista as Artista,
musica.genero as generoMusica,
album.tipo as tipoAlbum,
album.nome as nomeAlbum
	from musica join album
		on fkAlbum = idAlbum
			where tipo = 'digital';

