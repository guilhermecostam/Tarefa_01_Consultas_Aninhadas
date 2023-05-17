CREATE OR REPLACE FUNCTION dias_atraso_projeto(codigo_proj INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        SELECT EXTRACT(DAY FROM (datafim - CURRENT_DATE))::INT
        FROM projeto
        WHERE codigo = codigo_proj
    );
END;
$$;