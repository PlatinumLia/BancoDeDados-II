/* USANDO NA SHELL */
CREATE DATABASE revisao; -- Cria banco de dados

\c revisao -- Conectar no banco
\d -- Listar tabelas

CREATE TABLE aluno( -- Cria tabela aluno
    /* Colunas da tabela */
    id SERIAL PRIMARY KEY NOT NULL, -- Chave primaria(identificador) 
    nome VARCHAR(80) NOT NULL,
    email VARCHAR(255) NOT NULLCREATE DATABASE revisao;

);

INSERT INTO aluno(nome, email)
VALUES
('GABRIEL SANTOS', 'gab.santos@gmail.com'),
('VINICIUS RAMBO', 'rambo.vini@gmail.com'),
('LUIS FELIPE', 'felipe.luis@gmail.com');


/* USANDO PgAdmin (apenas exportando os scripts para registro) */
CREATE TABLE public.disciplina
(
    id serial NOT NULL,
    nome character varying(80) NOT NULL,
    curso character varying(20) NOT NULL,
    PRIMARY KEY (id)
);

INSERT INTO disciplina(nome, curso)
VALUES
('REDES', 'TADS'),
('BANCO DE DADOS', 'TADS');

CREATE TABLE public.matricula
(
    id_aluno integer NOT NULL,
    id_disciplina integer NOT NULL,
    ano integer NOT NULL,
    PRIMARY KEY (id, id_aluno, id_disciplina, ano),
    FOREIGN KEY (id_aluno)
        REFERENCES public.aluno (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (id_disciplina)
        REFERENCES public.disciplina (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

INSERT INTO matricula(id_aluno, id_disciplina, ano)
VALUES
(1001, 2, 2026),
/* Testes de Integridade */
-- (1005, 1, 2026) *aluno não existe
-- (1, 10, 2026) *disciplina não existe
-- (1, 1, 20266) *Para o banco isso não é um erro, por falta de tratamento ele aceita
(1001, 1, 2026);

/* Tratamento(restrições) de dados */
ALTER TABLE IF EXISTS public.matricula
    ADD CHECK (ano > 2025)
    NOT VALID;

ALTER TABLE IF EXISTS public.matricula
    ADD CHECK (ano < 2030)
    NOT VALID;