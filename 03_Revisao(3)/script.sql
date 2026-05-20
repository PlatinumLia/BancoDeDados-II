-- Criando o banco de dados
CREATE DATABASE universo;

-- Criando um tipo de dado
CREATE TYPE tipo_superficie_enum AS ENUM ('sólido', 'líquido', 'gasoso');

-- Criando as primeiras tabelas (sem PK e FK (será arrumado depois))
CREATE TABLE galaxias(
    id INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE especies(
    id INTEGER,
    nome VARCHAR(50)
);

CREATE TABLE planetas (
    id INTEGER,
    nome VARCHAR(50),
    id_galaxia INTEGER,
    id_especie INTEGER,
    tipo_superficie tipo_superficie_enum,
    habitado BOOLEAN,
    massa FLOAT,
    circunferencia NUMERIC(15,2)
);

-- Alterações:
-- Adicionando chaves primárias:
/* Forma número 1: */
ALTER TABLE galaxias ADD PRIMARY KEY (id);
ALTER TABLE especies ADD PRIMARY KEY (id);

/* Forma número 2:
(pode dar um nome)
*/
ALTER TABLE planetas ADD CONSTRAINT pk_planetas PRIMARY KEY (id);

-- Adicionando chave estrangeira
ALTER TABLE planetas ADD CONSTRAINT fk_galaxia FOREIGN KEY (id_galaxia) REFERENCES galaxias (id);
ALTER TABLE planetas ADD CONSTRAINT fk_especie FOREIGN KEY (id_especie) REFERENCES especies (id);

-- Criando um gerador (funciona como serial, e já define como PK (usado para caso esqueça de definir na hora da criação da tabela))
ALTER TABLE galaxias ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE especies ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;
ALTER TABLE planetas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY;

--Alterando a tabela para adicionar uma coluna
ALTER TABLE planetas ADD COLUMN tipo_climatico VARCHAR(50);

-- Alterando nome de tabelas e colunas
ALTER TABLE especies RENAME TO especies_inteligentes;
ALTER TABLE planetas RENAME COLUMN tipo_climatico TO clima;
ALTER TABLE planetas ALTER COLUMN massa TYPE NUMERIC (10,2);

-- Teste para criar e remover tabelas
CREATE TABLE teste(
    id SERIAL PRIMARY KEY,
    descricao VARCHAR(50)
);

DROP TABLE teste;


--Inserindo dados
INSERT INTO galaxias (nome) VALUES ('Via Láctea');
INSERT INTO especies_inteligentes (nome) VALUES ('Humanos');
INSERT INTO planetas (id, nome, id_galaxia, id_especie, massa, circunferencia, clima, tipo_superficie, habitantes) VALUES (1, 'Planeta Terra', 1, 1, 5.97);