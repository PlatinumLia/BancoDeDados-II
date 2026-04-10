BEGIN;

INSERT INTO venda(id_vendedor, id_cliente, data_venda, total, status) 
VALUES (1, 4, now(), 0, 0);

INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES (11, 9, 1, (SELECT preco FROM produto WHERE id_produto = 9));

INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES (11, 11, 3, (SELECT preco FROM produto WHERE id_produto = 11));

INSERT INTO item_venda(id_venda, id_produto, qtde, preco)
VALUES (11, 15, 2, (SELECT preco FROM produto WHERE id_produto = 15));

SELECT * FROM venda;

UPDATE produto SET qtde = (SELECT qtde-1 FROM produto WHERE id_produto = 9) 
WHERE id_produto = 9;

UPDATE produto SET qtde = (SELECT qtde-3 FROM produto WHERE id_produto = 11) 
WHERE id_produto = 11;

UPDATE produto SET qtde = (SELECT qtde-2 FROM produto WHERE id_produto = 15) 
WHERE id_produto = 15;

UPDATE venda SET total = (SELECT SUM(qtde*preco) FROM item_venda WHERE id_venda = 10) 
WHERE id_venda = 10;

COMMIT;