# Agencia de Projetos SQL

## Projeto usado como avaliação da disciplina Banco de Dados

### Com base em tabelas e dados inseridos no banco, gerar consultas para obter o que pede o enunciado

## Como rodar o projeto
```
Importar o arquivo agenciaDeProjetos.sql no seu banco de dados e executar as consultas o CALL listadas abaixo: 
```

### Selecionar o nome das pessoas vinculadas a cidade de Castro
```
select nome_pessoa from Pessoa natural join Cidade where nome_cidade='Castro';
```
![img](https://i.imgur.com/KkYz1ac.png)

### Selecionas todos os nomes de pessoas que não participam de nenhum projeto
```
select DISTINCT nome_pessoa from Pessoa, realiza_Projeto where Pessoa.cod_pessoa not in (Select
realiza_Projeto.cod_pessoa from realiza_Projeto);
```
![img](https://i.imgur.com/RZAbeJZ.png)


### Selecionar o nome das pessoas que participam de pelo menos 2 projetos
```
select DISTINCT nome_pessoa from Pessoa natural join realiza_Projeto group by cod_pessoa having
count(*)>1
```
![img](https://i.imgur.com/XCCiHR2.png)


### Qual o nome das pessoas que participam do projeto Gama
```
select distinct nome_pessoa from Pessoa inner join Projeto inner join realiza_Projeto on nome_projeto='Gama' and Projeto.cod_projeto=realiza_Projeto.cod_projeto and realiza_Projeto
.cod_pessoa=Pessoa.cod_pessoa;
```
![img](https://i.imgur.com/UFR0QIA.png)


### Quais cidades não possuem projetos
```
select distinct Cidade.nome_cidade from Cidade,Projeto where Cidade.cod_cidade not in (select Projeto.cod_cidade from Projeto);
```
![img](https://i.imgur.com/PaOXar8.png)


#### Para facilitar a execução cada enunciado tem uma call procedure basta executar no banco após importar: 
```
CALL `pessoasCidadeCastro`();

CALL `pessoasNenhumProjeto`();

CALL `pessoasDoisProjetos`();

CALL `pessoasProjetoGana`();

CALL `cidadesNenhumProjeto`();
```
