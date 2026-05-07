-- Estrutura básica de uma function
CREATE OR REPLACE FUNCTION nome_funcao(parametros)
RETURNS tipo AS $$
DECLARE
   -- variáveis
BEGIN
   -- lógica
   RETURN valor;
END;
$$ LANGUAGE plpgsql;

-- Variáveis
DECLARE
    idade INTEGER;
    nome TEXT;
    salario NUMERIC := 1000;

-- Exemplo
CREATE OR REPLACE FUNCTION exemplo_varaivel()
RETURN INTEGER AS $$
DECLARE
    x INTEGER := 10;
BEGIN
    x := x + 5;
    RETURN x;
END;
$$ LANGUAGE plpgsql;

-- Tipos de variáveis (com descrição): --
/* INTEGER → número inteiro comum (ex: 10, 200, -5)

BIGINT → inteiro maior, usado para valores muito grandes

NUMERIC → número decimal com alta precisão (ideal para dinheiro)

DOUBLE PRECISION → número decimal com ponto flutuante (mais rápido, menos preciso)

TEXT → texto de tamanho ilimitado

VARCHAR(n) → texto com limite de caracteres definido

CHAR(n) → texto de tamanho fixo (preenchido com espaços)

DATE → armazena apenas a data (ano, mês, dia)

TIME → armazena apenas a hora

TIMESTAMP → armazena data e hora juntos

BOOLEAN → valor lógico: TRUE, FALSE ou NULL */

-- Parâmetros
CREATE FUNCTION soma(a INTEGER, b INTEGER)
RETURNS INTEGER AS $$
BEGIN
    RETURN a+b;
END;
$$ LANGUAGE plpgsql;

-- exemplo de chamada dessa função:
SELECT soma(2, 3);

-- IF/ELSE
CREATE FUNCTION verifica_idade(idade INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF idade >= 18 THEN
        RETURN 'Maior de idade';
    ELSE
        RETURN 'Menor de idade';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- versão com ELSEIF
CREATE FUNCTION verifica_idade(idade INTEGER)
RETURNS TEXT AS $$
BEGIN
    IF idade < 12 THEN
        RETURN 'Criança';
    ELSEIF idade < 18 THEN
        RETURN 'Adolescente';
    ELSE
        RETURN 'Adulto';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- while
CREATE FUNCTION contador()
RETURNS INTEGER AS $$
DECLARE
    i INTEGER = 1;
BEGIN
    WHILE i <= 5 LOOP
        i := i + 1;
    END LOOP;

    RETURN i;
END;
$$ LANGUAGE plpgsql;

-- for
CREATE FUNCTION soma_loop()
RETURNS INTEGER AS $$
DECLARE
    total INTEGER := 0;
BEGIN
    FOR i IN 1..5 LOOP
        total := total + i;
    END LOOP;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Exemplo da 1º função criada (hello world)
CREATE OR REPLACE FUNCTION hello_world()
RETURNS TEXT AS $$
DECLARE
   -- variáveis
BEGIN
   -- lógica
   RETURN 'Hello World!';
END;
$$ LANGUAGE plpgsql;

-- chamando a função:
SELECT hello_world();

-- 2º exemplo:
CREATE OR REPLACE FUNCTION hello_world2()
RETURNS TEXT AS $$
DECLARE
    mensagem TEXT := 'Hello World 2!';
    notificacao TEXT := 'Aviso: Hello World foi executado';
BEGIN
    RAISE NOTICE '%', notificacao;
    RETURN mensagem;
END;
$$ LANGUAGE plpgsql;

-- 3º exemplo:
CREATE OR REPLACE FUNCTION hello_world3()
RETURNS TEXT AS $$
DECLARE
    mensagem TEXT := 'Hello World 3';
BEGIN
    RAISE EXCEPTION 'Cuidado: %', mensagem;
    RETURN mensagem;
END;
$$ LANGUAGE plpgsql;

-- 4º exemplo:
CREATE OR REPLACE FUNCTION hello_world4(p_mensagem TEXT)
RETURNS TEXT AS $$
DECLARE
    v_mensagem TEXT := 'Hello World 4';
BEGIN
    RETURN v_mensagem || ' - ' || p_mensagem;
END;
$$ LANGUAGE plpgsql;