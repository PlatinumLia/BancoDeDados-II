# 3 - Funções de data e hora

/* CURRENT_DATE e CURRENT_TIMESTAMP - Data e Hora Atuais */
-- Mostra a data de nascimento do cliente lado a lado com a data de hoje.
SELECT nome, data_nasc, CURRENT_DATE AS hoje, CURRENT_TIMESTAMP AS data_hora_agora FROM cliente;

/* AGE() - Idade / Tempo Decorrido */
-- Calcula a idade exata (anos, meses e dias) de cada vendedor.
SELECT nome, data_nasc, AGE(CURRENT_DATE, data_nasc) AS idade_exata FROM vendedor;

/* EXTRACT(YEAR FROM...) - Extração de Ano */
-- Pega apenas o ano de nascimento dos clientes (ideal para agrupar clientes por ano).
SELECT nome, data_nasc, EXTRACT(YEAR FROM data_nasc) AS ano_nascimento FROM cliente;

/* EXTRACT(MONTH FROM...) - Extração de Mês */
-- Retorna apenas o mês em que a venda foi realizada, útil para relatórios mensais.
SELECT id_venda, data_venda, EXTRACT(MONTH FROM data_venda) AS mes_da_venda FROM venda;

/* TO_CHAR() - Formatação de Data para Texto */
-- Converte o Timestamp da venda para o formato amigável brasileiro (DD/MM/YYYY HH24:MI).
SELECT id_venda, data_venda, TO_CHAR(data_venda, 'DD/MM/YYYY HH24:MI') AS data_formatada FROM venda;

/* Cálculos Simples (+ e -) com Dias */
-- Calcula quando será/foi o vencimento de uma garantia de 30 dias a partir da data de venda.
SELECT id_venda, data_venda, (data_venda + INTERVAL '30 days') AS vencimento_garantia FROM venda;

/* Subtração de Datas (Dias de Vida) */
-- Calcula quantos dias os clientes já viveram subtraindo a data de nascimento da data atual.
SELECT nome, data_nasc, (CURRENT_DATE - data_nasc) AS dias_de_vida FROM cliente;

/* DATE_PART() - Alternativa ao Extract */
-- Obtém o dia do mês que a venda foi realizada.
SELECT id_venda, data_venda, DATE_PART('day', data_venda) AS dia_da_venda FROM venda;

/* DATE_TRUNC() - Arredondamento de Datas */
-- Arredonda a data da venda para o primeiro dia do respectivo mês (ótimo para agrupamentos contábeis).
SELECT id_venda, data_venda, DATE_TRUNC('month', data_venda) AS primeiro_dia_mes_venda FROM venda;

/* DATE() - Removendo a Hora do Timestamp */
-- A coluna `data_venda` da sua tabela `venda` é um `timestamp` (possui horas). Com a função DATE(), pegamos estritamente a data.
SELECT id_venda, data_venda AS com_hora, DATE(data_venda) AS apenas_data FROM venda;