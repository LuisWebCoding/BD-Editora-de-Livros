-- ALTER TABLES
use projetotrio;

-- ALTER tabela "Clientes" (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Clientes RENAME TO Cliente;
ALTER TABLE Cliente MODIFY telefone VARCHAR(20);

-- ALTER tabela "Livro" (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Livro ADD descricao TEXT;

-- ALTER tabela "Autor" 
ALTER TABLE livro_autor DROP FOREIGN KEY livro_autor_ibfk_2;

ALTER TABLE Autor MODIFY id_autor INT AUTO_INCREMENT;

ALTER TABLE livro_autor
ADD CONSTRAINT livro_autor_ibfk_2 FOREIGN KEY (id_autor) REFERENCES Autor(id_autor);

ALTER TABLE Autor
MODIFY data_nascimento DATE;

-- ALTER tabela StatusPedido (rodar esse Alter antes de rodar os inserts)
ALTER TABLE StatusPedido 
ADD COLUMN tipo_status ENUM('Pendente', 'Em andamento', 'Concluído', 'Cancelado', 'Enviado', 'Danificado') DEFAULT 'Pendente';

-- ALTER tabela Departamento (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Departamento 
ADD COLUMN  descricao_att VARCHAR(100);

-- ALTER tabela Funcionario (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Funcionario
MODIFY CPF VARCHAR(14);

-- ALTER tabela Registro_Ponto (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Registro_Ponto
MODIFY entrada DATETIME,
MODIFY saida DATETIME; 

-- ALTER tabela Advertencia (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Advertencia
ADD COLUMN data_advertencia DATE;

-- ALTER tabela Falta (rodar esse Alter antes de rodar os inserts)
ALTER TABLE Falta
ADD COLUMN justificativa VARCHAR(150); 

-- automatizando a exclusão de livros
ALTER TABLE Exemplar
DROP FOREIGN KEY exemplar_ibfk_2;

ALTER TABLE Exemplar
ADD CONSTRAINT exemplar_ibfk_2
FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
ON DELETE CASCADE;

-- automatizando a exclusão de livros
ALTER TABLE Livro_Autor
DROP FOREIGN KEY livro_autor_ibfk_1;

ALTER TABLE Livro_Autor
ADD CONSTRAINT livro_autor_ibfk_1
FOREIGN KEY (ISBN) REFERENCES Livro(ISBN)
ON DELETE CASCADE;

-- automatizando a exclusão de pedidos
ALTER TABLE ItemPedido
DROP FOREIGN KEY itempedido_ibfk_1;

ALTER TABLE ItemPedido
ADD CONSTRAINT itempedido_ibfk_1
FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
ON DELETE CASCADE;

-- automatizando a Devolucao
ALTER TABLE Devolucao
DROP FOREIGN KEY devolucao_ibfk_1;

ALTER TABLE Devolucao
ADD CONSTRAINT devolucao_ibfk_1
FOREIGN KEY (id_pedido) REFERENCES ItemPedido(id_pedido)
ON DELETE CASCADE;

-- automatizando a Exemplar
ALTER TABLE Exemplar
DROP FOREIGN KEY exemplar_ibfk_1;

ALTER TABLE Exemplar
ADD CONSTRAINT exemplar_ibfk_1
FOREIGN KEY (id_pedido) REFERENCES ItemPedido(id_pedido)
ON DELETE CASCADE;

-- automatizando a StatusPedido
ALTER TABLE StatusPedido
DROP FOREIGN KEY statuspedido_ibfk_1;

ALTER TABLE StatusPedido
ADD CONSTRAINT statuspedido_ibfk_1
FOREIGN KEY (id_pedido) REFERENCES ItemPedido(id_pedido)
ON DELETE CASCADE;

