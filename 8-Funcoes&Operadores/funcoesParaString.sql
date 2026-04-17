# 1 - Funções para manipulação de strings (textos) 

/* UPPER() - Maiúsculas -> deixa todas as letras maiúsculas */
-- Transforma todo o nome dos clientes em letras maiúsculas.
SELECT nome, UPPER(nome) AS nome_maiusculo FROM cliente;

/* LOWER() - Minúsculas -> deixa todas as letras miúsculas */
-- Garante que todos os e-mails dos vendedores apareçam em minúsculas (ideal para padronização de login).
SELECT nome, email, LOWER(email) AS email_padronizado FROM vendedor;

/* INITCAP() - Letra Capitular -> primeira letra maiúscula */
-- Deixa a primeira letra de cada palavra maiúscula na descrição do produto.
SELECT descricao, INITCAP(descricao) AS descricao_bonita FROM produto;

/* LENGTH() - Tamanho do Texto -> retorna o tamanho do texto */
-- Conta quantos caracteres tem a descrição de cada produto. Pode ser usado para achar descrições muito curtas.
SELECT descricao, LENGTH(descricao) AS tamanho_descricao FROM produto;

/* SUBSTRING() - Extração de Pedaços -> pega pedaços de uma string */
-- Pega apenas os 3 primeiros caracteres do CPF do cliente.
SELECT nome, cpf, SUBSTRING(cpf FROM 1 FOR 3) AS inicio_cpf FROM cliente;

/* REPLACE() - Substituição de Caracteres -> troca caracteres */
-- Remove o traço do CPF dos clientes, substituindo-o por nada (vazio).
SELECT cpf, REPLACE(cpf, '-', '') AS cpf_sem_traco FROM cliente;

/* CONCAT() (ou `||`) - Concatenação (Junção) -> junta(concatena) caracteres */
-- Cria uma frase amigável juntando o nome do cliente e seu telefone.
SELECT nome, fone, CONCAT(nome, ' - Contato: ', fone) AS info_contato FROM cliente;
-- Alternativa: nome || ' - Contato: ' || fone

/* SPLIT_PART() - Divisão por delimitador */
-- Extrai apenas o primeiro nome do cliente (divide por espaço e pega a primeira parte). 
SELECT nome, SPLIT_PART(nome, ' ', 1) AS primeiro_nome FROM cliente;

/* POSITION() / STRPOS() - Posição de um Caractere */
-- Descobre em qual posição está o arroba (`@`) no e-mail do cliente.
SELECT email, POSITION('@' IN email) AS posicao_arroba FROM cliente;

/* RIGHT() e LEFT() - Pegando pelas bordas */
-- Pega apenas os últimos 2 dígitos do CPF do cliente usando a função RIGHT (disponível nas versões recentes do Postgres).
SELECT nome, cpf, RIGHT(cpf, 2) AS digito_verificador FROM cliente;