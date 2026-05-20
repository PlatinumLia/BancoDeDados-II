/* Exercício 1: */
CREATE OR REPLACE FUNCTION verificar_paridade(P_number INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
BEGIN
    IF (p_number % 2) = 0 THEN
        RETURN 'Número é par';
    ELSE
        RETURN 'Número é ímpar';
    END IF;
END;
$$;

-- Versão alternativa do exerc. 1 --
CREATE OR REPLACE FUNCTION verificar_paridade(P_number INTEGER)
RETURNS TEXT
LANGUAGE plpgsql AS $$
BEGIN
    IF (p_number % 2) != 0 THEN
        RETURN 'Número é ímpar';
    END IF;

    RETURN 'Número é par';
END;
$$;

/* Exercício 2: */
CREATE OR REPLACE FUNCTION verificar_idade(p_data_aniversario DATE)
RETURNS NUMERIC
LANGUAGE plpgsql AS $$
DECLARE
    v_idade NUMERIC;
    v_ano_calculado DATE;
BEGIN
    v_ano_calculado := TO_CHAR(AGE(CURRENT_DATE, p_data_aniversario), 'DD/MM/YYYY');
    v_idade := EXTRACT(YEAR FROM v_ano_calculado);

    RETURN v_idade;
END;
$$;

/* Exercício 3: */
CREATE OR REPLACE FUNCTION calcular_fatorial(p_number NUMERIC)
RETURNS NUMERIC
LANGUAGE plpgsql AS $$
DECLARE
    v_fat NUMERIC;
    v_num_atual NUMERIC;
    v_prox_num NUMERIC;
    v_contador NUMERIC := p_number - 1;
BEGIN
    IF p_number <= 0 THEN
        RAISE EXCEPTION 'Zero e números negativos são inválidos';
    ELSE
        WHILE v_contador > 1 LOOP
            v_fat := p_number * v_contador;
            v_num_atual := v_fat;
            v_prox_num := v_num_atual * v_contador;

            v_contador := v_contador - 1;
        END LOOP;
    END IF;

    RETURN v_fat;
END;
$$; 