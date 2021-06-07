create database DEVSpace;

use devspace;

create table curso(
codCurso INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(280) NOT NULL,
nomeExtenso VARCHAR(2000) NOT NULL,
descricao VARCHAR(5000) NOT NULL,
conteudo VARCHAR(2000) NOT NULL,
requisitos VARCHAR(1000) NOT NULL,
qtdEstrelas INTEGER NOT NULL,
estado varchar(50) NOT NULL,
qtdVagas INTEGER NOT NULL,
valor NUMERIC(9,2)
);

create table imagens(
codImagens INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
principal integer,
caminho varchar(200) not null,
curso_codCurso integer not null,
FOREIGN KEY(curso_codCurso) REFERENCES curso(codCurso)
);

create table usuario(
codusuario INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(280) NOT NULL,
email VARCHAR(2000) NOT NULL,
senha varchar(2000) NOT NULL,
estado varchar(50) NOT NULL,
tipo varchar(100) NOT NULL, 
caminhoImg varchar(200) 
);

create table usuarios(
codusuario INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(280) NOT NULL,
cpf VARCHAR(14),
nasc date,
email VARCHAR(300) NOT NULL,
senha varchar(500) NOT NULL,
status varchar(50) NOT NULL default "Ativo",
cep VARCHAR(9) ,
endereco VARCHAR(500),
numero integer,
complemento VARCHAR(200) ,
bairro VARCHAR(200) ,
cidade VARCHAR(50) ,
estado VARCHAR(50) ,
tipo VARCHAR(50) default "cliente",
caminhoImg varchar(200) 
);

create table compra(
codcompra INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
datacompra date NOT NULL,
formapagamento VARCHAR(100) NOT NULL,
valortotal NUMERIC(9,2) NOT NULL,
cliente_codusuario integer not null,
estado varchar(50) NOT NULL,
FOREIGN KEY(cliente_codusuario) REFERENCES usuarios(codusuario)
);

create table itenscompra(
codItens INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
valorUnitario NUMERIC(9,2) NOT NULL,
curso_codcurso integer not null,
compra_codcompra integer not null,
FOREIGN KEY(compra_codcompra) REFERENCES compra(codcompra), 
FOREIGN KEY(curso_codcurso) REFERENCES curso(codcurso)
);

select * from curso;
select * from imagens;
select * from usuarios;
select * from compra order by datacompra desc;
select * from itenscompra;
SELECT * FROM imagens where curso_codCurso=4 and principal =1;
select email as username, senha as password, estado as enable from usuario where email="teste@teste.com";
select email as username, tipo as authority from usuario where email="teste@teste.com" and estado="Ativo";
select email as username, senha as password, 1 as enable from cliente where email="teste@teste.com";
select email as username, 'cliente' as authority from cliente where email="teste@teste.com";