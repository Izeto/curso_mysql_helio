DROP DATABASE IF EXISTS banco_de_dados;

CREATE DATABASE banco_de_dados;

USE banco_de_dados;

DROP TABLE IF EXISTS estado;

CREATE TABLE estado(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,sigla CHAR(2) NOT NULL UNIQUE
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,CONSTRAINT pk_estado PRIMARY KEY (id)
,CONSTRAINT ativo_estado_S_ou_N CHECK (ativo IN ('S','N'))
);

INSERT INTO estado(nome, sigla) VALUES ('ACRE','AC');
INSERT INTO estado(nome, sigla) VALUES ('SANTA CATARINA','SC');
INSERT INTO estado(nome, sigla) VALUES ('MINAS GERAIS','MG');
INSERT INTO estado(nome, sigla) VALUES ('MATO GROSSO','MT');

DROP TABLE IF EXISTS cidade;

CREATE TABLE cidade(
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,ativo CHAR(1) NOT NULL DEFAULT 'S'
,estado_id INT NOT NULL UNIQUE
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT ativo_cidade_S_ou_N CHECK (ativo IN ('S','N'))
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
);

INSERT INTO cidade(nome, estado_id) VALUES ('RIO BRANCO', 1);
INSERT INTO cidade(nome, estado_id) VALUES ('FLORIANÓPOLIS', 2);
INSERT INTO cidade(nome, estado_id) VALUES ('BELO HORIZONTE', 3);
INSERT INTO cidade(nome, estado_id) VALUES ('CUIABÁ', 4);

CREATE TABLE cliente (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT
,nome VARCHAR(255) NOT NULL
,cpf VARCHAR(20) NOT NULL UNIQUE
,telefone VARCHAR(20) NOT NULL UNIQUE
);

INSERT INTO cliente (nome, cpf, telefone) VALUES ('AMANDA', '127.436.759-10','1234-5678');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('JONES','129.836.563-91','8765-4321');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('RODRICK','247.432.714.-12','4002-8922');



-- 1 LISTA - AULA 6

/*
INSERT -Lista Exercício 
Caso queira fazer na prática, execute o script do link: https://github.com/heliokamakawa/curso_bd/blob/master/05a-SELECT%20-%20script%20aula.sql
*/

-- 1) Escreva o comando para inserir um registro da tabela estado com todas as colunas. 
#INSERT INTO estado VALUES (NULL,'ACRE','AC','S','2021-05-01'); 

INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES (NULL,'PARANÁ','PR','S','2015-02-25');

/* 
Como id é um campo com auto incremento, definimos NULL no comando.
Como estamos inserindo todas as colunas não precisamos informar a descrição das colunas. 
Porém, devemos informar os dados na sequência correta 
**/ 

-- 2) Escreva o comando para inserir um registro da tabela estado, definindo todos os dados, exceto a  chave primária que é auto incremento.  
#INSERT INTO estado (nome,sigla,ativo,data_cadastro) 
#VALUES ('ALAGOAS','AL','S','2021-05-02'); 

INSERT INTO estado (nome, ativo, data_cadastro) VALUES ('TOCANTINS','TO','S','2018-03-01');

-- Como não estamos informando todos os dados, é necessário especificar de quais colunas são 

-- 3) Escreva o comando para inserir um registro da tabela estado, definindo somente os dados  necessários.  
#INSERT INTO estado (nome,sigla) VALUES ('AMAPÁ','AP'); 

INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO','MT');

/** 
id → não precisa informar porque é auto incremento  
ativo e data_cadastro → não precisa informar porque possui o valor padrão  
**/ 

-- 4) Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
-- O registro de uma cidade requer a referência do estado (cidade é dependente  do estado). Assim, é necessário, primeiro, fazer a inserção dos estados. 
#INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'ACRELANDIA',1,'S','2021-04-28'); 
#INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('ASSIS  BRASIL',1,'S','2021-03-14'); 
#INSERT INTO cidade (nome,estado_id) VALUES ('BRASILEIA',1);

INSERT INTO cidade (id,nome,estado_id,ativo,data_cadastro) VALUES (NULL, 'CUIABÁ',1,'S','2019-05-25');
INSERT INTO cidade (nome,estado_id,ativo,data_cadastro) VALUES ('CUIABÁ',1,'S','2019-05-25'); 
INSERT INTO cidade (nome, estado_id) VALUES ('CUIABÁ', 4);

/*
AGORA É A SUA VEZ!!!! Para que você aprenda, é muito importante que não copie e cole,  digite os comandos e mentalize o que está fazendo na medida que digita cada comando. Uma dica  importante é que você digite primeiro no bloco de notas, com intuito de testar se realmente  consegue digitar os comandos sem a ajuda do IDE – depois teste os comandos. 
5. Escreva o comando para inserir 3 registros da tabela estado com todas as colunas. 
6. Escreva o comando para inserir 2 registros da tabela estado, definindo todos os dados, exceto a chave  primária que é auto incremento. 
7. Escreva o comando para inserir 2 registros da tabela estado, definindo somente os dados necessários. 
8. Escreva o comando para inserir registros da tabela cidade das 3 formas apresentadas nos exercícios  anteriores.  
9. Faça a inserção de 2 registros de cliente.  
10. DESAFIO!!! Tente fazer todas as inserções necessárias para que se tenha um item de caixa. Na medida  que esteja digitando o código, tente associar os dados inseridos com o contexto real.
*/

-- 5
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES (NULL,'GOIÁS','GO','S','2018-02-21');

-- 6
INSERT INTO estado (nome, ativo, data_cadastro) VALUES ('MINAS GERAIS','MG','S','2015-06-23');

-- 7
INSERT INTO estado (nome, sigla) VALUES ('MATO GROSSO','MT');

-- 8
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES (NULL,'SANTA CATARINA','SC','S','2018-03-01');
INSERT INTO estado (nome, ativo, data_cadastro) VALUES ('SANTA CATARINA','SC','S','2018-03-01');
INSERT INTO estado(nome, sigla) VALUES ('SANTA CATARINA','SC');

-- 9
INSERT INTO cliente (nome, cpf, telefone) VALUES ('RAQUEL', '127.436.759-14','1274-5678');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('JOSÉ','149.826.573-61','8735-9621');
INSERT INTO cliente (nome, cpf, telefone) VALUES ('MOISÉS','277.232.764.-18','3602-8962');

-- 2 LISTA - AULA 8
INSERT INTO estado(nome, sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado(nome, sigla) VALUES ('CEARÁ','CE');
UPDATE estado SET nome = 'AMAZONAS', sigla = 'AM' WHERE id = 1;
DELETE FROM cidade WHERE estado_id = 1;
SELECT id, nome, sigla FROM estado;
SELECT id, nome, sigla, ativo, data_cadastro FROM estado;

-- 3 LISTA - AULA 9
-- 01 - O que é JOIN? Quando é necessário? Um comando do Mysql, utilizado para apresentar a união de 2 ou mais tabelas, com possibilidade de especificar as tabelas.
-- 02 - Qual a sintaxe do JOIN? Maiúscula ou minúscula faz diferença? Existe algum padrão? Explique. Por ser um comando, ele segue o padrão de ser sempre em maiúsculo, fazendo total diferença na identificação e compreensão do script.
-- 07 - O que é análise semântica e de sintaxe? Qual a diferença? Para que serve? Ambas se assemelham, pois tem haver com os caracteres e estrutura, sendo uma para analise, significado e compreensão dos comandos e outra para estruturação dos mesmos.
-- 06 - Para realizar o JOIN de 1523 tabelas, quantas comparações de junções são necessárias? Explique. A cada JOIN é necessário uma comparação que justifique o mesmo. JOIN é a junção das tabelas, significa que para acontecer uma junção de tabela, deve existir uma condição para executar tal junção.
