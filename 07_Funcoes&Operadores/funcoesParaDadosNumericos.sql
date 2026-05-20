# 2 - Funções para tipos de dados numéricos

/* Operadores Matemáticos Básicos (+, -, *, /) */
-- Calcula o preço do produto subtraindo o valor do desconto.
SELECT descricao, preco, desconto, (preco - desconto) AS preco_final FROM produto;

/* ROUND() - Arredondamento com casas decimais */
-- Aplica um acréscimo de 10% no preço dos produtos e arredonda para 2 casas decimais.
SELECT descricao, preco, ROUND((preco * 1.10), 2) AS preco_com_acrescimo FROM produto;

/* TRUNC() - Truncamento (corta sem arredondar) */
-- Corta os centavos do salário do vendedor, retornando apenas a parte inteira.
SELECT nome, salario, TRUNC(salario, 0) AS salario_inteiro FROM vendedor;

/* CEIL() - Arredondamento para Cima */
-- Exibe o valor da comissão do vendedor sempre arredondado para o próximo número inteiro acima.
SELECT nome, comissao, CEIL(comissao) AS comissao_teto FROM vendedor;

/* FLOOR() - Arredondamento para Baixo */
-- Exibe a comissão do vendedor sempre arredondada para o número inteiro abaixo.
SELECT nome, comissao, FLOOR(comissao) AS comissao_piso FROM vendedor;

/* MOD() - Resto da Divisão */
-- Verifica se a quantidade em estoque do produto é par ou ímpar (se o resto da divisão por 2 for 0, é par).
SELECT descricao, qtde, MOD(qtde, 2) AS resto_divisao_por_2 FROM produto;

/* POWER() - Potenciação */
-- Apenas como exemplo matemático, eleva a quantidade do item vendido ao quadrado. 
SELECT id_produto, qtde, POWER(qtde, 2) AS qtde_ao_quadrado FROM item_venda;

/* ABS() - Valor Absoluto (Sempre positivo) */
-- Garante que o resultado de uma subtração não seja negativo (ex: diferença entre quantidade mínima e quantidade em estoque).
SELECT descricao, qtde, qtde_min, ABS(qtde_min - qtde) AS diferenca_absoluta FROM produto;

/* GREATEST() - O maior valor de uma lista */
-- Compara a `qtde` atual com a `qtde_min` e retorna qual dos dois números é o maior. 
SELECT descricao, qtde, qtde_min, GREATEST(qtde, qtde_min) AS maior_valor FROM produto;

/* LEAST() - O menor valor de uma lista */
-- Compara a quantidade máxima permitida (`qtde_max`) e a atual, retornando a menor.
SELECT descricao, qtde, qtde_max, LEAST(qtde, qtde_max) AS menor_valor FROM produto;