CREATE DATABASE projetotrio; 
USE  projetotrio;
-- DROP DATABASE projetotrio;

CREATE TABLE Clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    email VARCHAR(100),
    endereco VARCHAR(150),
    telefone VARCHAR(10) 
);

CREATE TABLE Livro (
    ISBN VARCHAR(20) PRIMARY KEY,
    genero VARCHAR(50), 
    data_publicacao DATE,
    titulo VARCHAR(150),
    numero_pagina INT
);

CREATE TABLE Autor (
    id_autor INT PRIMARY KEY, 
    nome VARCHAR(100),
    biografia TEXT,
    data_nascimento VARCHAR(10),
    nacionalidade VARCHAR(50)
);

CREATE TABLE Livro_Autor (
    ISBN VARCHAR(20),
    id_autor INT,
	PRIMARY KEY (ISBN, id_autor), 
	FOREIGN KEY (ISBN) REFERENCES Livro(ISBN), 
    FOREIGN KEY (id_autor) REFERENCES Autor(id_autor) 
);


CREATE TABLE AreaConhecimento (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    descricao_ac VARCHAR(100)
);

CREATE TABLE Livro_Area (
    ISBN VARCHAR(20),
    id_area INT,
    PRIMARY KEY (ISBN, id_area),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN) ON DELETE CASCADE,
    FOREIGN KEY (id_area) REFERENCES AreaConhecimento(id_area) ON DELETE CASCADE
);


CREATE TABLE PalavraChave (
    id_chave INT PRIMARY KEY AUTO_INCREMENT,
    descricao_pc VARCHAR(100)
);

CREATE TABLE Livro_Chave (
    ISBN VARCHAR(20),
    id_chave INT,
    PRIMARY KEY (ISBN, id_chave),
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN) ON DELETE CASCADE,
    FOREIGN KEY (id_chave) REFERENCES PalavraChave(id_chave) ON DELETE CASCADE
);


CREATE TABLE ItemPedido ( 
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATE,
    valor_total DECIMAL(10,2),
    forma_pag VARCHAR(50),
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES Clientes (id_cliente) -- vai ter que alterar para Cliente
);

CREATE TABLE Exemplar (
    id_exemplar INT PRIMARY KEY AUTO_INCREMENT,
    localizacao VARCHAR(50),
    quantidade INT,
    estado VARCHAR(50),
    id_pedido INT,
    ISBN VARCHAR(20),
    FOREIGN KEY (id_pedido) REFERENCES ItemPedido (id_pedido),
    FOREIGN KEY (ISBN) REFERENCES Livro (ISBN)
);

CREATE TABLE StatusPedido (
    id_status INT PRIMARY KEY AUTO_INCREMENT,
    descricao_st VARCHAR(100),
    -- tipo_status ENUM('Pendente', 'Em andamento', 'Concluído', 'Cancelado', "Enviado", "Danificado"),
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES ItemPedido (id_pedido)
);

CREATE TABLE Devolucao (
    id_devolucao INT PRIMARY KEY AUTO_INCREMENT,
    data_devolucao DATE,
    quantidade INT,
    motivo VARCHAR(100),
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES ItemPedido (id_pedido)
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    id_supervisor INT,
    nome_dep VARCHAR(100)
);

CREATE TABLE Cargo (
    id_cargo INT PRIMARY KEY AUTO_INCREMENT,
    nome_cargo VARCHAR(100)
);

CREATE TABLE Funcionario (
    CPF VARCHAR(9) PRIMARY KEY,
    cargo VARCHAR(100),
    telefone VARCHAR(20),
    nome VARCHAR(100), 
	salario DECIMAL(10,2),
    id_departamento INT,
    id_cargo INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id_departamento),
    FOREIGN KEY (id_cargo) REFERENCES Cargo (id_cargo)
);

CREATE TABLE EnderecoFuncionario (
    id_endereco INT PRIMARY KEY AUTO_INCREMENT,
    CPF VARCHAR(14),
    rua VARCHAR(100),
    numero VARCHAR(10),
    bairro VARCHAR(50),
    cidade VARCHAR(50),
    estado VARCHAR(2),
    cep VARCHAR(10),
    complemento VARCHAR(50),
    FOREIGN KEY (CPF) REFERENCES Funcionario(CPF)
);

CREATE TABLE Registro_Ponto (
    id_registro INT PRIMARY KEY AUTO_INCREMENT,
    entrada DATE,
    saida DATE,
    data_saida DATE,
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

CREATE TABLE Advertencia (
    id_advertencia INT PRIMARY KEY AUTO_INCREMENT,
    motivo VARCHAR(150),
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

CREATE TABLE Falta (
    id_falta INT PRIMARY KEY AUTO_INCREMENT,
    data_falta DATE,
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

CREATE TABLE Alocacao (
    id_alocacao INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
    data_fim DATE,
    horas_trabalhada INT,
    funcao VARCHAR(100),
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

CREATE TABLE Dependente (
    id_dependente INT PRIMARY KEY AUTO_INCREMENT,
    sexo CHAR(1),
    data_nascimento DATE,
    nome_dependente VARCHAR(100),
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

CREATE TABLE Ferias (
    id_ferias INT PRIMARY KEY AUTO_INCREMENT,
    data_inicio DATE,
    data_fim DATE,
    CPF VARCHAR(14),
    FOREIGN KEY (CPF) REFERENCES Funcionario (CPF)
);

-- Tabelas de relacionamento N:N

CREATE TABLE LivroPalavra (
    ISBN VARCHAR(20),
    id_chave INT,
    FOREIGN KEY (ISBN) REFERENCES Livro(ISBN),
    FOREIGN KEY (id_chave) REFERENCES PalavraChave(id_chave),
    PRIMARY KEY (ISBN, id_chave)
);


-- VIEWS ---------------------------------------------------------------------------------


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












