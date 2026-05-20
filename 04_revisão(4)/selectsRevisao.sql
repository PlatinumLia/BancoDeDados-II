/* Revisão de SELECT: */
-- seleciona todos os planetas da tabela
SELECT * FROM planetas;

-- seleciona todos os planetas onde uma condição específica for cumprida
SELECT * FROM planetas WHERE habitado = true;

-- ordenando os dados de forma decrescente
SELECT * FROM planetas ORDER BY massa DESC;

-- ordenando os dados de forma crescente
SELECT * FROM planetas ORDER BY massa ASC;

/* contando a quantidade de registro.
   OBS: o (*) indica de todos os registros e o GROUP BY ordena por semelhança
*/
SELECT tipoSuperficie, COUNT(*) FROM planetas GROUP BY tipoSuperficie;

-- comando acima, porém adaptado para a tabela fornecida na aula
SELECT idGalaxia, COUNT(*) FROM planetas GROUP BY idGalaxia;

/* OBS: os comandos abaixo são case sensistive */
-- selecionando dados que começam com 'T'
SELECT * FROM planetas WHERE nome LIKE 'T%';

-- selecionando dados que terminam com 'T'
SELECT * FROM planetas WHERE nome LIKE '%T';

-- selecionando dados que contenham '%T%'
SELECT * FROM planetas WHERE nome LIKE '%T%';

-- usando ALIAS  
SELECT * FROM planetas AS p, especies AS e WHERE p.idEspecie = e.id; 

SELECT p.nome, e.nome FROM planetas AS p, especies AS e WHERE p.idEspecie = e.id; 