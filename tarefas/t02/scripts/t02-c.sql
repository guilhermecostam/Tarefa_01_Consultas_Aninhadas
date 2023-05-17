CREATE OR REPLACE FUNCTION func_idade_maior_media_depto()
RETURNS TABLE (codigo INTEGER, nome CHARACTER VARYING)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY 
    SELECT f.codigo, f.nome
    FROM funcionario f
    JOIN departamento d ON f.depto = d.codigo
    WHERE DATE_PART(
        'YEAR', AGE(f.datanasc)
    ) > (
        SELECT AVG(DATE_PART(
            'YEAR',
            AGE(f2.datanasc)
        )) FROM funcionario f2 WHERE f2.depto = f.depto
    );
END;
$$;