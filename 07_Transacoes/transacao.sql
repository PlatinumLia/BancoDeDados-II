
BEGIN; /* -> inicia a transação */
-- ficará apenas dentro da sessão 'BEGIN' 
INSERT INTO venda(id_vendedor, id_cliente, data_venda, total, status) 
VALUES (2, 2, now(), 0, 0);

SELECT * FROM venda;

SELECT * FROM produto WHERE id_produto = 5;
SELECT preco FROM produto WHERE id_produto = 5;

INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES (7, 5, 2, SELECT preco FROM produto WHERE id_produto = 5); /* está errado */
ROLLBACK;

/* refazendo */
BEGIN;
INSERT INTO venda(id_vendedor, id_cliente, data_venda, total, status) 
VALUES (2, 2, now(), 0, 0);

-- OBS: "id_venda" mudará em cada BEGIN (se errar, precisará fazer rollback)
INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES(9, 5, 2, (SELECT preco FROM produto WHERE id_produto = 5));

UPDATE produto SET qtde = (SELECT qtde-2 FROM produto WHERE id_produto = 5)
WHERE id_produto = 5;

SELECT sum(qtde*preco) FROM item_venda WHERE id_venda = 9;

UPDATE venda SET total = (SELECT sum(qtde*preco) FROM item_venda WHERE id_venda = 9) WHERE id_venda = 9;

COMMIT;