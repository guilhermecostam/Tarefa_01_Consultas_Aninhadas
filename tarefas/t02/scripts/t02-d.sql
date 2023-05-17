CREATE OR REPLACE FUNCTION dias_atraso_atividade(codigo_ativ INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        SELECT EXTRACT(DAY FROM (datafim - CURRENT_DATE))::INT
        FROM atividade
        WHERE codigo = codigo_ativ
    );
END;
$$;