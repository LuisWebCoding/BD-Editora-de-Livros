-- ======================================
-- 1. Análise de Desempenho – Top 5 livros mais vendidos
-- ======================================
SELECT 
    L.titulo,
    SUM(E.quantidade) AS TotalExemplaresVendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY 
    L.titulo
ORDER BY 
    TotalExemplaresVendidos DESC
LIMIT 5;

-- ======================================
-- 2. Identificação de Nicho – Número de livros por autor
-- ======================================
SELECT 
    A.nome AS Nome_Autor,
    COUNT(LA.ISBN) AS NumeroDeLivros
FROM 
    Autor A
JOIN 
    Livro_Autor LA ON A.id_autor = LA.id_autor
GROUP BY 
    A.nome
ORDER BY 
    NumeroDeLivros DESC;

-- ======================================
-- 3. Funcionários sem férias futuras
-- ======================================
SELECT 
    F.nome AS Nome_Funcionario,
    C.nome_cargo AS Cargo,
    D.nome_dep AS Departamento
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
    F.nome;

-- ======================================
-- 4. Livros mais comprados de cada gênero
-- ======================================
WITH VendasPorLivro AS (
    SELECT 
        L.genero,
        L.titulo,
        SUM(E.quantidade) AS TotalExemplaresVendidos
    FROM 
        Livro L
    JOIN 
        Exemplar E ON L.ISBN = E.ISBN
    GROUP BY 
        L.genero, L.titulo
),
MaxVendasPorGenero AS (
    SELECT 
        genero,
        MAX(TotalExemplaresVendidos) AS MaxVendas
    FROM 
        VendasPorLivro
    GROUP BY 
        genero
)
SELECT 
    V.genero AS Genero,
    V.titulo AS LivroMaisVendido,
    V.TotalExemplaresVendidos AS TotalDeExemplares
FROM 
    VendasPorLivro V
JOIN 
    MaxVendasPorGenero M ON V.genero = M.genero AND V.TotalExemplaresVendidos = M.MaxVendas
ORDER BY 
    TotalDeExemplares DESC;

-- ======================================
-- 5. Desempenho por Gênero
-- ======================================
SELECT 
    L.genero,
    SUM(E.quantidade) AS TotalExemplaresVendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY 
    L.genero
ORDER BY 
    TotalExemplaresVendidos DESC;

-- ======================================
-- 6. Livros com vendas abaixo da média
-- ======================================
SELECT 
    L.titulo,
    SUM(E.quantidade) AS TotalExemplaresVendidos
FROM 
    Livro L
JOIN 
    Exemplar E ON L.ISBN = E.ISBN
GROUP BY 
    L.titulo
HAVING 
    SUM(E.quantidade) < (
        SELECT AVG(T1.TotalVendas)
        FROM (
            SELECT SUM(quantidade) AS TotalVendas
            FROM Exemplar
            GROUP BY ISBN
        ) T1
    )
ORDER BY 
    TotalExemplaresVendidos DESC;

-- ======================================
-- 7. Livros danificados dos últimos 3 meses
-- ======================================
SELECT 
    L.titulo AS Livro,
    E.estado AS EstadoExemplar,
    P.data_pedido AS DataDoPedido,
    P.valor_total AS ValorTotalDoPedido
FROM 
    Exemplar E
JOIN 
    Livro L ON E.ISBN = L.ISBN
JOIN 
    ItemPedido P ON E.id_pedido = P.id_pedido
WHERE 
    E.estado IN ('Danificado', 'Ligeiramente Danificado')
    AND P.data_pedido >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
ORDER BY 
    P.data_pedido DESC;

-- ======================================
-- 8. Funcionários com mais alocações
-- ======================================
SELECT 
    F.nome,
    COUNT(A.id_alocacao) AS TotalAlocacoes
FROM 
    Funcionario F
JOIN 
    Alocacao A ON F.CPF = A.CPF
GROUP BY 
    F.nome
ORDER BY 
    TotalAlocacoes DESC
LIMIT 5;

-- ======================================
-- 9. Livros lançados em um período específico com nome parcial
-- ======================================
SELECT 
    titulo,
    genero,
    data_publicacao
FROM 
    Livro
WHERE 
    data_publicacao BETWEEN '2025-01-15' AND '2025-08-30'
    AND genero LIKE 'Histórico';

-- ======================================
-- 10. Livros apenas da região de Recife
-- ======================================
SELECT 
    C.nome,
    C.endereco,
    P.valor_total,
    P.data_pedido
FROM 
    Cliente C
INNER JOIN 
    ItemPedido P ON C.id_cliente = P.id_cliente
WHERE 
    C.endereco LIKE '%Recife%';

-- ======================================
-- 11. Contagem de livros por gênero
-- ======================================
SELECT 
    genero,
    COUNT(*) AS Total_Livros
FROM 
    Livro
GROUP BY 
    genero
ORDER BY 
    Total_Livros DESC;

-- ======================================
-- 12. Contagem de livros por autor
-- ======================================
SELECT 
    A.nome AS nome_autor,
    COUNT(LA.ISBN) AS NumerosDeLivrosPublicados
FROM 
    Autor A
JOIN 
    Livro_Autor LA ON A.id_autor = LA.id_autor
GROUP BY 
    A.nome
ORDER BY 
    NumerosDeLivrosPublicados DESC;
-- ======================================
-- 13. Pedidos Pendentes:
-- ======================================
SELECT
    ip.id_pedido,
    c.nome AS nome_cliente,
    ip.data_pedido,
    st.descricao_st
FROM
    ItemPedido ip
JOIN
    Cliente c ON ip.id_cliente = c.id_cliente
JOIN
    StatusPedido st ON ip.id_pedido = st.id_pedido
WHERE
    st.tipo_status = 'Pendente';
-- ======================================
-- 14. Pedidos Concluídos no Mês de Março:
-- ======================================
SELECT
    ip.id_pedido,
    c.nome AS nome_cliente,
    ip.data_pedido,
    ip.valor_total
FROM
    ItemPedido ip
JOIN
    Cliente c ON ip.id_cliente = c.id_cliente
JOIN
    StatusPedido st ON ip.id_pedido = st.id_pedido
WHERE
    st.tipo_status = 'Concluído'
    AND MONTH(ip.data_pedido) = 3
    AND YEAR(ip.data_pedido) = 2025; -- Adicionei o ano para precisão.
-- ======================================
-- 15.Devolução do Mês de Outubro
-- ======================================
SELECT
    d.id_devolucao,
    d.data_devolucao,
    d.motivo,
    ip.id_pedido,
    c.nome AS nome_cliente
FROM
    Devolucao d
JOIN
    ItemPedido ip ON d.id_pedido = ip.id_pedido
JOIN
    Cliente c ON ip.id_cliente = c.id_cliente
WHERE
    MONTH(d.data_devolucao) = 10;
-- ======================================
-- 16.Funcionários com Mais de 3 Advertências
-- ======================================
SELECT
    f.nome,
    f.CPF,
    COUNT(a.id_advertencia) AS total_advertencias
FROM
    Funcionario f
JOIN
    Advertencia a ON f.CPF = a.CPF
GROUP BY
    f.CPF, f.nome
HAVING
    COUNT(a.id_advertencia) > 1;
-- ======================================
-- 17.Faltas dos Funcionários no Mês de Setembro
-- ======================================
SELECT
    f.nome,
    fa.data_falta,
    fa.justificativa
FROM
    Falta fa
JOIN
    Funcionario f ON fa.CPF = f.CPF
WHERE
    MONTH(fa.data_falta) = 9;


-- ======================================
-- 18. Total de livros por área de conhecimento
-- ======================================

SELECT 
    AC.descricao_ac AS AreaConhecimento,
    COUNT(DISTINCT LA.ISBN) AS TotalLivros
FROM 
    AreaConhecimento AC
JOIN 
    Livro L ON 0=0 -- placeholder
JOIN 
    Livro_Autor LA ON L.ISBN = LA.ISBN
GROUP BY 
    AC.descricao_ac;

-- ======================================
-- 19.Férias do Mês da Pesquisa (Atual)
-- ======================================
SELECT
    f.nome AS nome_funcionario,
    fe.data_inicio,
    fe.data_fim
FROM
    Ferias fe
JOIN
    Funcionario f ON fe.CPF = f.CPF
WHERE
    '2025-10-01' <= fe.data_fim
    AND '2025-10-31' >= fe.data_inicio;
-- ======================================
-- 20.Autores do Brasil com Mais de 30 Anos
-- ======================================
SELECT
    nome,
    data_nascimento,
    (YEAR(CURDATE()) - YEAR(data_nascimento)) - (RIGHT(CURDATE(), 5) < RIGHT(data_nascimento, 5)) AS idade
FROM
    Autor
WHERE
    nacionalidade = 'Brasileira'
    AND (YEAR(CURDATE()) - YEAR(data_nascimento)) - (RIGHT(CURDATE(), 5) < RIGHT(data_nascimento, 5)) > 100;
