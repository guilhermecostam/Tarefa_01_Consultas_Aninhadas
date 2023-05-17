CREATE OR REPLACE FUNCTION porcentagem_atividades_func_proj(codigo_func INT, codigo_proj INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN (SELECT
                ROUND(
                    COUNT(a.codigo)::DECIMAL / COUNT(ap.codatividade) * 100,
                    2
                )
            FROM projeto p
                JOIN atividade_projeto ap ON ap.codprojeto = p.codigo
                JOIN membro m ON p.equipe = m.codequipe
                JOIN atividade_membro am ON am.codmembro = m.codigo
                JOIN atividade a ON am.codatividade = a.codigo
            WHERE p.codigo = codigo_proj AND m.codfuncionario = codigo_func
            GROUP BY p.codigo);
END;
$$;