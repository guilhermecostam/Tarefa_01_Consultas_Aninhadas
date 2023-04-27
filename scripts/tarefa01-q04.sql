SELECT f.nome, f.salario, d.sigla 
FROM funcionario f 
JOIN departamento d ON f.codDepto = d.codigo 
WHERE f.codigo NOT IN (
    SELECT codgerente
    FROM departamento
    WHERE codgerente IS NOT NULL
) 
ORDER BY f.codDepto;