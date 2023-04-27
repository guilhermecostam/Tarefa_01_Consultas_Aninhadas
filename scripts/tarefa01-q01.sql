SELECT nome 
FROM funcionario 
WHERE salario > (
    SELECT AVG(salario) 
    FROM funcionario 
    WHERE coddepto = 2
);
