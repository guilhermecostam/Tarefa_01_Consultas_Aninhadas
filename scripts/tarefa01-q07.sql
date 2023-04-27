CREATE VIEW funcDepto AS
SELECT count(f.codigo) AS qtd, f.codDepto
FROM funcionario f
GROUP BY f.codDepto;

SELECT d.descricao AS departamento, g.nome AS gerente, fd.qtd AS funcionarios
FROM funcDepto fd LEFT JOIN departamento d ON d.codigo=fd.codDepto
LEFT JOIN funcionario g ON d.codGerente = g.codigo;