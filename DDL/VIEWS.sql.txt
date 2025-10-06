USE projetotrio;

-- 1. Top 5 livros mais vendidos
CREATE VIEW desempenholivros AS
SELECT 
    L.titulo,
    SUM(E.quantidade) AS total_vendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY 
    L.titulo
ORDER BY 
    total_vendidos DESC
LIMIT 5;

-- 2. Número de livros por autor
CREATE VIEW qtd_livro_autor AS
SELECT 
    A.nome AS autor,
    COUNT(LA.ISBN) AS qtd_livros
FROM 
    Autor A
JOIN 
    Livro_Autor LA ON A.id_autor = LA.id_autor
GROUP BY 
    A.nome
ORDER BY 
    qtd_livros DESC;

-- 3. Funcionários sem férias futuras
CREATE VIEW func_sem_ferias AS
SELECT 
    F.nome AS funcionario,
    C.nome_cargo AS cargo,
    D.nome_dep AS departamento
FROM 
    Funcionario F
JOIN 
    Cargo C ON F.id_cargo = C.id_cargo
JOIN 
    Departamento D ON F.id_departamento = D.id_departamento
LEFT JOIN 
    Ferias FR ON F.CPF = FR.CPF AND FR.data_fim >= CURDATE()
WHERE 
    C.nome_cargo IN ('Analista Financeiro', 'Pesquisador Editorial', 'Editor')
    AND FR.id_ferias IS NULL
ORDER BY 
    funcionario;

-- 4. Livros mais vendidos por gênero
CREATE VIEW top_livros_genero AS
WITH vendas AS (
    SELECT 
        L.genero,
        L.titulo,
        SUM(E.quantidade) AS total
    FROM 
        Livro L
    JOIN 
        Exemplar E ON L.ISBN = E.ISBN
    GROUP BY L.genero, L.titulo
),
max_vendas AS (
    SELECT 
        genero,
        MAX(total) AS max_total
    FROM vendas
    GROUP BY genero
)
SELECT 
    v.genero,
    v.titulo,
    v.total
FROM vendas v
JOIN max_vendas m ON v.genero = m.genero AND v.total = m.max_total
ORDER BY v.total DESC;

-- 5. Desempenho por gênero
CREATE VIEW desempenho_genero AS
SELECT 
    L.genero,
    SUM(E.quantidade) AS total_vendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY L.genero
ORDER BY total_vendidos DESC;

-- 6. Livros com vendas abaixo da média
CREATE VIEW livros_abaixo_media AS
SELECT 
    L.titulo,
    SUM(E.quantidade) AS total_vendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY L.titulo
HAVING SUM(E.quantidade) < (
    SELECT AVG(total)
    FROM (
        SELECT SUM(quantidade) AS total
        FROM Exemplar
        GROUP BY ISBN
    ) t
)
ORDER BY total_vendidos DESC;

-- 7. Livros danificados últimos 3 meses
CREATE VIEW livros_danificados AS
SELECT 
    L.titulo,
    E.estado,
    P.data_pedido,
    P.valor_total
FROM 
    Exemplar E
JOIN 
    Livro L ON E.ISBN = L.ISBN
JOIN 
    ItemPedido P ON E.id_pedido = P.id_pedido
WHERE 
    E.estado IN ('Danificado', 'Ligeiramente Danificado')
    AND P.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
ORDER BY P.data_pedido DESC;

-- 8. Funcionários com mais alocações
CREATE VIEW func_mais_aloc AS
SELECT 
    F.nome,
    COUNT(A.id_alocacao) AS total
FROM 
    Funcionario F
JOIN 
    Alocacao A ON F.CPF = A.CPF
GROUP BY F.nome
ORDER BY total DESC
LIMIT 5;

-- 9. Livros histórico período
CREATE VIEW livros_historico AS
SELECT 
    titulo,
    genero,
    data_publicacao
FROM Livro
WHERE 
    data_publicacao BETWEEN '2025-01-15' AND '2025-08-30'
    AND genero LIKE 'Histórico';

-- 10. Livros de clientes de Recife
CREATE VIEW livros_recife AS
SELECT 
    C.nome,
    C.endereco,
    P.valor_total,
    P.data_pedido
FROM Cliente C
JOIN ItemPedido P ON C.id_cliente = P.id_cliente
WHERE C.endereco LIKE '%Recife%';

-- 11. Contagem de livros por gênero
CREATE VIEW qtd_livros_genero AS
SELECT 
    genero,
    COUNT(*) AS total
FROM Livro
GROUP BY genero
ORDER BY total DESC;
