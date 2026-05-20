CREATE DATABASE techflow;

CREATE TABLE categoria(
    id SERIAL PRIMARY KEY NOT NULL,
    categoria VARCHAR(20) NOT NULL,
    cod_serie VARCHAR(20) NOT NULL
);

CREATE TABLE marca(
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    cod_marca VARCHAR(20) NOT NULL
);

CREATE TABLE endereco(
    id SERIAL PRIMARY KEY NOT NULL,
    cep VARCHAR(20) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    cidade VARCHAR(80) NOT NULL,
    rua VARCHAR(80) NOT NULL,
    numero VARCHAR(20) NOT NULL
);

CREATE TABLE cliente(
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    cpf VARCHAR(11) NOT NULL,
    email VARCHAR(80) NOT NULL
    telefone VARCHAR(10) NOT NULL,
    FOREIGN KEY (id_endereco) REFERENCES public.endereco (id) MATCH SIMPLE 
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE produto(
    id SERIAL PRIMARY KEY NOT NULL,
    nome  VARCHAR(80) NOT NULL,
    descricao TEXT NOT NULL,
    preco FLOAT NOT NULL,
    quantidade INT NOT NULL,
    cod_serie VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_categoria) REFERENCES public.categoria (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (id_marca) REFERENCES public.marca (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE fornecedor(
    id SERIAL PRIMARY KEY NOT NULL,
    nome VARCHAR(80) NOT NULL,
    cnpj VARCHAR(14) NOT NULL,
    contato VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_produto) REFERENCES public.produto (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE pagamento(
    id SERIAL PRIMARY KEY NOT NULL,
    status_pag VARCHAR(9) NOT NULL,
    formato_pag VARCHAR(20) NOT NULL,
)

CREATE TABLE venda(
    id serial PRIMARY KEY NOT NULL,
    data_venda DATE NOT NULL,
    valor FLOAT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES public.cliente (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    FOREIGN KEY (id_pagamento) REFERENCES public.pagamento (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);

CREATE TABLE item_venda(
    id SERIAL PRIMARY KEY NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario FLOAT NOT NULL,
    FOREIGN KEY (id_venda) REFERENCES public.venda (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
);


