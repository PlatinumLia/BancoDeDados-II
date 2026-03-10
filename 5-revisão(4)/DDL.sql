-- =========================
-- CRIAÇÃO DAS TABELAS
-- =========================

CREATE TABLE especies (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE galaxias (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE planetas (
    id INTEGER PRIMARY KEY,
    nome VARCHAR(100),
    habitantes NUMERIC,
    idEspecie INTEGER,
    idGalaxia INTEGER,
    CONSTRAINT fk_especie
        FOREIGN KEY (idEspecie)
        REFERENCES especies(id),
    CONSTRAINT fk_galaxia
        FOREIGN KEY (idGalaxia)
        REFERENCES galaxias(id)
);

-- Exercício: criar outras tabelas (Estrelas e Satélites)

CREATE TABLE estrelas (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    tamanho NUMERIC,
    idGalaxia INTEGER,
    CONSTRAINT fk_galaxia
        FOREIGN KEY (idGalaxia) 
        REFERENCES galaxias(id)
);

CREATE TABLE satelites (
    id SERIAL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    diametro NUMERIC,
    idPlaneta INTEGER,
    CONSTRAINT fk_planeta
        FOREIGN KEY (idPlaneta)
        REFERENCES planetas(id)
);

-- Alterando a estrutura das tabelas

-- Tabela estrela:
ALTER TABLE estrelas RENAME COLUMN tamanho TO massa;

-- Tabela satélite
ALTER TABLE satelites ALTER COLUMN diametro TYPE NUMERIC(10,2);
ALTER TABLE satelites ADD COLUMN habitavel BOOLEAN;