-- Aula 01

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

-- Aula 02

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


-- Aula 03

ALTER TABLE estado ADD COLUMN regiao VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO' AFTER nome;

ALTER TABLE estado MODIFY COLUMN regiao VARCHAR(100) NOT NULL AFTER sigla;

ALTER TABLE estado CHANGE regiao regiao_estado VARCHAR(100) NOT NULL;
ALTER TABLE estado MODIFY COLUMN regiao_estado VARCHAR(100) NOT NULL DEFAULT 'VALOR NÃO INFORMADO';

ALTER TABLE estado DROP CONSTRAINT ativo_estado_S_ou_N;

ALTER TABLE estado MODIFY COLUMN ativo ENUM('S','N') NOT NULL;

INSERT INTO estado (nome, sigla, ativo) VALUES ('TOCANTINS','TO','S');

# DESC estado;


/**

-- Aula 04 - Padrão nomenclatura **

-- Aula 05
/**
DROP DATABASE IF EXISTS aula_banco; -- se existir elimine aula_banco
CREATE DATABASE aula_banco; 		-- criar aula_banco
USE aula_banco;						-- selecionar aula_banco

CREATE TABLE estado( 				-- criando a tabela estado
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200) NOT NULL UNIQUE  
,sigla CHAR(2) NOT NULL UNIQUE
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,CONSTRAINT pk_estado PRIMARY KEY (id)  
);

CREATE TABLE cidade (				-- criando a tabela cidade
id INT NOT NULL AUTO_INCREMENT
,nome VARCHAR(200)  NOT NULL
,ativo ENUM('S','N') NOT NULL DEFAULT 'S'
,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
,estado_id INT NOT NULL 
,CONSTRAINT pk_cidade PRIMARY KEY (id)
,CONSTRAINT fk_cidade_estado FOREIGN KEY (estado_id) REFERENCES estado (id)
,CONSTRAINT cidade_unica UNIQUE(nome, estado_id)
);

-- SINTAXE INSERT COMPLETO
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'PARANÁ','PR','S','2020-12-20');

-- INSERT COM DEFAULT
INSERT INTO estado (id,nome,sigla,ativo,data_cadastro) VALUES (DEFAULT,'SÃO PAULO','SP',DEFAULT, DEFAULT);

-- INSERT COM COLUNAS ESPECÍFICAS
INSERT INTO estado (nome,sigla) VALUES ('MATO GROSSO','MT');

-- INSERT NA CIDADE - COLUNAS COM FK
INSERT INTO cidade (nome,estado_id) VALUES ('CURITIBA',1);
INSERT INTO cidade (nome,estado_id) VALUES ('PARANAVAÍ',10);

-- INSERT DE VÁRIOS REGISTROS - SOMENTE MySQL
INSERT INTO cidade (nome,estado_id) VALUES ('BAURU',2), ('LONDRINA',1), ('GUARULHOS', 2);

/*
Possíveis erros no INSERT - tire do comentário para testar
INSERT INTO estado (nome) VALUES ('CE'); -- gera ERRO pq não informamos o nome, e nome é NOT NULL/obrigatório
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ','PR'); -- gera erro pq já existe PARANÁ - nome é UNIQUE
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ 2','PR'); -- gera erro pq já existe PR - sigla é UNIQUE
INSERT INTO estado (nome,sigla) VALUES ('PARANÁ 2','PR2'); -- gera erro pq PR está definido para 2 caracteres
INSERT INTO estado (nome, sigla, ativo) VALUES ('CEARÁ','CE', 88);-- gera erro pq ativo é ENUM que aceita somete S ou N
INSERT INTO cidade (nome, estado_id) VALUES ('SALVADOR',15);-- gera erro pq estado_id é uma FK/Chave Estrangeira. Em FK, o SGBD valida, de forma que, impeça o cadastro de um refência de Estado que não existe

SELECT * FROM estado;
SELECT * FROM cidade;
**/



/**
--------------------------------------------------------------------------------------------------------------------------------------------
-- inserindo estados 

/* primeira forma de inserção
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','PARANÁ','PR','S','2015-2-25');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','ACRE','AC','S','2017-01-22');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','TOCANTINS','TO','S','2018-03-01');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','ALAGOAS','AL','S','2018-04-25');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','SERGIPE','SE','S','2019-03-12');
INSERT INTO estado (id, nome, ativo, data_cadastro) VALUES ('NULL','AMAPÁ','AP','S','2022-05-15');
*/
/* segunda forma de inserção
INSERT INTO estado VALUES ('NULL','PARANÁ','PR','S','2015-2-25');
INSERT INTO estado VALUES ('NULL','SÃO PAULO','SP','S','2015-10-31');
INSERT INTO estado VALUES ('NULL','ACRE','AC','S','2017-01-22');
INSERT INTO estado VALUES ('NULL','TOCANTINS','TO','S','2018-03-01');
INSERT INTO estado VALUES ('NULL','ALAGOAS','AL','S','2018-04-25');
INSERT INTO estado VALUES ('NULL','SERGIPE','SE','S','2019-03-12');
INSERT INTO estado VALUES ('NULL','AMAPÁ','AP','S','2022-05-15');
*/
/* terceira forma de inserção
INSERT INTO estado (nome, sigla) VALUES ('PARANÁ','PR');
INSERT INTO estado (nome, sigla) VALUES ('SÃO PAULO','SP');
INSERT INTO estado (nome, sigla) VALUES ('ACRE','AC');
INSERT INTO estado (nome, sigla) VALUES ('TOCANTINS','TO');
INSERT INTO estado (nome, sigla) VALUES ('ALAGOAS','AL');
INSERT INTO estado (nome, sigla) VALUES ('SERGIPE','SE');
INSERT INTO estado (nome, sigla) VALUES ('AMAPÁ','AP');
*/

-- inserindo cidades 

/* primeira forma de inserção
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','MARINGÁ','2022-05-15',1); 
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','SÃO PAULO','2022-05-15',2); 
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','RIO BRANCO','2022-05-15',3); 
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','PALMAS','2022-05-15',4); 
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','ANADIA','2022-05-15',5); 
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','ARACAJU','2022-05-15',6);
INSERT INTO cidade (id, nome, ativo, data_cadastro,estado_id) VALUES (NULL,'S','MACAPÁ','2022-05-15',7);
*/
/* segunda forma de inserção
INSERT INTO cidade VALUES (NULL,'S','MARINGÁ','2022-05-15',1); 
INSERT INTO cidade VALUES (NULL,'S','SÃO PAULO','2022-05-15',2);
INSERT INTO cidade VALUES (NULL,'S','RIO BRANCO','2022-05-15',3);
INSERT INTO cidade VALUES (NULL,'S','PALMAS','2022-05-15',4); 
INSERT INTO cidade VALUES (NULL,'S','ANADIA','2022-05-15',5); 
INSERT INTO cidade VALUES (NULL,'S','ARACAJU','2022-05-15',6);
INSERT INTO cidade VALUES (NULL,'S','MACAPÁ','2022-05-15',7);
*/
/* terceira forma de inserção
INSERT INTO cidade (nome, estado_id) VALUES ('MARINGÁ',1);
INSERT INTO cidade (nome, estado_id) VALUES ('SÃO PAULO',2);
INSERT INTO cidade (nome, estado_id) VALUES ('RIO BRANCO',3; 
INSERT INTO cidade (nome, estado_id) VALUES ('PALMAS',4); 
INSERT INTO cidade (nome, estado_id) VALUES ('ANADIA',5);
INSERT INTO cidade (nome, estado_id) VALUES ('ARACAJU',6);
INSERT INTO cidade (nome, estado_id) VALUES ('MACAPÁ',7);----------------------------------------------------------------------------------
*/

#aula 06 UPDATE e DELETE

#UPDATE cidade SET ativo = 'N';
UPDATE cidade SET ativo = 'N' WHERE estado_id = 2;
DELETE FROM estado WHERE id = 5;

#aula07 - CONSULTAS

/**
SELECT 
	estado.id
	,estado.nome 
    ,estado.sigla 
    ,estado.data_cadastro 
FROM 	
	estado;
**/

#aula08 - JOIN

SELECT 	
	cidade.id 'ID DA CIDADE'
    ,cidade.nome 'NOME DA CIDADE'
    ,estado.sigla 'SIGLA DO ESTADO'
FROM estado, cidade
WHERE cidade.estado_id = estado.id
	AND estado.nome = 'ACRE';

-- SQL 92
SELECT 
	cidade.id 'ID DA CIDADE'
    ,cidade.nome 'NOME DA CIDADE'
    ,estado.sigla 'SIGLA DO ESTADO'
FROM estado
JOIN cidade ON cidade.estado_id = estado.id 
WHERE estado.nome = 'MINAS GERAIS';

SELECT * FROM cidade;
SELECT * FROM estado;