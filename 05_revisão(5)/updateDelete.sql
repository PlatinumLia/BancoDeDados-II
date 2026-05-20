/* Revisão de UPDATE e DELETE */

--UPDATE
-- exemplo:
UPDATE planetas
SET habitantes = 8100000000
WHERE nome = 'Terra';

--DELETE
-- exemplo:
DELETE FROM planetas
WHERE nome = 'Pluto';

-- exemplo de erro na integridade referencial:
DELETE FROM planetas WHERE id = 1;

/* A seguinte mensagem irá aparecer:
    ERROR:  update or delete on table "planetas" violates foreign key constraint "fk_planeta" on table "satelites"
    Key (id)=(1) is still referenced from table "satelites". 

    SQL state: 23503
    Detail: Key (id)=(1) is still referenced from table "satelites".
*/

--------------------
/* CASCADE - Antes */

ALTER TABLE satelites
DROP CONSTRAINT fk_planeta;

ALTER TABLE satelites
ADD CONSTRAINT fk_planeta
FOREIGN KEY (idPlaneta)
REFERENCES planetas(id)
ON DELETE CASCADE;