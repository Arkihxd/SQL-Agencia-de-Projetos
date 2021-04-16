create table Cidade(
cod_cidade int not null,
nome_cidade varchar(45) not null,
PRIMARY KEY(cod_cidade)
);

create table Pessoa(
cod_pessoa int not null,
nome_pessoa varchar(45) not null,
cod_cidade int not null,
FOREIGN KEY(cod_cidade) references Cidade(cod_cidade),
PRIMARY KEY(cod_pessoa)
);

create table Projeto(
cod_projeto int not null,
nome_projeto varchar(45) not null,
cod_cidade int not null,
FOREIGN KEY(cod_cidade) references Cidade(cod_cidade),
PRIMARY KEY(cod_projeto)
);

create table realiza_Projeto(
cod_pessoa int not null,
cod_projeto int not null,
FOREIGN KEY(cod_pessoa) references Pessoa(cod_pessoa),
FOREIGN KEY(cod_projeto) references Projeto(cod_projeto),
PRIMARY KEY(cod_pessoa, cod_projeto)
);

INSERT INTO Cidade values (1,'Castro');
INSERT INTO Cidade values (2,'Curitiba');
INSERT INTO Cidade values (3,'Ponta Grossa');
INSERT INTO Cidade values (4,'Ventania');
INSERT INTO Cidade values (5,'Paranagua');
INSERT INTO Cidade values (6,'Matinhos');

INSERT INTO Pessoa values (1,'Joao', 1);
INSERT INTO Pessoa values (2,'Carlos', 2);
INSERT INTO Pessoa values (3,'Ana', 1);
INSERT INTO Pessoa values (4,'Claudia', 2);
INSERT INTO Pessoa values (5,'Maria', 1);
INSERT INTO Pessoa values (6,'Tereza', 1);
INSERT INTO Pessoa values (7,'Anderson', 3);
INSERT INTO Pessoa values (8,'Jose', 4);
INSERT INTO Pessoa values (9,'Ricardo', 5);
INSERT INTO Pessoa values (10,'Beatriz',5);

INSERT INTO Projeto values (1,'Alfa',6);
INSERT INTO Projeto values (2,'Beta',1);
INSERT INTO Projeto values (3,'Gama',2);
INSERT INTO Projeto values (4,'Teta',2);

INSERT INTO realiza_Projeto values (1,1);
INSERT INTO realiza_Projeto values (1,2);
INSERT INTO realiza_Projeto values (2,3);
INSERT INTO realiza_Projeto values (3,3);
INSERT INTO realiza_Projeto values (4,2);
INSERT INTO realiza_Projeto values (4,1);
INSERT INTO realiza_Projeto values (7,3);
INSERT INTO realiza_Projeto values (9,3);
INSERT INTO realiza_Projeto values (10,1);

select nome_pessoa from Pessoa natural join Cidade where nome_cidade='Castro';
select DISTINCT nome_pessoa from Pessoa, realiza_Projeto where Pessoa.cod_pessoa not in (Select realiza_Projeto.cod_pessoa from realiza_Projeto);
select DISTINCT nome_pessoa from Pessoa natural join realiza_Projeto group by cod_pessoa having count(*)>1;
select distinct  nome_pessoa from Pessoa inner join Projeto inner join realiza_Projeto on nome_projeto='Gama' and Projeto.cod_projeto=realiza_Projeto.cod_projeto and realiza_Projeto .cod_pessoa=Pessoa.cod_pessoa;
select distinct Cidade.nome_cidade from Cidade,Projeto where Cidade.cod_cidade not in (select Projeto.cod_cidade from Projeto);










	