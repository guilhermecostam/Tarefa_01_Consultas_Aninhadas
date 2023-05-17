CREATE OR REPLACE FUNCTION idade_funcionario(codigo_func INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN DATE_PART('YEAR', AGE(datanasc))
    FROM funcionario
    WHERE codigo = codigo_func;
END;
$$;