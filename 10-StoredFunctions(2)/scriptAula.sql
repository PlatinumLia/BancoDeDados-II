-- Soma (sem parâmetros)
CREATE OR REPLACE FUNCTION soma()
RETURNS INTEGER AS $$
DECLARE
	x INTEGER := 10;
BEGIN
	x := x + 5;
	RETURN x;
END;
$$ LANGUAGE plpgsql;

-- Soma (com parâmetros)
CREATE OR REPLACE FUNCTION soma(p_y INTEGER)
RETURNS INTEGER AS $$
DECLARE
	v_x INTEGER := 10;
BEGIN
	v_x := v_x + p_y;
	RETURN v_x;
END;
$$ LANGUAGE plpgsql;

-- Soma (usando dois parâmetros)
CREATE OR REPLACE FUNCTION soma(p_x INTEGER, p_y INTEGER)
RETURNS INTEGER AS $$
BEGIN
	RETURN p_x + p_y;
END;
$$ LANGUAGE plpgsql;

-- Laço WHILE (usando parâmetro)
CREATE OR REPLACE FUNCTION contador(p_y INTEGER)
RETURNS INTEGER AS $$
DECLARE
   i INTEGER := 1;
BEGIN
   WHILE i <= p_y LOOP
       i := i + 1;
       RAISE NOTICE '%', i;
   END LOOP;

   RETURN i;
END;
$$ LANGUAGE plpgsql;

