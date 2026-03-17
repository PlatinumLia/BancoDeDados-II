-- 1- Atualizar Arrankis para 2000000 habitantes
UPDATE planetas
SET habitantes = 2000000
WHERE nome = 'Arrankis';

-- 2- Aumente 500 habitantes de planetas com menos de 1 milhão
UPDATE planetas
SET habitantes = habitantes + 500
WHERE habitantes < 1000000;

-- 3- Delete satélites com diâmetro maior ou igual a 600
DELETE FROM satelites
WHERE diametro < 600;

-- 4- Delete planetas da galáxia 13
DELETE FROM planetas
WHERE idGalaxia = 13;

-- Exerc. final
-- Passo 1:
INSERT INTO planetas (id, nome, habitantes, idESpecie, idGalaxia) VALUES (49, 'Pandora 2', 100000, 2, 3);

-- Passo 2:
INSERT INTO satelites (nome, idPlaneta, diametro) VALUES
('GC-17B', 50, 555666),
('FC-81C', 50, 134550),
('JV-12E', 50, 550880);

-- Passo 3:
/* alterar o campo FK 'fk_planetas' */
ALTER TABLE satelites
DROP CONSTRAINT fk_planeta;

/* alterar novamente adicionando uma nova FK e depois dar 'DELETE CASCADE' */
ALTER TABLE satelites
ADD CONSTRAINT fk_planeta
FOREIGN KEY (idPlaneta)
REFERENCES planetas(id)
ON DELETE CASCADE;

-- Passo 4:
DELETE FROM planetas
WHERE nome = 'Pandora 2';