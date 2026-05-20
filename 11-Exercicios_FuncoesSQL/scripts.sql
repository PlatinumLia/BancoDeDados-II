/* Exercício 1: */
CREATE OR REPLACE FUNCTION verificar_paridade(p_number INTEGER)
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

SELECT verificar_paridade(5);

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

SELECT verificar_paridade(5);

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

SELECT verificar_idade('2006-10-27');

/* Exercício 3: */
CREATE OR REPLACE FUNCTION calcular_fatorial(p_number INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql AS $$
DECLARE
    v_fat INTEGER := 1;
BEGIN
    IF p_number <= 0 THEN
        RAISE EXCEPTION 'Zero e números negativos são inválidos';
    ELSE
		FOR i IN 1..p_number LOOP
			v_fat := v_fat * i;
    	END LOOP;
	END IF;

    RETURN v_fat;
END;
$$;

SELECT calcular_fatorial(10);

/* Exercício 4: */
CREATE OR REPLACE FUNCTION inversor(p_texto VARCHAR)
RETURNS VARCHAR
LANGUAGE plpgsql AS $$
DECLARE
    v_texto_invertido VARCHAR;
BEGIN
    v_texto_invertido := REVERSE(p_texto);

    RETURN v_texto_invertido; 
END;
$$;

SELECT inversor('Mugetsu');

/* Exercício 5: */
CREATE OR REPLACE FUNCTION saudacao_turno(p_data_hora TIMESTAMP)
RETURNS VARCHAR
LANGUAGE plpgsql AS $$
DECLARE hora INTEGER;
BEGIN
    hora := EXTRACT(HOUR FROM p_data_hora);
    IF hora >= 6  AND hora < 12 THEN
        RETURN 'BOM DIA';
    ELSIF hora >= 12 AND hora < 18 THEN
        RETURN 'BOA TARDE';
    ELSE 
        RETURN 'BOA NOITE';
    END IF;
END;
$$;

SELECT saudacao_turno('2019-10-09 19:40:00');

/* Exercício 6: */
CREATE OR REPLACE FUNCTION somar_pares(p_num1 INTEGER, p_num2 INTEGER)
RETURNS INTEGER AS $$
DECLARE 
    resultado INTEGER := 0;
BEGIN
    IF p_num1 < p_num2 THEN
        FOR i IN p_num1..p_num2 LOOP
            IF (i % 2) = 0 THEN 
                resultado := resultado + i;
            END IF;
        END LOOP;
    ELSE
        FOR i IN p_num2..p_num1 LOOP
            IF (i % 2) = 0 THEN 
                resultado := resultado + i;
            END IF;
        END LOOP;
    END IF;
    RETURN resultado;
END;
$$ LANGUAGE plpgsql;

SELECT somar_pares(20 , 100);

/* Exercício 7: */
CREATE OR REPLACE FUNCTION validar_email(p_email VARCHAR(80))
RETURNS TEXT AS $$
BEGIN
    IF POSITION('@' IN p_email) > 0 AND POSITION('.' IN SUBSTRING(p_email FROM POSITION('@' IN p_email))) > 0 THEN
        RETURN 'VALIDO';
    ELSE    
        RETURN 'INVALIDO';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT validar_email('mugetsu@gmail.com');

/* Exercício 8: */
CREATE OR REPLACE FUNCTION contador_vogais(p_texto TEXT)
RETURNS INTEGER AS $$
DECLARE 
    qtde INTEGER := 0;
    caractere CHAR;
BEGIN
    FOR i IN 0..LENGTH(p_texto) LOOP
        caractere := SUBSTRING(p_texto FROM i FOR 1);

        IF caractere = 'a' OR caractere = 'e' OR caractere = 'i' OR caractere = 'o' OR caractere = 'u' THEN
            qtde := qtde + 1;
        END IF;
    END LOOP;

    RETURN qtde;
END;
$$ LANGUAGE plpgsql;

SELECT contador_vogais('Mutsuki');