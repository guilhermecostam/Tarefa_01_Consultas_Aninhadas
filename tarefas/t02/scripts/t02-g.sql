CREATE OR REPLACE FUNCTION atividades_func_proj(codigo_func INT, codigo_proj INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (
        SELECT COUNT(a.codigo)
        FROM projeto p
        JOIN membro m ON p.equipe = m.codequipe
        JOIN atividade_membro am ON am.codmembro = m.codigo
        JOIN atividade a ON am.codatividade = a.codigo
        WHERE p.codigo = codigo_proj AND m.codfuncionario = codigo_func
    );
END;
$$;