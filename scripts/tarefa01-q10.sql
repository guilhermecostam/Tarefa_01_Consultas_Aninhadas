SELECT
    p.nome AS nome_projeto,
    dp.descricao AS dep_projeto,
    f.nome AS nome_responsavel,
    df.descricao AS dep_responsavel
FROM
    projeto p
    JOIN departamento dp ON p.codDepto = dp.codigo
    JOIN funcionario f ON p.codResponsavel = f.codigo
    JOIN departamento df ON f.codDepto = df.codigo
WHERE
    dp.codigo <> df.codigo;