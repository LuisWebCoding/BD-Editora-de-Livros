USE projetotrio;

-- Atualizar Endereço do Cliente
UPDATE Cliente
SET endereco = 'Recife, PE'
WHERE id_cliente IN (2, 8, 17, 25);

UPDATE Cliente
SET endereco = 'Olinda, PE'
WHERE id_cliente IN (1, 7, 16, 24);

UPDATE Cliente
SET endereco = 'São Paulo, SP'
WHERE id_cliente IN (6, 15, 23);

UPDATE Cliente
SET endereco = 'Boa Viagem, PE'
WHERE id_cliente IN (5, 14, 22);

UPDATE Cliente
SET endereco = 'Casa Amarela, PE'
WHERE id_cliente IN (4, 13, 21);

UPDATE Cliente
SET endereco = 'Rio de Janeiro, RJ'
WHERE id_cliente IN (3, 12, 20);

UPDATE Cliente
SET endereco = 'Madureira, RJ'
WHERE id_cliente IN (11, 19);

UPDATE Cliente
SET endereco = 'Natal, RN'
WHERE id_cliente IN (10, 18);

UPDATE Cliente
SET endereco = 'Natal, RN'
WHERE id_cliente IN (9, 17);

-- Alterar Telefone do Funcionário
UPDATE Funcionario
SET telefone = '(81) 91234-5678'
WHERE CPF = '123.456.789-00';

-- Mudar o Estado de um exemplar para Danificado

UPDATE Exemplar
SET estado = 'Danificado'
WHERE id_exemplar = 5;


-- Mudar salário de um funcionário
UPDATE Funcionario
SET salario = 4500.00
WHERE CPF = '987.654.321-00';

-- Alterar a quantidade de exemplares num estoque
UPDATE Exemplar
SET quantidade = 10
WHERE id_exemplar = 8;

-- Alterar o valor total de um pedido
UPDATE ItemPedido
SET valor_total = 250.75
WHERE id_pedido = 3;

-- Alterar o cargo de um funcionário promovido (Promovido de Vendedor para Coordenador)
UPDATE Funcionario
SET id_cargo = 18
WHERE CPF = '999.000.111-22';

-- Atualizar o campo de localização de um exemplar movido de prateleira
UPDATE Exemplar
SET localizacao = 'Estante B - Prateleira 3'
WHERE id_exemplar = 18;

-- Atualizar o salário de todos os funcionários do departamento editorial com aumento de 10%
UPDATE Funcionario
SET salario = salario * 1.10
WHERE id_departamento IN (
    SELECT id_departamento FROM Departamento WHERE nome_dep = 'Editorial'
);

--------------------------------------------------
-- COMANDOS DELETE
--------------------------------------------------

-- Remover um exemplar do sistema
DELETE FROM Exemplar
WHERE ISBN = '9788574067914';

-- Remover um livro do sistema
DELETE FROM Livro
WHERE ISBN = '9788580413867';

select * from Exemplar; 

-- Excluir um registro de ponto antigo
DELETE FROM Registro_Ponto
WHERE id_registro = 25;

-- Deletar uma advertência de um funcionário
DELETE FROM Advertencia
WHERE id_advertencia = 10;

-- Remover uma alocação finalizada
DELETE FROM Alocacao
WHERE id_alocacao = 8;

-- Excluir uma palavra-chave sem uso (ajustado: id_departamento não existe em PalavraChave)
DELETE FROM PalavraChave
WHERE id_chave = 5;

-- Deletar status de pedido antigo
DELETE FROM StatusPedido
WHERE id_status = 20;

-- Remover um cliente da lista
DELETE FROM Cliente
WHERE id_cliente = 20;


-- Remover pedidos com Status Cancelado de 6 meses ou mais
SET SQL_SAFE_UPDATES = 0;

DELETE FROM StatusPedido
WHERE tipo_status = 'Cancelado'
AND id_pedido IN (
    SELECT id_pedido FROM ItemPedido
    WHERE data_pedido < DATE_SUB(DATE('2024-12-31'), INTERVAL 6 MONTH)
);

SET SQL_SAFE_UPDATES = 1;
