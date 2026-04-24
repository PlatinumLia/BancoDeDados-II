-- Scripts feitos pelo professor durante a aula
-- revisão da aula anterior (8)

SELECT 
	CURRENT_DATE data_atual,
	EXTRACT(YEAR FROM CURRENT_DATE) ano,
	EXTRACT(MONTH FROM CURRENT_DATE) mes,
	EXTRACT(DAY FROM CURRENT_DATE) dia,
	EXTRACT(WEEK FROM CURRENT_DATE) semana;

/**/
SELECT 
	CURRENT_DATE + 7,
	CURRENT_DATE + 30,
	CURRENT_DATE + 60,
	CURRENT_DATE + interval '1 month',
	CURRENT_DATE + interval '2 month',
	CURRENT_DATE + interval '1 hour',
	CURRENT_TIMESTAMP + interval '23 hours 2 minutes';

/**/
SELECT 
	id_venda, 
	data_venda, 
	TO_CHAR(data_venda, 'DD/MM/YYYY HH24:MI') AS data_formatada,
	TO_CHAR(data_venda, 'DD/MM/YYY - I - HH24:MI') AS data_formatada2
FROM venda;

/**/
