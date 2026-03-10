/* Exercícios de SELECT */

-- 1- Listar todos os planetas mostrando apenas o nome
SELECT nome FROM planetas;

-- 2- Listar todos os planetas e o nº de habitantes. (Usar alias para mudar o nome das colunas para: "Planeta", "População")
SELECT nome AS Planeta, habitantes AS População FROM planetas;

-- 3- Listar todos os planetas ordenados alfabeticamente
SELECT * FROM planetas AS p ORDER BY p.nome ASC;

-- 4- Listar todos os planetas do mais populoso até o menos populoso
SELECT * FROM planetas ORDER BY habitantes ASC;

-- 5- Listar todas as galáxias em ordem alfabética
SELECT * FROM galaxias ORDER BY nome ASC;

-- 6- Listar os planetas e sua galáxia. (Usar alias para mostrar: "Planeta", "Galáxia")
SELECT p.nome AS Planeta, g.nome AS Galáxia 
FROM planetas AS p, galaxias AS g
WHERE p.idGalaxia = g.id
ORDER BY g.nome; 

-- 7- Listar quantos planetas existem em cada galáxia
SELECT g.nome AS Galáxia, COUNT(p.id) AS QuantGaláxia 
FROM galaxias AS g, planetas AS p
WHERE p.idGalaxia = g.id 
GROUP BY g.nome
ORDER BY g.nome;

-- 8- Listar a soma de habitantes por galáxia
SELECT g.nome AS Habitantes, SUM(p.habitantes) AS QuantHabitantes 
FROM planetas AS p, galaxias AS g 
WHERE p.idGalaxia = g.id
GROUP BY g.nome
ORDER BY QuantHabitantes ASC;

-- 9- Listar quantos planetas existem para cada espécie dominante
SELECT e.nome AS EspecieDom, COUNT(p.id) AS QuantPlanetas
FROM especies AS e, planetas AS p
WHERE p.idEspecie = e.id
GROUP BY e.nome
ORDER BY QuantPlanetas ASC;

-- 10- Listar as galáxias ordenadas pela quantidade de planetas (da maior para a menor)
SELECT g.nome AS Galáxia, COUNT(p.id) AS QuantPlanetas
FROM galaxias AS g, planetas AS p
WHERE p.idGalaxia = g.id
GROUP BY g.nome
ORDER BY QuantPlanetas DESC;