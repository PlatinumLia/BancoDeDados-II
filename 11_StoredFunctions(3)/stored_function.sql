-- 1º script da aula
CREATE OR REPLACE FUNCTION verificar_estoque(p_id_produto INTEGER, p_qtde INTEGER)
RETURNS TEXT -- tipo de retorno da função
LANGUAGE plpgsql AS $$
DECLARE
    v_estoque INTEGER; -- declarando uma variável
BEGIN
    SELECT qtde INTO v_estoque
    FROM produto
    WHERE id_produto = p_id_produto;

    IF v_estoque < p_qtde THEN
        RETURN 'Estoque insuficiente';
    END IF;

    RETURN "Venda permitida";
END;
$$;

-- 2º script
CREATE OR REPLACE FUNCTION verificar_estoque_b(p_id_produto INTEGER, p_qtde INTEGER)
RETURNS BOOLEAN -- tipo de retorno da função
LANGUAGE plpgsql AS $$
DECLARE
    v_estoque INTEGER; -- declarando uma variável
BEGIN
    SELECT qtde INTO v_estoque
    FROM produto
    WHERE id_produto = p_id_produto;

    IF v_estoque < p_qtde THEN
        RETURN false;
    END IF;

    RETURN true;
END;
$$;

-- 3ºA
CREATE OR REPLACE FUNCTION estoque_critico(p_id_produto INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
DECLARE
    v_qtde INTEGER;
BEGIN
    SELECT qtde INTO v_qtde 
    FROM produto 
    WHERE id_produto = p_id_produto;

    IF v_qtde <= 2 THEN
        RETURN 'Estoque crítico.';
    ELSIF v_qtde <= 5 THEN
        RETURN 'Estoque baixo.';
    END IF;

    RETURN 'Estoque normal';
END;
$$;


-- 3ºB 
CREATE OR REPLACE FUNCTION estoque_critico(p_id_produto INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
DECLARE
    v_qtde INTEGER;
    v_qtde_min INTEGER;
BEGIN
    SELECT qtde INTO v_qtde 
    FROM produto 
    WHERE id_produto = p_id_produto;

    SELECT qtde_min 
    INTO v_qtde_min
    FROM produto WHERE id_produto = p_id_produto;

    IF v_qtde <= FLOOR((v_qtde_min / 2)) THEN
        RETURN 'Estoque crítico.';
    ELSIF v_qtde <= v_qtde_min THEN
        RETURN 'Estoque baixo.';
    END IF;

    RETURN 'Estoque normal';
END;
$$;

-- ??
CREATE OR REPLACE FUNCTION inserir_item_venda(p_id_venda INTEGER, p_id_produto INTEGER, p_qtde INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE
    v_preco NUMERIC;
    v_total NUMERIC;
BEGIN
    IF verificar_estoque_b(p_id_produto, p_qtde) THEN
        UPDATE produto SET qtde = qtde - p_qtde
        WHERE id_produto = p_id_produto;
    ELSE
        RETURN FALSE;
    END IF;

    SELECT preco INTO v_preco 
    FROM produto
    WHERE id_produto = p_id_produto;

    INSERT INTO item_venda(id_venda, id_produto, preco, qtde) VALUES 
    (p_id_venda, p_id_produto, v_preco, p_qtde);

    SELECT SUM(qtde*preco) INTO v_total
    FROM item_venda WHERE id_venda = p_id_venda;

    UPDATE venda SET total = v_total WHERE id_venda = p_id_venda;
    
    RETURN TRUE;
END;
$$;