CREATE TABLE parcelas(
    id_parcela PRIMARY KEY AUTO_INCREMENT,
    qtd_parcelas INTEGER NOT NULL CHECK(qtd_parcelas >= 2 AND qtd_parcelas <= 12),
    data_parcela DATE NOT NULL,
    data_pagamento TIMESTAMP NULL,
    valor_parcela DOUBLE NOT NULL,
    parcela_paga BOOLEAN NOT NULL,
    id_venda INTEGER NOT NULL REFERENCES venda(id_venda)
);

/* Função do parcelamento */
CREATE OR REPLACE FUNCTION parcelamento(p_qtd_parcelas INTEGER, p_acrescimo DOUBLE, p_data_parcela DATE, p_data_pagamento TIMESTAMP, p_parcela_paga BOOLEAN, p_id_venda INTEGER)
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$;
DECLARE
    -- variáveis
    v_valor_parcela NUMERIC(7, 2);
    v_data_vencimento DATE;
    
BEGIN

END;
$$;