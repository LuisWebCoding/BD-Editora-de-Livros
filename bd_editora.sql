-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: projetotrio
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `advertencia`
--

DROP TABLE IF EXISTS `advertencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertencia` (
  `id_advertencia` int NOT NULL AUTO_INCREMENT,
  `data_advertencia` date DEFAULT NULL,
  `motivo` varchar(150) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_advertencia`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `advertencia_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertencia`
--

LOCK TABLES `advertencia` WRITE;
/*!40000 ALTER TABLE `advertencia` DISABLE KEYS */;
INSERT INTO `advertencia` VALUES (1,'2024-05-10','Atraso recorrente na entrega de relatórios.','111.222.333-01'),(2,'2024-05-15','Uso indevido de equipamentos da empresa.','222.333.444-02'),(3,'2024-05-20','Comportamento inadequado em reunião.','333.444.555-03'),(4,'2024-05-25','Violação de política de segurança de dados.','444.555.666-04'),(5,'2024-06-01','Ausência não justificada.','555.666.777-05'),(6,'2024-06-05','Entrega de material com erros graves.','666.777.888-06'),(7,'2024-06-10','Descumprimento de prazos de campanha.','777.888.999-07'),(8,'2024-06-15','Conflito com outros colegas.','888.999.000-08'),(9,'2024-06-20','Utilização excessiva da internet para fins pessoais.','999.000.111-09'),(10,'2024-06-25','Falha ao seguir protocolo de codificação.','000.111.222-10'),(11,'2024-07-01','Reincidência em atraso.','101.202.303-11'),(12,'2024-07-05','Recusa em atender solicitação da chefia.','112.233.445-12'),(13,'2024-07-10','Quebra de sigilo de informações.','131.415.516-13'),(14,'2024-07-15','Não participação em treinamento obrigatório.','141.516.617-14'),(15,'2024-07-20','Dano a patrimônio da empresa.','151.617.718-15'),(16,'2024-07-25','Uso inadequado do uniforme.','161.718.819-16'),(17,'2024-08-01','Desrespeito à hierarquia.','171.819.910-17'),(18,'2024-08-05','Atraso na entrega de original para edição.','181.910.012-18'),(19,'2024-08-10','Falta de atenção na revisão.','191.012.213-19'),(20,'2024-08-15','Descumprimento de horário de almoço.','201.102.304-20');
/*!40000 ALTER TABLE `advertencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alocacao`
--

DROP TABLE IF EXISTS `alocacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alocacao` (
  `id_alocacao` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `horas_trabalhada` int DEFAULT NULL,
  `funcao` varchar(100) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_alocacao`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `alocacao_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alocacao`
--

LOCK TABLES `alocacao` WRITE;
/*!40000 ALTER TABLE `alocacao` DISABLE KEYS */;
INSERT INTO `alocacao` VALUES (1,'2024-01-01','2024-03-31',300,'Revisão do Livro A','111.222.333-01'),(2,'2024-04-01','2024-06-30',250,'Organização de Estoque Trimestral','222.333.444-02'),(3,'2024-07-01','2024-09-30',350,'Campanha de Vendas de Primavera','333.444.555-03'),(4,'2024-01-01','2024-12-31',50,'Fechamento Anual','444.555.666-04'),(5,'2024-05-01','2024-07-31',180,'Recrutamento de Estagiários','555.666.777-05'),(6,'2024-08-01','2024-10-31',220,'Criação de Capas de Ficção','666.777.888-06'),(7,'2024-01-01','2024-03-31',100,'Lançamento de Produto Digital','777.888.999-07'),(8,'2024-04-01','2024-06-30',80,'Consultoria Jurídica de Contratos','888.999.000-08'),(9,'2024-07-01','2024-09-30',120,'Auxílio na Organização de Arquivos','999.000.111-09'),(10,'2024-01-01','2024-03-31',280,'Desenvolvimento do Novo Site','000.111.222-10'),(11,'2024-04-01','2024-06-30',200,'Revisão de Manuais Técnicos','101.202.303-11'),(12,'2024-07-01','2024-09-30',320,'Edição do Livro B','112.233.445-12'),(13,'2024-01-01','2024-03-31',150,'Gestão de Campanhas de E-mail','131.415.516-13'),(14,'2024-04-01','2024-06-30',190,'Análise de Tendências de Mercado','141.516.617-14'),(15,'2024-07-01','2024-09-30',160,'Organização de Eventos de Imprensa','151.617.718-15'),(16,'2024-01-01','2024-03-31',110,'Elaboração de Newsletters Internas','161.718.819-16'),(17,'2024-04-01','2024-06-30',90,'Treinamento de Equipe de Vendas','171.819.910-17'),(18,'2024-07-01','2024-09-30',270,'Edição do Livro C','181.910.012-18'),(19,'2024-01-01','2024-03-31',240,'Revisão de Provas Finais','191.012.213-19'),(20,'2024-04-01','2024-06-30',130,'Design de Banners Promocionais','201.102.304-20');
/*!40000 ALTER TABLE `alocacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areaconhecimento`
--

DROP TABLE IF EXISTS `areaconhecimento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areaconhecimento` (
  `id_area` int NOT NULL AUTO_INCREMENT,
  `descricao_ac` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areaconhecimento`
--

LOCK TABLES `areaconhecimento` WRITE;
/*!40000 ALTER TABLE `areaconhecimento` DISABLE KEYS */;
INSERT INTO `areaconhecimento` VALUES (1,'Ficção e Literatura'),(2,'Ciências Exatas e Naturais'),(3,'Ciências Humanas e Sociais'),(4,'Tecnologia e Informática'),(5,'Artes e Gastronomia'),(6,'Saúde e Bem-Estar'),(7,'Negócios e Finanças'),(8,'História e Geografia'),(9,'Autoajuda e Desenvolvimento Pessoal'),(10,'Infantil e Juvenil'),(11,'Engenharia e Arquitetura'),(12,'Direito e Legislação'),(13,'Comunicação e Mídia'),(14,'Psicologia e Filosofia'),(15,'Religião e Espiritualidade'),(16,'Educação'),(17,'Esportes e Lazer'),(18,'Poesia e Crônicas'),(19,'Biografias e Memórias'),(20,'Geopolítica');
/*!40000 ALTER TABLE `areaconhecimento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `associado_livropalavra`
--

DROP TABLE IF EXISTS `associado_livropalavra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `associado_livropalavra` (
  `ISBN` varchar(20) NOT NULL,
  `id_chave` int NOT NULL,
  PRIMARY KEY (`ISBN`,`id_chave`),
  KEY `id_chave` (`id_chave`),
  CONSTRAINT `associado_livropalavra_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`),
  CONSTRAINT `associado_livropalavra_ibfk_2` FOREIGN KEY (`id_chave`) REFERENCES `palavrachave` (`id_chave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `associado_livropalavra`
--

LOCK TABLES `associado_livropalavra` WRITE;
/*!40000 ALTER TABLE `associado_livropalavra` DISABLE KEYS */;
INSERT INTO `associado_livropalavra` VALUES ('978-85-359-2778-1',1),('978-85-359-2778-2',2),('978-85-359-2778-3',3),('978-85-359-2778-4',4),('978-85-359-2778-5',5),('978-85-359-2778-6',6),('978-85-359-2778-7',7),('978-85-359-2778-8',8),('978-85-359-2778-9',9),('978-85-359-2779-0',10),('978-85-359-2779-1',11),('978-85-359-2779-2',12),('978-85-359-2779-3',13),('978-85-359-2779-4',14),('978-85-359-2779-5',15),('978-85-359-2779-6',16),('978-85-359-2779-7',17),('978-85-359-2779-8',18),('978-85-359-2779-9',19),('978-85-359-2780-0',20);
/*!40000 ALTER TABLE `associado_livropalavra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `biografia` text,
  `data_nascimento` date DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Maria Oliveira','Autora de FC premiada.','1980-11-20','Brasileira'),(2,'Pedro Almeida','Jornalista e escritor de romances.','1995-03-10','Português'),(3,'Laura Costa','Especialista em suspense psicológico.','1975-01-01','Norte-Americana'),(4,'Ricardo Santos','Criador de mundos fantásticos.','1988-07-25','Brasileiro'),(5,'Jennifer Smith','Cientista e biógrafa.','1965-05-12','Canadense'),(6,'Chef Émile Dubois','Renomado Chef francês, vive no Brasil.','1970-04-03','Francesa'),(7,'Alexandre Viana','Consultor em produtividade.','1990-12-19','Brasileiro'),(8,'Dr. Helena Cruz','Historiadora e professora universitária.','1955-08-08','Portuguesa'),(9,'Sofia Mendes','Jovem poeta brasileira.','2000-02-14','Brasileira'),(10,'Marc Johnson','Autor de thrillers de ação.','1978-06-21','Britânica'),(11,'Alice Ferreira','Ilustradora e autora infantil.','1992-09-09','Brasileira'),(12,'Kenji Tanaka','Engenheiro de software e escritor.','1985-10-30','Japonês'),(13,'Eva Monteiro','Roteirista e dramaturga.','1968-04-01','Brasileira'),(14,'Victor Hugo','Especialista em literatura de terror.','1973-11-11','Mexicano'),(15,'Nutri Clara','Nutricionista e palestrante.','1991-03-28','Brasileira'),(16,'Prof. João Bosco','Sociólogo e pesquisador.','1950-01-17','Brasileiro'),(17,'Lia Dutra','Arqueóloga e escritora de aventuras.','1983-12-05','Brasileira'),(18,'Samuel King','Quadrinista e artista visual.','1994-02-22','Australiano'),(19,'Arthur Gomes','Jornalista esportivo.','1960-09-16','Brasileiro'),(20,'Beatriz Neves','Consultora de marketing.','1987-07-07','Brasileira');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargo` (
  `id_cargo` int NOT NULL AUTO_INCREMENT,
  `nome_cargo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (1,'Editor Sênior'),(2,'Revisor de Textos'),(3,'Designer Gráfico Júnior'),(4,'Analista Financeiro'),(5,'Gerente de Marketing'),(6,'Consultor de Vendas'),(7,'Desenvolvedor Backend'),(8,'Assistente de Logística'),(9,'Diretor Executivo'),(10,'Auxiliar de RH'),(11,'Cozinheiro Corporativo'),(12,'Bibliotecário'),(13,'Técnico de Suporte'),(14,'Especialista em E-commerce'),(15,'Coordenador Editorial'),(16,'Estagiário Administrativo'),(17,'Analista de Dados'),(18,'Relações Públicas'),(19,'Jornalista Interno'),(20,'Supervisor de Vendas');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Ana Silva','ana.silva@editora.com','Rua das Palmeiras, 100','(11) 98765-4321'),(2,'Bruno Costa','bruno.costa@editora.com','Av. Central, 50 Apto 201','(21) 99887-7665'),(3,'Carla Souza','carla.souza@editora.com','Rua da Paz, 30','(31) 95544-3322'),(4,'Daniel Melo','daniel.melo@editora.com','Travessa Sete, 15','(61) 91234-5678'),(5,'Eduarda Lima','eduarda.lima@editora.com','Praça da Liberdade, 5','(81) 97777-6666'),(6,'Fábio Rocha','fabio.rocha@editora.com','Estrada Velha, KM 10','(71) 96543-2109'),(7,'Giovana Nunes','giovana.nunes@editora.com','Rua Quinze de Novembro, 220','(51) 94433-2211'),(8,'Heitor Vieira','heitor.vieira@editora.com','Alameda das Acácias, 45','(41) 93210-9876'),(9,'Isabela Freitas','isabela.freitas@editora.com','Rua Nova, 88 Bloco C','(85) 92109-8765'),(10,'João Cordeiro','joao.cordeiro@editora.com','Av. Principal, 1500','(62) 91098-7654'),(11,'Karen Barbosa','karen.barbosa@editora.com','Rua dos Viajantes, 33','(92) 90987-6543'),(12,'Lucas Mendes','lucas.mendes@editora.com','Vila Madalena, 12','(19) 98765-1234'),(13,'Mariana Gomes','mariana.gomes@editora.com','Beco da Lapa, 55','(27) 97654-3210'),(14,'Nícolas Pereira','nicolas.pereira@editora.com','Rua da Praia, 201','(48) 96543-1098'),(15,'Olívia Santos','olivia.santos@editora.com','Jardim Florido, 77','(83) 95432-1098'),(16,'Paulo Teixeira','paulo.teixeira@editora.com','Rua do Comércio, 303','(91) 94321-0987'),(17,'Quésia Ribeiro','quesia.ribeiro@editora.com','Sítio Novo, Lote 10','(65) 93210-9876'),(18,'Renato Alves','renato.alves@editora.com','Av. Atlântica, 1200','(53) 92109-8765'),(19,'Sofia Campos','sofia.campos@editora.com','Rua B, Número 1','(82) 91098-7654'),(20,'Thiago Fernandes','thiago.fernandes@editora.com','Conjunto Habitacional, 9','(98) 90987-6543');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamento` (
  `id_departamento` int NOT NULL AUTO_INCREMENT,
  `descricao_att` varchar(100) DEFAULT NULL,
  `id_supervisor` int DEFAULT NULL,
  `nome_dep` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_departamento`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Responsável pela edição de conteúdo.',NULL,'Editorial'),(2,'Responsável pela distribuição de livros.',NULL,'Logística'),(3,'Cuida das vendas e relacionamento com clientes.',NULL,'Comercial'),(4,'Gerencia as finanças da editora.',NULL,'Financeiro'),(5,'Recrutamento e gestão de pessoas.',NULL,'Recursos Humanos'),(6,'Criação de capas e diagramação.',NULL,'Design Gráfico'),(7,'Promoção e divulgação de títulos.',NULL,'Marketing'),(8,'Negociação de direitos autorais e contratos.',NULL,'Jurídico'),(9,'Atendimento a autores e colaboradores.',NULL,'Secretaria'),(10,'Desenvolvimento e manutenção de sistemas.',NULL,'TI'),(11,'Gestão do estoque físico de livros.',NULL,'Almoxarifado'),(12,'Tradução e revisão de textos.',NULL,'Revisão'),(13,'Venda direta ao consumidor (e-commerce).',NULL,'E-commerce'),(14,'Pesquisa de mercado e tendências.',NULL,'Pesquisa'),(15,'Relações públicas e eventos.',NULL,'Eventos'),(16,'Parcerias com bibliotecas e escolas.',NULL,'Institucional'),(17,'Controle de qualidade de impressão.',NULL,'Produção Gráfica'),(18,'Análise de manuscritos e propostas.',NULL,'Aquisição'),(19,'Gerenciamento de canais de distribuição.',NULL,'Distribuição'),(20,'Suporte técnico interno.',NULL,'Suporte TI');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependente`
--

DROP TABLE IF EXISTS `dependente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dependente` (
  `id_dependente` int NOT NULL AUTO_INCREMENT,
  `sexo` char(1) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `nome_dependente` varchar(100) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_dependente`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `dependente_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependente`
--

LOCK TABLES `dependente` WRITE;
/*!40000 ALTER TABLE `dependente` DISABLE KEYS */;
INSERT INTO `dependente` VALUES (1,'M','2018-05-10','Pedro Matos','111.222.333-01'),(2,'F','2020-01-15','Maria Ribeiro','222.333.444-02'),(3,'M','2015-09-20','Lucas Lima','333.444.555-03'),(4,'F','2017-03-12','Juliana Lima','333.444.555-03'),(5,'F','2022-11-25','Sofia Rocha','444.555.666-04'),(6,'M','2019-07-30','Gabriel Souza','555.666.777-05'),(7,'M','2021-01-28','Cássio Souza','555.666.777-05'),(8,'F','2023-04-05','Lívia Gomes','666.777.888-06'),(9,'M','2016-02-12','Arthur Pires','777.888.999-07'),(10,'F','2018-06-05','Helena Pires','777.888.999-07'),(11,'M','2020-09-22','Fábio Pires','777.888.999-07'),(12,'F','2021-08-18','Isabela Noronha','888.999.000-08'),(13,'F','2017-06-01','Laura Sales','999.000.111-09'),(14,'M','2024-03-01','João Alves','000.111.222-10'),(15,'M','2014-12-01','Miguel Dantas','101.202.303-11'),(16,'M','2016-11-15','Ricardo Dantas','101.202.303-11'),(17,'F','2023-10-10','Heloísa Évora','112.233.445-12'),(18,'M','2019-03-20','Davi Feitosa','131.415.516-13'),(19,'F','2022-07-07','Bia Feitosa','131.415.516-13'),(20,'M','2022-07-07','Benício Guerra','141.516.617-14'),(21,'F','2015-05-05','Eliza Nunes','151.617.718-15'),(22,'M','2023-01-01','Theo Pimenta','161.718.819-16'),(23,'F','2024-02-14','Aline Pimenta','161.718.819-16'),(24,'F','2018-08-08','Manuella Quirino','171.819.910-17'),(25,'M','2020-04-04','Gustavo Quirino','171.819.910-17');
/*!40000 ALTER TABLE `dependente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devolucao`
--

DROP TABLE IF EXISTS `devolucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `devolucao` (
  `id_devolucao` int NOT NULL AUTO_INCREMENT,
  `data_devolucao` date DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `motivo` varchar(100) DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id_devolucao`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `devolucao_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_itempedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devolucao`
--

LOCK TABLES `devolucao` WRITE;
/*!40000 ALTER TABLE `devolucao` DISABLE KEYS */;
INSERT INTO `devolucao` VALUES (1,'2024-06-10',1,'Livro duplicado no pedido.',1),(2,'2024-06-15',1,'Capa danificada no transporte.',4),(3,'2024-06-20',2,'Produto incorreto enviado.',7),(4,'2024-06-25',1,'Desistência da compra.',10),(5,'2024-07-01',1,'Defeito de impressão.',13),(6,'2024-07-05',1,'Arrependimento de compra.',16),(7,'2024-07-10',1,'Produto incorreto.',19),(8,'2024-07-15',1,'Entrega incompleta.',2),(9,'2024-07-20',1,'Livro não lido.',5),(10,'2024-07-25',1,'Embalagem violada.',8),(11,'2024-08-01',1,'Mudança de endereço.',11),(12,'2024-08-05',1,'Presente recusado.',14),(13,'2024-08-10',1,'Erro na cor da capa.',17),(14,'2024-08-15',1,'Desistência.',20),(15,'2024-08-20',1,'Defeito na lombada.',3),(16,'2024-08-25',1,'Troca de título.',6),(17,'2024-09-01',1,'Recebido após prazo.',9),(18,'2024-09-05',1,'Problema na fatura.',12),(19,'2024-09-10',1,'Não gostou do conteúdo.',15),(20,'2024-09-15',1,'Excedeu a quantidade.',18);
/*!40000 ALTER TABLE `devolucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exemplar`
--

DROP TABLE IF EXISTS `exemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exemplar` (
  `id_exemplar` int NOT NULL AUTO_INCREMENT,
  `localizacao` varchar(50) DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_exemplar`),
  KEY `id_pedido` (`id_pedido`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `exemplar_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_itempedido` (`id_pedido`),
  CONSTRAINT `exemplar_ibfk_2` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exemplar`
--

LOCK TABLES `exemplar` WRITE;
/*!40000 ALTER TABLE `exemplar` DISABLE KEYS */;
INSERT INTO `exemplar` VALUES (1,'Estante A3-1',5,'Novo',1,'978-85-359-2778-1'),(2,'Estante B1-2',10,'Bom',2,'978-85-359-2778-2'),(3,'Estante C5-3',2,'Ligeiramente Danificado',3,'978-85-359-2778-3'),(4,'Estante A1-4',7,'Novo',4,'978-85-359-2778-4'),(5,'Estante D2-5',1,'Novo',5,'978-85-359-2778-5'),(6,'Estante E4-6',4,'Bom',6,'978-85-359-2778-6'),(7,'Estante F1-7',8,'Novo',7,'978-85-359-2778-7'),(8,'Estante G3-8',3,'Bom',8,'978-85-359-2778-8'),(9,'Estante H2-9',12,'Novo',9,'978-85-359-2778-9'),(10,'Estante I5-10',6,'Bom',10,'978-85-359-2779-0'),(11,'Estante J1-11',9,'Novo',11,'978-85-359-2779-1'),(12,'Estante K2-12',2,'Novo',12,'978-85-359-2779-2'),(13,'Estante L3-13',11,'Bom',13,'978-85-359-2779-3'),(14,'Estante M4-14',5,'Novo',14,'978-85-359-2779-4'),(15,'Estante N5-15',1,'Novo',15,'978-85-359-2779-5'),(16,'Estante O1-16',3,'Bom',16,'978-85-359-2779-6'),(17,'Estante P2-17',7,'Novo',17,'978-85-359-2779-7'),(18,'Estante Q3-18',10,'Bom',18,'978-85-359-2779-8'),(19,'Estante R4-19',4,'Novo',19,'978-85-359-2779-9'),(20,'Estante S5-20',6,'Novo',20,'978-85-359-2780-0');
/*!40000 ALTER TABLE `exemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `falta`
--

DROP TABLE IF EXISTS `falta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `falta` (
  `id_falta` int NOT NULL AUTO_INCREMENT,
  `data_falta` date DEFAULT NULL,
  `justificativa` varchar(150) DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_falta`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `falta_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `falta`
--

LOCK TABLES `falta` WRITE;
/*!40000 ALTER TABLE `falta` DISABLE KEYS */;
INSERT INTO `falta` VALUES (1,'2024-03-01','Atendimento médico de emergência.','111.222.333-01'),(2,'2024-03-15','Não justificada.','222.333.444-02'),(3,'2024-04-05','Acompanhamento de dependente doente.','333.444.555-03'),(4,'2024-04-20','Problemas com transporte público.','444.555.666-04'),(5,'2024-05-02','Não justificada.','555.666.777-05'),(6,'2024-05-18','Motivos pessoais urgentes.','666.777.888-06'),(7,'2024-06-03','Não justificada.','777.888.999-07'),(8,'2024-06-19','Atestado médico.','888.999.000-08'),(9,'2024-07-04','Não justificada.','999.000.111-09'),(10,'2024-07-21','Motivos de saúde.','000.111.222-10'),(11,'2024-08-08','Não justificada.','101.202.303-11'),(12,'2024-08-25','Compromisso familiar inadiável.','112.233.445-12'),(13,'2024-09-10','Não justificada.','131.415.516-13'),(14,'2024-09-27','Atestado de óbito.','141.516.617-14'),(15,'2024-10-15','Não justificada.','151.617.718-15'),(16,'2024-11-01','Reforma residencial.','161.718.819-16'),(17,'2024-11-18','Não justificada.','171.819.910-17'),(18,'2024-12-05','Problemas na rede elétrica.','181.910.012-18'),(19,'2025-01-01','Feriado não oficial (Não Justificada).','191.012.213-19'),(20,'2025-01-15','Atestado médico de filho.','201.102.304-20');
/*!40000 ALTER TABLE `falta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ferias`
--

DROP TABLE IF EXISTS `ferias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ferias` (
  `id_ferias` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_ferias`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `ferias_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ferias`
--

LOCK TABLES `ferias` WRITE;
/*!40000 ALTER TABLE `ferias` DISABLE KEYS */;
INSERT INTO `ferias` VALUES (1,'2024-07-15','2024-08-14','111.222.333-01'),(2,'2024-12-20','2025-01-18','222.333.444-02'),(3,'2024-01-05','2024-02-03','333.444.555-03'),(4,'2024-08-01','2024-08-30','444.555.666-04'),(5,'2024-03-10','2024-04-08','555.666.777-05'),(6,'2024-09-01','2024-09-30','666.777.888-06'),(7,'2024-02-15','2024-03-14','777.888.999-07'),(8,'2024-11-01','2024-11-30','888.999.000-08'),(9,'2024-04-20','2024-05-19','999.000.111-09'),(10,'2024-10-05','2024-11-03','000.111.222-10'),(11,'2024-05-15','2024-06-13','101.202.303-11'),(12,'2024-12-01','2024-12-30','112.233.445-12'),(13,'2024-06-10','2024-07-09','131.415.516-13'),(14,'2025-01-10','2025-02-08','141.516.617-14'),(15,'2024-07-01','2024-07-30','151.617.718-15'),(16,'2024-08-25','2024-09-23','161.718.819-16'),(17,'2024-09-15','2024-10-14','171.819.910-17'),(18,'2024-02-01','2024-03-01','181.910.012-18'),(19,'2024-10-20','2024-11-18','191.012.213-19'),(20,'2024-03-05','2024-04-03','201.102.304-20');
/*!40000 ALTER TABLE `ferias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `CPF` varchar(14) NOT NULL,
  `cargo` varchar(100) DEFAULT NULL,
  `endereco` varchar(150) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `id_departamento` int DEFAULT NULL,
  `id_cargo` int DEFAULT NULL,
  PRIMARY KEY (`CPF`),
  KEY `id_departamento` (`id_departamento`),
  KEY `id_cargo` (`id_cargo`),
  CONSTRAINT `funcionario_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id_departamento`),
  CONSTRAINT `funcionario_ibfk_2` FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('000.111.222-10',NULL,'Av. Kappa, 100','(10) 00000-0000','Beto Alves',10,7),('101.202.303-11',NULL,'Rua Lambda, 110','(11) 01010-1010','Cecília Dantas',11,2),('111.222.333-01',NULL,'Rua Alfa, 10','(11) 11111-1111','Ricardo Matos',1,15),('112.233.445-12',NULL,'Av. Mi, 120','(12) 12121-2121','Durval Évora',12,1),('131.415.516-13',NULL,'Rua Ni, 130','(13) 13131-3131','Elisa Feitosa',13,14),('141.516.617-14',NULL,'Av. Xi, 140','(14) 14141-4141','Felipe Guerra',14,17),('151.617.718-15',NULL,'Rua Omicron, 150','(15) 15151-5151','Gisele Nunes',15,18),('161.718.819-16',NULL,'Av. Pi, 160','(16) 16161-6161','Hugo Pimenta',16,19),('171.819.910-17',NULL,'Rua Rho, 170','(17) 17171-7171','Inácio Quirino',17,20),('181.910.012-18',NULL,'Av. Sigma, 180','(18) 18181-8181','Júlia Ramos',18,1),('191.012.213-19',NULL,'Rua Tau, 190','(19) 19191-9191','Kleber Salles',19,2),('201.102.304-20',NULL,'Av. Ypsilon, 200','(20) 20202-2020','Lúcia Telles',20,3),('222.333.444-02',NULL,'Av. Beta, 20','(22) 22222-2222','Sonia Ribeiro',2,8),('333.444.555-03',NULL,'Rua Gama, 30','(33) 33333-3333','Thiago Lima',3,6),('444.555.666-04',NULL,'Av. Delta, 40','(44) 44444-4444','Viviane Rocha',4,4),('555.666.777-05',NULL,'Rua Epsilon, 50','(55) 55555-5555','Wilson Souza',5,10),('666.777.888-06',NULL,'Av. Zeta, 60','(66) 66666-6666','Xavier Gomes',6,3),('777.888.999-07',NULL,'Rua Eta, 70','(77) 77777-7777','Yara Pires',7,5),('888.999.000-08',NULL,'Av. Teta, 80','(88) 88888-8888','Zeca Noronha',8,9),('999.000.111-09',NULL,'Rua Iota, 90','(99) 99999-9999','Amanda Sales',9,16);
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `ISBN` varchar(20) NOT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `descricao` text,
  `data_publicacao` date DEFAULT NULL,
  `titulo` varchar(150) DEFAULT NULL,
  `numero_pagina` int DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES ('978-85-359-2778-1','Ficção Científica','Uma aventura espacial épica.','2023-01-15','O Último Horizonte',450),('978-85-359-2778-2','Romance','Amor proibido no século XIX.','2022-05-20','Caminhos Cruzados',320),('978-85-359-2778-3','Suspense','Um detetive investiga um caso misterioso.','2021-11-10','A Sombra Oculta',280),('978-85-359-2778-4','Fantasia','O reino de Eldoria ameaçado por magia negra.','2024-03-01','O Cristal de Eldoria',510),('978-85-359-2778-5','Biografia','A vida e obra de um grande cientista.','2020-07-05','Mentes Brilhantes',400),('978-85-359-2778-6','Gastronomia','Receitas clássicas da culinária brasileira.','2019-04-12','Sabores do Brasil',250),('978-85-359-2778-7','Autoajuda','Guia para a produtividade pessoal.','2023-09-22','O Poder do Foco',180),('978-85-359-2778-8','História','Análise da Revolução Francesa.','2018-02-28','Eco da Guilhotina',600),('978-85-359-2778-9','Poesia','Coletânea de poemas sobre a natureza.','2024-01-01','Versos Verdes',150),('978-85-359-2779-0','Thriller','Perseguição intensa em Nova York.','2022-12-07','Voo Cego',380),('978-85-359-2779-1','Infantil','A aventura do pequeno dragãozinho.','2021-06-18','Draco e o Tesouro',80),('978-85-359-2779-2','Tecnologia','Introdução à Inteligência Artificial.','2023-10-10','Algoritmos do Futuro',300),('978-85-359-2779-3','Drama','Conflito familiar em uma pequena cidade.','2020-03-25','O Velho Moinho',350),('978-85-359-2779-4','Horror','Mansão assombrada no interior.','2019-08-08','O Casarão da Névoa',290),('978-85-359-2779-5','Saúde','Guia completo de nutrição.','2024-04-04','Comer Bem Viver Melhor',220),('978-85-359-2779-6','Ciências Sociais','Estudo sobre a desigualdade.','2017-11-30','A Teia Social',480),('978-85-359-2779-7','Aventura','Busca por um artefato perdido na Amazônia.','2023-07-01','O Mapa Perdido',410),('978-85-359-2779-8','HQ','Série de ficção científica em quadrinhos.','2024-05-15','Cosmos: Parte I',120),('978-85-359-2779-9','Esportes','História dos Jogos Olímpicos.','2016-01-20','Ouro e Glória',330),('978-85-359-2780-0','Negócios','Estratégias de Marketing Digital.','2022-04-14','O Vendedor do Século',260);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro_autor`
--

DROP TABLE IF EXISTS `livro_autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro_autor` (
  `ISBN` varchar(20) NOT NULL,
  `id_autor` int NOT NULL,
  PRIMARY KEY (`ISBN`,`id_autor`),
  KEY `id_autor` (`id_autor`),
  CONSTRAINT `livro_autor_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `livro` (`ISBN`),
  CONSTRAINT `livro_autor_ibfk_2` FOREIGN KEY (`id_autor`) REFERENCES `autor` (`id_autor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro_autor`
--

LOCK TABLES `livro_autor` WRITE;
/*!40000 ALTER TABLE `livro_autor` DISABLE KEYS */;
INSERT INTO `livro_autor` VALUES ('978-85-359-2778-1',1),('978-85-359-2778-2',1),('978-85-359-2778-2',2),('978-85-359-2778-3',3),('978-85-359-2779-0',3),('978-85-359-2778-4',4),('978-85-359-2778-5',5),('978-85-359-2778-6',6),('978-85-359-2778-7',7),('978-85-359-2778-8',8),('978-85-359-2778-9',9),('978-85-359-2778-1',10),('978-85-359-2779-0',10),('978-85-359-2779-1',11),('978-85-359-2779-4',11),('978-85-359-2779-2',12),('978-85-359-2779-3',13),('978-85-359-2779-5',13),('978-85-359-2779-4',14),('978-85-359-2779-3',15),('978-85-359-2779-5',15),('978-85-359-2778-8',16),('978-85-359-2779-6',16),('978-85-359-2779-7',17),('978-85-359-2779-8',18),('978-85-359-2779-7',19),('978-85-359-2779-9',19),('978-85-359-2780-0',20);
/*!40000 ALTER TABLE `livro_autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `palavrachave`
--

DROP TABLE IF EXISTS `palavrachave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `palavrachave` (
  `id_chave` int NOT NULL AUTO_INCREMENT,
  `descricao_pc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_chave`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `palavrachave`
--

LOCK TABLES `palavrachave` WRITE;
/*!40000 ALTER TABLE `palavrachave` DISABLE KEYS */;
INSERT INTO `palavrachave` VALUES (1,'Espaço'),(2,'Romance'),(3,'Detetive'),(4,'Magia'),(5,'Biografia'),(6,'Receitas'),(7,'Produtividade'),(8,'Revolução'),(9,'Natureza'),(10,'Ação'),(11,'Infância'),(12,'Inteligência Artificial'),(13,'Família'),(14,'Assombração'),(15,'Nutrição'),(16,'Desigualdade'),(17,'Aventura'),(18,'Quadrinhos'),(19,'Olimpíadas'),(20,'Marketing');
/*!40000 ALTER TABLE `palavrachave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_itempedido`
--

DROP TABLE IF EXISTS `pedido_itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_itempedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `data_pedido` date DEFAULT NULL,
  `valor_total` decimal(10,2) DEFAULT NULL,
  `forma_pag` varchar(50) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `pedido_itempedido_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_itempedido`
--

LOCK TABLES `pedido_itempedido` WRITE;
/*!40000 ALTER TABLE `pedido_itempedido` DISABLE KEYS */;
INSERT INTO `pedido_itempedido` VALUES (1,'2024-06-01',150.00,'Cartão de Crédito',1),(2,'2024-06-02',75.50,'Boleto',2),(3,'2024-06-02',320.90,'PIX',3),(4,'2024-06-03',45.00,'Cartão de Débito',4),(5,'2024-06-04',500.00,'Cartão de Crédito',5),(6,'2024-06-04',120.30,'Boleto',6),(7,'2024-06-05',99.90,'PIX',7),(8,'2024-06-05',210.00,'Cartão de Crédito',8),(9,'2024-06-06',65.50,'Boleto',9),(10,'2024-06-07',30.00,'PIX',10),(11,'2024-06-08',180.50,'Cartão de Crédito',11),(12,'2024-06-09',115.00,'Boleto',12),(13,'2024-06-10',88.00,'PIX',13),(14,'2024-06-11',290.75,'Cartão de Crédito',14),(15,'2024-06-12',40.00,'Boleto',15),(16,'2024-06-13',105.00,'PIX',16),(17,'2024-06-14',195.00,'Cartão de Crédito',17),(18,'2024-06-15',55.00,'Boleto',18),(19,'2024-06-16',310.00,'PIX',19),(20,'2024-06-17',17.50,'Cartão de Crédito',20);
/*!40000 ALTER TABLE `pedido_itempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_ponto`
--

DROP TABLE IF EXISTS `registro_ponto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_ponto` (
  `id_registro` int NOT NULL AUTO_INCREMENT,
  `entrada` datetime DEFAULT NULL,
  `saida` datetime DEFAULT NULL,
  `data_saida` date DEFAULT NULL,
  `CPF` varchar(14) DEFAULT NULL,
  PRIMARY KEY (`id_registro`),
  KEY `CPF` (`CPF`),
  CONSTRAINT `registro_ponto_ibfk_1` FOREIGN KEY (`CPF`) REFERENCES `funcionario` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_ponto`
--

LOCK TABLES `registro_ponto` WRITE;
/*!40000 ALTER TABLE `registro_ponto` DISABLE KEYS */;
INSERT INTO `registro_ponto` VALUES (1,'2024-06-03 08:00:00','2024-06-03 17:00:00','2024-06-03','111.222.333-01'),(2,'2024-06-03 09:00:00','2024-06-03 18:00:00','2024-06-03','222.333.444-02'),(3,'2024-06-04 07:30:00','2024-06-04 16:30:00','2024-06-04','333.444.555-03'),(4,'2024-06-04 08:30:00','2024-06-04 17:30:00','2024-06-04','444.555.666-04'),(5,'2024-06-05 08:00:00','2024-06-05 17:00:00','2024-06-05','555.666.777-05'),(6,'2024-06-05 09:15:00','2024-06-05 18:15:00','2024-06-05','666.777.888-06'),(7,'2024-06-06 08:00:00','2024-06-06 17:00:00','2024-06-06','777.888.999-07'),(8,'2024-06-06 08:45:00','2024-06-06 17:45:00','2024-06-06','888.999.000-08'),(9,'2024-06-07 08:00:00','2024-06-07 17:00:00','2024-06-07','999.000.111-09'),(10,'2024-06-07 09:00:00','2024-06-07 18:00:00','2024-06-07','000.111.222-10'),(11,'2024-06-10 07:50:00','2024-06-10 16:50:00','2024-06-10','101.202.303-11'),(12,'2024-06-10 08:05:00','2024-06-10 17:05:00','2024-06-10','112.233.445-12'),(13,'2024-06-11 08:00:00','2024-06-11 17:00:00','2024-06-11','131.415.516-13'),(14,'2024-06-11 08:00:00','2024-06-11 17:00:00','2024-06-11','141.516.617-14'),(15,'2024-06-12 08:00:00','2024-06-12 17:00:00','2024-06-12','151.617.718-15'),(16,'2024-06-12 08:00:00','2024-06-12 17:00:00','2024-06-12','161.718.819-16'),(17,'2024-06-13 08:00:00','2024-06-13 17:00:00','2024-06-13','171.819.910-17'),(18,'2024-06-13 08:00:00','2024-06-13 17:00:00','2024-06-13','181.910.012-18'),(19,'2024-06-14 08:00:00','2024-06-14 17:00:00','2024-06-14','191.012.213-19'),(20,'2024-06-14 08:00:00','2024-06-14 17:00:00','2024-06-14','201.102.304-20');
/*!40000 ALTER TABLE `registro_ponto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuspedido`
--

DROP TABLE IF EXISTS `statuspedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuspedido` (
  `id_status` int NOT NULL AUTO_INCREMENT,
  `descricao_st` varchar(100) DEFAULT NULL,
  `tipo_status` varchar(50) DEFAULT NULL,
  `id_pedido` int DEFAULT NULL,
  PRIMARY KEY (`id_status`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `statuspedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido_itempedido` (`id_pedido`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuspedido`
--

LOCK TABLES `statuspedido` WRITE;
/*!40000 ALTER TABLE `statuspedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuspedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-06 16:12:03
