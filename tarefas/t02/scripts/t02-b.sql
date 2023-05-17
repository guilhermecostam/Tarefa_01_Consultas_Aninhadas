CREATE OR REPLACE FUNCTION media_idade_departamento(codigo_depart INT)
RETURNS FLOAT
LANGUAGE plpgsql
AS $$
DECLARE
    media FLOAT;
BEGIN
    SELECT AVG(DATE_PART('YEAR', AGE(f.datanasc)))
    INTO media
    FROM funcionario f
    JOIN departamento d ON f.depto = d.codigo
    WHERE d.codigo = codigo_depart;

    RETURN media;
END;
$$;
