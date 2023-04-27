SELECT f.nome, f.salario, f.codDepto 
FROM funcionario f 
WHERE f.codigo NOT IN (
    SELECT codgerente
    FROM departamento
    WHERE codgerente IS NOT NULL
) 
ORDER BY f.codDepto;