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
DECLARE 
    v_hora INTEGER;
BEGIN
    v_hora := EXTRACT(HOUR FROM p_data_hora);
    
    IF v_hora >= 6  AND v_hora < 12 THEN
        RETURN 'BOM DIA';
    ELSIF v_hora >= 12 AND v_hora < 18 THEN
        RETURN 'BOA TARDE';
    ELSE 
        RETURN 'BOA NOITE';
    END IF;
END;
$$;

SELECT saudacao_turno('2019-10-09 19:40:00');

/* Exercício 6: */
CREATE OR REPLACE FUNCTION somar_pares(p_num1 INTEGER, p_num2 INTEGER)
RETURNS INTEGER
LANGUAGE plpgsql AS $$
DECLARE 
    v_resultado INTEGER := 0;
BEGIN
    IF p_num1 < p_num2 THEN
        FOR i IN p_num1..p_num2 LOOP
            IF (i % 2) = 0 THEN 
                v_resultado := v_resultado + i;
            END IF;
        END LOOP;
    ELSE
        FOR i IN p_num2..p_num1 LOOP
            IF (i % 2) = 0 THEN 
                v_resultado := v_resultado + i;
            END IF;
        END LOOP;
    END IF;

    RETURN v_resultado;
END;
$$;

SELECT somar_pares(20 , 100);

/* Exercício 7: */
CREATE OR REPLACE FUNCTION validar_email(p_email VARCHAR(80))
RETURNS VARCHAR(50)
LANGUAGE plpgsql AS $$;
BEGIN
    IF POSITION('@' IN p_email) > 0 AND POSITION('.' IN SUBSTRING(p_email FROM POSITION('@' IN p_email))) > 0 THEN
        RETURN 'VÁLIDO';
    ELSE    
        RETURN 'INVÁLIDO';
    END IF;
END;
$$;

SELECT validar_email('mugetsu@gmail.com');

/* Exercício 8: */
CREATE OR REPLACE FUNCTION contador_vogais(p_texto TEXT)
RETURNS INTEGER
LANGUAGE plpgsql AS $$
DECLARE 
    v_qtde INTEGER := 0;
    v_caractere CHAR;
BEGIN
    FOR i IN 0..LENGTH(p_texto) LOOP
        v_caractere := SUBSTRING(p_texto FROM i FOR 1);

        IF v_caractere = 'a' OR v_caractere = 'e' 
                             OR v_caractere = 'i' 
                             OR v_caractere = 'o' 
                             OR v_caractere = 'u' THEN
            v_qtde := v_qtde + 1;
        END IF;
    END LOOP;

    RETURN v_qtde;
END;
$$;

SELECT contador_vogais('Mutsuki');

/* Exercício 9: */
CREATE OR REPLACE FUNCTION classificar_dias(p_data DATE)
RETURNS VARCHAR(80)
LANGUAGE plpgsql AS $$
DECLARE 
    v_num_dia INTEGER := 0;
BEGIN
    v_num_dia := EXTRACT(DOW FROM p_data);
    
    IF v_num_dia > 0 AND v_num_dia < 6 THEN
        RETURN 'DIA UTIL';
    ELSE
        RETURN 'FIM DE SEMANA';
    END IF;
END;
$$;

SELECT classificar_dias('2026-05-20');

/* Exercício 10: */
CREATE OR REPLACE FUNCTION codigo_matricula(p_nome VARCHAR(80), p_data DATE)
RETURNS VARCHAR
LANGUAGE plpgsql AS $$
DECLARE
    v_matricula VARCHAR(80);
BEGIN
    v_matricula := UPPER(SUBSTRING(p_nome FROM 1 FOR 3)) 
                         || EXTRACT(YEAR FROM P_data) :: VARCHAR 
                         || LENGTH(p_nome) :: VARCHAR;
    
    RETURN v_matricula;
END;
$$;

SELECT codigo_matricula('Lia', '2006-10-27');