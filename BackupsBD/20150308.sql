CREATE DATABASE  IF NOT EXISTS `pessi` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `pessi`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: localhost    Database: pessi
-- ------------------------------------------------------
-- Server version	5.6.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL AUTO_INCREMENT,
  `NomeCategoria` varchar(60) NOT NULL,
  `CategoriaPaiID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CategoriaID`),
  KEY `FK_Categoria_CategoriaPai_idx` (`CategoriaPaiID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Vestuário e Calçados',NULL),(2,'Combustível',NULL),(3,'Farmácia',NULL),(4,'Alimentação Fora do Lar',NULL),(5,'Mercado',NULL),(6,'Passeio',NULL),(7,'Móveis/Eletrônicos',NULL),(8,'Perfumaria',NULL);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compras` (
  `CompraID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(100) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `DataCompra` datetime DEFAULT CURRENT_TIMESTAMP,
  `Parcelas` int(11) NOT NULL,
  `FormaPagamentoID` int(11) NOT NULL DEFAULT '1',
  `VirouCartao` bit(1) NOT NULL DEFAULT b'0',
  `CategoriaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`CompraID`),
  KEY `compra_formapagamento_idx` (`FormaPagamentoID`),
  KEY `FK_Compras_Categorias_idx` (`CategoriaID`),
  CONSTRAINT `FK_Compras_Categorias` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `compras_formapagamento` FOREIGN KEY (`FormaPagamentoID`) REFERENCES `formaspagamento` (`FormaPagamentoID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (15,'NoteBook Adriano',2318.4,'2014-03-05 00:00:00',10,1,'\0',NULL),(16,'Celular Marcelo',1501.9,'2014-06-26 00:00:00',10,1,'',NULL),(17,'Copex',900,'2014-08-13 00:00:00',6,1,'',NULL),(18,'Bateria Amanda',154.17000000000002,'2014-10-09 00:00:00',3,1,'',NULL),(19,'Roteador',84.24,'2014-10-23 00:00:00',2,1,'\0',NULL),(20,'Calculadora Amandaa',165.72,'2014-10-14 00:00:00',3,1,'',NULL),(21,'Roupa Adriano (Nice Homem)',1304,'2014-10-28 00:00:00',5,1,'\0',NULL),(22,'Pizzaria Tutti Bona',79.53,'2014-11-08 00:00:00',1,1,'\0',NULL),(23,'América Auto Posto',16.73,'2014-11-11 00:00:00',1,1,'',NULL),(24,'Pizzaria Bora',114.45,'2014-11-14 00:00:00',1,1,'',NULL),(25,'Cartonagem (Formatura da Cu)',26,'2014-11-14 00:00:00',1,1,'\0',NULL),(26,'Guaruja Posto Rio Preto',23.5,'2014-11-16 00:00:00',1,1,'',NULL),(27,'Padaria Bandeirantes',23.5,'2014-11-16 00:00:00',1,1,'',NULL),(28,'Ótica Modelo',800,'2014-11-18 00:00:00',10,1,'\0',NULL),(29,'Posto Rotatória',85.93,'2014-11-18 00:00:00',1,1,'\0',NULL),(30,'Dragaria São Paulo',144.54,'2014-11-19 00:00:00',3,1,'\0',NULL),(31,'JAIR ROCHA',23.5,'2014-11-19 00:00:00',1,1,'',NULL),(32,'World Tennys',24.99,'2014-11-19 00:00:00',1,1,'\0',NULL),(34,'Pizzaria Tutti Bona',53,'2014-11-22 00:00:00',1,1,'',NULL),(35,'Restaurante Moreira Araçatuba',71.83,'2014-11-23 00:00:00',1,1,'\0',NULL),(36,'Ponto hair Studio Araçatuba',75,'2014-11-23 00:00:00',1,1,'\0',NULL),(38,'Revisão Porto',206,'2014-12-09 00:00:00',4,1,'',NULL),(40,'O Boticario',30.98,'2014-12-09 00:00:00',1,1,'',NULL),(41,'Padaria Bandeirante',75.72,'2014-12-09 00:00:00',1,1,'',NULL),(42,'Padaria Bandeirante',75.72,'2014-12-09 00:00:00',1,1,'\0',NULL),(43,'Ponto Frio',399,'2014-07-08 00:00:00',10,1,'',NULL),(44,'Ponto Hair',648,'2014-11-09 00:00:00',4,1,'\0',NULL),(45,'Farmácia duque de caxias',2,'2014-12-08 00:00:00',1,1,'\0',NULL),(46,'Eladi',680,'2014-08-23 00:00:00',5,1,'\0',NULL),(47,'Padaria Bandeirantes',46.14,'2014-12-25 00:00:00',1,1,'\0',NULL),(48,'Muffato',517.92,'2014-08-31 00:00:00',12,1,'',NULL),(49,'Sephora',239,'2014-09-11 00:00:00',10,1,'\0',NULL),(50,'Ponto Hair',399,'2014-08-19 00:00:00',3,1,'\0',NULL),(51,'NetFlix',19.9,'2014-12-25 00:00:00',1,1,'\0',NULL),(52,'Lesso Bis',169.89,'2014-11-13 00:00:00',3,1,'',NULL),(53,'Reunidas (Araçatuba -> Rio Preto)',33.26,'2014-11-28 00:00:00',1,1,'',NULL),(54,'Vila Filó',429.8,'2014-11-13 00:00:00',4,1,'\0',NULL),(55,'Droga Raia',26.79,'2014-11-28 00:00:00',1,1,'',NULL),(56,'Prata 1000',133.89,'2014-11-14 00:00:00',3,1,'\0',NULL),(57,'Restaurante Japonês (FABIO M KUROSU)',87.85,'2014-11-28 00:00:00',1,1,'\0',NULL),(58,'Montana Grill',21.5,'2014-11-28 00:00:00',1,1,'',NULL),(59,'Locateli Plantas',30,'2014-11-29 00:00:00',1,1,'\0',NULL),(60,'Bar dos Amigos',48,'2014-11-29 00:00:00',1,1,'',NULL),(61,'Dragaria (Farmais ao lado da Band)',11.98,'2014-11-30 00:00:00',1,1,'',NULL),(62,'Comida da Vó',26.59,'2014-12-03 00:00:00',1,1,'\0',NULL),(63,'Muffato',7.07,'2014-12-03 00:00:00',1,1,'\0',NULL),(64,'Farmácia Preço Popular (Araçatuba)',50.27,'2014-12-10 00:00:00',1,1,'',NULL),(67,'Rotatória abastecimento',64.52,'2014-12-11 00:00:00',1,1,'\0',NULL),(69,'Farmais Bandeirantes',16.72,'2014-12-12 00:00:00',1,1,'',NULL),(70,'Farmais Bandeirantes',16.72,'2014-12-12 00:00:00',1,1,'',NULL),(71,'Padaria Bandeirantes',20.06,'2014-12-12 00:00:00',1,1,'',NULL),(73,'Posto Rotatória',64.52,'2014-12-11 00:00:00',1,1,'',NULL),(74,'Farmácia Preço Popular',32.4,'2014-12-11 00:00:00',1,1,'',NULL),(75,'Riachuelo',139.8,'2014-12-10 00:00:00',3,1,'',NULL),(76,'Riachuelo',35.8,'2014-12-10 00:00:00',1,5,'',NULL),(84,'Produto Teste',117.94,'2015-03-09 00:00:00',2,1,'',NULL),(88,'Droga Raia',73.38,'2015-02-09 00:00:00',1,1,'\0',NULL),(90,'Padaria Bandeirante',6.04,'2015-02-09 00:00:00',1,1,'',NULL),(91,'HERING STORE',159.96,'2014-12-14 00:00:00',3,1,'',NULL),(92,'Baden Baden',124.4,'2014-12-27 00:00:00',2,1,'\0',NULL),(93,'Delli',12.66,'2015-01-08 00:00:00',1,1,'',NULL),(94,'VAINETE DE LURDES S JOSE R PRET BR',33,'2015-01-09 00:00:00',1,1,'',NULL),(95,'RITOCA SAO JOSE DO R BR',9,'2015-01-09 00:00:00',1,1,'',NULL),(96,'R. G. RIO PRETO RESTAU SAO JOSE DO R BR',30.5,'2015-01-10 00:00:00',1,1,'',NULL),(97,'JULIANA MATTOS ME SAO JOSE DO R BR',13,'2015-01-10 00:00:00',1,1,'',NULL),(98,'POSTO ITAIPU SAO JOSE DO R BR',20,'2015-01-10 00:00:00',1,1,'',NULL),(99,'PANIFICADORA SAO JOSE DO R BR',23.5,'2015-01-10 00:00:00',1,1,'',NULL),(100,'DROGA RAIA 478 ARACATU ARACATUBA BR',34.36,'2015-01-11 00:00:00',1,1,'',NULL),(101,'B CASH COMPRA ON LINE MARILIA BR',54,'2015-01-13 00:00:00',1,1,'',NULL),(102,'ARACATUBA POINT COMEST ARACATUBA BR',12.84,'2015-01-13 00:00:00',1,1,'',NULL),(103,'Posto Rotatória',100.47,'2015-01-15 00:00:00',1,1,'',NULL),(104,'ARACATUBA POINT COMEST ARACATUBA BR',41.58,'2015-01-16 00:00:00',1,1,'',NULL),(105,'KABUM (monitor)',780.1200000000001,'2015-01-16 00:00:00',12,1,'',NULL),(106,'Padaria Delly',29.62,'2015-01-17 00:00:00',1,1,'',NULL),(107,'Pizzaria Tutti Bona',89.65,'2015-01-23 00:00:00',1,1,'',NULL),(108,'Padaria Band',8.98,'2015-01-24 00:00:00',1,1,'',NULL),(109,'NUTRI STORE SUP',337.88,'2015-01-25 00:00:00',4,1,'',NULL),(110,'LETICIA PUGINA ARACATUBA BR',22.98,'2015-01-29 00:00:00',1,1,'',NULL),(111,'KAIPE RESTAURANTE ARACATUBA BR',55,'2015-01-29 00:00:00',1,1,'',NULL),(112,'ARACATUBA POINT COMEST ARACATUBA BR',32.1,'2015-02-05 00:00:00',1,1,'\0',NULL),(113,'SORVETE.COM ARACATUBA BR',6.9,'2015-02-05 00:00:00',1,1,'\0',NULL),(114,'Inovatti (Malas)',799.98,'2014-12-14 00:00:00',6,1,'',NULL),(115,'PONTO DUPLO TRI',643.98,'2014-12-24 00:00:00',3,1,'',NULL),(116,'SUCOS S/A ARACATUBA BR',16.5,'2015-01-08 00:00:00',1,1,'',NULL),(117,'FARMAIS DUQUE DE CAXIA ARACATUBA BR',16.23,'2015-01-08 00:00:00',1,1,'',NULL),(118,'Vivenda do Camarão',28.1,'2015-01-08 00:00:00',1,1,'',NULL),(119,'Contem 1g',96,'2015-01-10 00:00:00',3,1,'',NULL),(120,'Muffato',41.4,'2015-01-11 00:00:00',1,1,'',NULL),(121,'Suco.com',13.95,'2015-01-11 00:00:00',1,1,'',NULL),(122,'Restaurante H2 Presidente Prudente',26.55,'2015-01-13 00:00:00',1,1,'',NULL),(123,'SUCOS S/A ARACATUBA BR',7,'2015-01-14 00:00:00',1,1,'',NULL),(124,'SUCOS S/A ARACATUBA BR',16.5,'2015-01-15 00:00:00',1,1,'',NULL),(125,'Canção',13.52,'2015-01-16 00:00:00',1,1,'',NULL),(127,'VILA PACIFICO GRILL ARACATUBA BR',10.49,'2015-01-16 00:00:00',1,1,'',NULL),(128,'Muffato',128.04,'2015-01-17 00:00:00',1,1,'',NULL),(129,'VILA PACIFICO GRILL ARACATUBA BR',17.62,'2015-01-20 00:00:00',1,1,'',NULL),(130,'Canção',29.1,'2015-01-21 00:00:00',1,1,'',NULL),(131,'VOZZA ALIMENTOS LTDA CAMPINAS BR',33.08,'2015-01-21 00:00:00',1,1,'',NULL),(132,'VIACAO COMETA TBF SAO PAULO BR',98.45,'2015-01-22 00:00:00',1,1,'',NULL),(133,'RODOSNACK RUBI SAO CARLOS BR',36.5,'2015-01-23 00:00:00',1,1,'',NULL),(134,'FEX LANCHONETE ARACA ARACATUBA BR',38.75,'2015-01-25 00:00:00',1,1,'',NULL),(135,'DROGA RAIA F48 ARACATUBA BR',21.24,'2015-01-26 00:00:00',1,1,'',NULL),(136,'Tal Café',15.5,'2015-01-28 00:00:00',1,1,'',NULL),(137,'SABOR DA TERRA ARACATUBA BR',26.5,'2015-01-30 00:00:00',1,1,'',NULL),(138,'Posto Rotatória',51.95,'2015-02-01 00:00:00',1,1,'\0',NULL),(139,'STARBUCKS BRASIL COM C SAO JOSE DO R BR',38.9,'2015-02-01 00:00:00',1,1,'\0',NULL),(140,'Canção',57.25,'2015-02-02 00:00:00',1,1,'\0',NULL),(141,'SUCOS S/A ARACATUBA BR',16,'2015-02-02 00:00:00',1,1,'\0',NULL),(142,'VIA SUL ILHA SOLTEIRA BR',20,'2015-02-03 00:00:00',1,1,'\0',NULL),(143,'AUTO POSTO MC AURI AURIFLAMA BR',8.97,'2015-02-03 00:00:00',1,1,'\0',NULL),(144,'DROG CATARINENSE MANIP ARACATUBA BR',61.49,'2015-02-05 00:00:00',1,1,'\0',NULL),(145,'VILA PACIFICO GRILL ARACATUBA BR',13.89,'2015-02-05 00:00:00',1,1,'\0',NULL),(147,'DROGARIA A NOGAROTO ARACATUBA BR',4.95,'2015-01-24 00:00:00',1,1,'',NULL),(148,'LETICIA PUGINA ARACATUBA BR',22.98,'2015-01-29 00:00:00',1,1,'',NULL),(149,'Aspirador de Pó Portátil Cadence 600W',132.39,'2015-03-01 00:00:00',3,1,'\0',NULL),(150,'KAIPE RESTAURANTE ARACATUBA BR',50.97,'2015-02-11 00:00:00',1,1,'',NULL),(151,'Pizzaria Tutti Bona',53,'2015-02-12 00:00:00',1,1,'',NULL),(152,'Posto Rotatória',81.52,'2015-02-12 00:00:00',1,1,'',NULL),(153,'DROGARIA SAO PAULO 533 ARACATUBA BR',53.58,'2015-03-12 00:00:00',1,1,'',NULL),(154,'Sorveteria Nonna Rio Preto',64.97,'2015-02-14 00:00:00',1,1,'',NULL),(155,'Multicoisas (Carregador Universal)',169.8,'2015-02-14 00:00:00',3,1,'',NULL),(156,'BANCA GERALDO E BETE SAO JOSE DO R BR',27,'2015-02-16 00:00:00',1,1,'',NULL),(157,'AZ Padaria Rio Preto',47.5,'2015-02-16 00:00:00',1,1,'',NULL),(158,'SC SAO JOSE DO RIO PRE SAO JOSE DO R BR',42.44,'2015-02-16 00:00:00',1,1,'',NULL),(159,'Pizzaria Dona Oliva',66.2,'2015-02-17 00:00:00',1,1,'',NULL),(160,'POSTO ITAIPU SAO JOSE DO R BR',40,'2015-02-18 00:00:00',1,1,'',NULL),(161,'ARACATUBA POINT COMEST ARACATUBA BR',17.12,'2015-02-18 00:00:00',1,1,'',NULL),(162,'VAINETE DE LURDES S JOSE R PRET BR',40,'2015-02-18 00:00:00',1,1,'',NULL),(163,'ARACATUBA POINT COMEST ARACATUBA BR',34.98,'2015-02-19 00:00:00',1,1,'',NULL),(164,'Ponto Hair Studio',30,'2015-02-19 00:00:00',1,1,'',NULL),(165,'Muffato',72.38,'2015-02-19 00:00:00',1,1,'',NULL),(166,'Lojas Americanas',11.47,'2015-02-22 00:00:00',1,1,'',NULL),(167,'Cineflex (Cinema)',25.5,'2015-02-22 00:00:00',1,1,'',NULL),(168,'Droga Raia',38.8,'2015-02-24 00:00:00',1,1,'',NULL),(169,'Posto Rotatória',100.44,'2015-02-25 00:00:00',1,1,'',NULL),(170,'Padaria Band',27.07,'2015-02-25 00:00:00',1,1,'',NULL),(171,'Comida Da Vó',22.53,'2015-02-26 00:00:00',1,1,'',NULL),(172,'VILA PACIFICO GRILL ARACATUBA BR',13.38,'2015-02-06 00:00:00',1,1,'\0',NULL),(173,'PARIS 6 SAO PAULO BR',76,'2015-02-10 00:00:00',1,1,'',NULL),(174,'REI DO MATE CAMPINAS BR',16,'2015-02-11 00:00:00',1,1,'',NULL),(175,'MAGAZINE LUIZA',229.6,'2015-02-12 00:00:00',4,1,'',NULL),(176,'VILA PACIFICO GRILL ARACATUBA BR',23.19,'2015-02-12 00:00:00',1,1,'',NULL),(177,'CATRICALA E CIA LTDA SAO JOSE DO R BR',69.26,'2015-02-14 00:00:00',1,1,'',NULL),(178,'QOY CHOCOLATE EXPERIEN SAO JOSE DO R BR',14.36,'2015-02-15 00:00:00',1,1,'',NULL),(179,'EMPORIO SANTA TEREZINH SAO JOSE DO R BR',89.77,'2015-02-15 00:00:00',1,1,'',NULL),(180,'SABOON REAL CARE SAO JOSE DO R BR',29.4,'2015-02-16 00:00:00',1,1,'',NULL),(181,'Casa Nicoletti',15,'2015-02-16 00:00:00',1,1,'',NULL),(182,'Carrefour (televisão Mãe Amanda)',1358.9,'2015-02-17 00:00:00',10,1,'',NULL),(183,'Liban (Revisão)',180,'2015-02-18 00:00:00',2,1,'',NULL),(184,'FRANS CAFE SAO JOSE DO R BR',16.5,'2015-02-18 00:00:00',1,1,'',NULL),(185,'DROGARIA SAO PAULO 238 S JOSE R PRET BR',42.89,'2015-02-18 00:00:00',1,1,'',NULL),(186,'NATHALIA T MENEZELLO M S JOSE R PRET BR',40,'2015-02-18 00:00:00',1,1,'',NULL),(187,'SUBMARINO (Livro Aline)',181.35,'2015-02-19 00:00:00',5,1,'',NULL),(188,'FCIA PAGUE MENOS 562 ARACATUBA BR',40.01,'2015-02-20 00:00:00',1,1,'',NULL),(189,'SUBMARINO',144.48,'2015-02-20 00:00:00',4,1,'',NULL),(190,'SUCOS S/A ARACATUBA BR',9.5,'2015-02-24 00:00:00',1,1,'',NULL),(191,'Padaria Band',9.9,'2015-02-25 00:00:00',1,1,'',NULL),(192,'VILA PACIFICO GRILL ARACATUBA BR',8.26,'2015-02-26 00:00:00',1,1,'',NULL),(194,'Carro (Parc 17)',708.7,'2015-02-28 00:00:00',1,3,'',NULL),(195,'Padaria Band',5,'2015-03-03 00:00:00',1,3,'\0',NULL),(196,'Restaurante Shopping Araçatuba (Adriano)',23.33,'2015-03-06 00:00:00',1,1,'\0',NULL),(197,'Restaurante Shopping Araçatuba (Amanda)',25.75,'2015-03-06 00:00:00',1,1,'\0',NULL),(198,'Estacionamento Praça Nova',3,'2015-03-06 00:00:00',1,3,'\0',NULL),(199,'Padaria Band',26.32,'2015-03-05 00:00:00',1,4,'\0',NULL),(200,'Padaria Band',13.73,'2015-03-05 00:00:00',1,1,'\0',NULL),(201,'Compra Renner Carne (3.050.010.061.30-7)',347,'2015-02-08 00:00:00',5,2,'\0',NULL),(202,'Compra Renner Carne (630.471.485.50-0)',438,'2015-02-10 00:00:00',5,2,'\0',NULL),(203,'Compra Renner Carne (4.030.030.182.29-1)',238.5,'2015-01-19 00:00:00',5,2,'',NULL),(204,'Compra Renner Carne (3.050.030.032.45-0)',119,'2015-02-22 00:00:00',5,2,'',NULL),(205,'Ponto Hair (Corte Cabelo Amanda)',45,'2015-03-08 00:00:00',1,1,'',NULL),(206,'Cafeteira Cus',339.04,'2015-03-08 00:00:00',4,1,'',NULL);
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formaspagamento`
--

DROP TABLE IF EXISTS `formaspagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formaspagamento` (
  `FormaPagamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) DEFAULT NULL,
  `DiaVencimento` smallint(6) NOT NULL,
  `TemVencimento` bit(1) NOT NULL,
  PRIMARY KEY (`FormaPagamentoID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formaspagamento`
--

LOCK TABLES `formaspagamento` WRITE;
/*!40000 ALTER TABLE `formaspagamento` DISABLE KEYS */;
INSERT INTO `formaspagamento` VALUES (1,'Cartão Porto',9,''),(2,'Cartão Renner',13,''),(3,'Dinheiro',0,'\0'),(4,'Ticket',0,'\0'),(5,'Cartão Riachuelo',13,'');
/*!40000 ALTER TABLE `formaspagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamentos`
--

DROP TABLE IF EXISTS `pagamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pagamentos` (
  `PagamentoID` int(11) NOT NULL AUTO_INCREMENT,
  `Parcela` int(11) DEFAULT NULL,
  `Valor` double DEFAULT NULL,
  `DataVencimento` datetime DEFAULT NULL,
  `CompraID` int(11) DEFAULT NULL,
  PRIMARY KEY (`PagamentoID`),
  KEY `FK_Pagamentos_compras_CompraID` (`CompraID`),
  CONSTRAINT `FK_Pagamentos_compras_CompraID` FOREIGN KEY (`CompraID`) REFERENCES `compras` (`CompraID`)
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamentos`
--

LOCK TABLES `pagamentos` WRITE;
/*!40000 ALTER TABLE `pagamentos` DISABLE KEYS */;
INSERT INTO `pagamentos` VALUES (187,1,42.12,'2014-11-09 00:00:00',19),(188,2,42.12,'2014-12-09 00:00:00',19),(192,1,231.84,'2014-03-09 00:00:00',15),(193,2,231.84,'2014-04-09 00:00:00',15),(194,3,231.84,'2014-05-09 00:00:00',15),(195,4,231.84,'2014-06-09 00:00:00',15),(196,5,231.84,'2014-07-09 00:00:00',15),(197,6,231.84,'2014-08-09 00:00:00',15),(198,7,231.84,'2014-09-09 00:00:00',15),(199,8,231.84,'2014-10-09 00:00:00',15),(200,9,231.84,'2014-11-09 00:00:00',15),(201,10,231.84,'2014-12-09 00:00:00',15),(202,1,260.8,'2014-11-09 00:00:00',21),(203,2,260.8,'2014-12-09 00:00:00',21),(204,3,260.8,'2015-01-09 00:00:00',21),(205,4,260.8,'2015-02-09 00:00:00',21),(206,5,260.8,'2015-03-09 00:00:00',21),(213,1,80,'2014-12-09 00:00:00',28),(214,2,80,'2015-01-09 00:00:00',28),(215,3,80,'2015-02-09 00:00:00',28),(216,4,80,'2015-03-09 00:00:00',28),(217,5,80,'2015-04-09 00:00:00',28),(218,6,80,'2015-05-09 00:00:00',28),(219,7,80,'2015-06-09 00:00:00',28),(220,8,80,'2015-07-09 00:00:00',28),(221,9,80,'2015-08-09 00:00:00',28),(222,10,80,'2015-09-09 00:00:00',28),(224,1,48.18,'2014-12-09 00:00:00',30),(225,2,48.18,'2015-01-09 00:00:00',30),(226,3,48.18,'2015-02-09 00:00:00',30),(232,1,71.83,'2014-12-09 00:00:00',35),(233,1,75,'2014-12-09 00:00:00',36),(269,1,136,'2014-09-09 00:00:00',46),(270,2,136,'2014-10-09 00:00:00',46),(271,3,136,'2014-11-09 00:00:00',46),(272,4,136,'2014-12-09 00:00:00',46),(273,5,136,'2015-01-09 00:00:00',46),(274,1,46.14,'2015-01-09 00:00:00',47),(287,1,23.9,'2014-10-09 00:00:00',49),(288,2,23.9,'2014-11-09 00:00:00',49),(289,3,23.9,'2014-12-09 00:00:00',49),(290,4,23.9,'2015-01-09 00:00:00',49),(291,5,23.9,'2015-02-09 00:00:00',49),(292,6,23.9,'2015-03-09 00:00:00',49),(293,7,23.9,'2015-04-09 00:00:00',49),(294,8,23.9,'2015-05-09 00:00:00',49),(295,9,23.9,'2015-06-09 00:00:00',49),(296,10,23.9,'2015-07-09 00:00:00',49),(297,1,133,'2014-09-09 00:00:00',50),(298,2,133,'2014-10-09 00:00:00',50),(299,3,133,'2014-11-09 00:00:00',50),(305,1,107.45,'2014-12-09 00:00:00',54),(306,2,107.45,'2015-01-09 00:00:00',54),(307,3,107.45,'2015-02-09 00:00:00',54),(308,4,107.45,'2015-03-09 00:00:00',54),(341,1,162,'2014-12-09 00:00:00',44),(342,2,162,'2015-01-09 00:00:00',44),(343,3,162,'2015-02-09 00:00:00',44),(344,4,162,'2015-03-09 00:00:00',44),(355,1,2,'2014-12-09 00:00:00',45),(375,1,39.9,'2014-08-09 00:00:00',43),(376,2,39.9,'2014-09-09 00:00:00',43),(377,3,39.9,'2014-10-09 00:00:00',43),(378,4,39.9,'2014-11-09 00:00:00',43),(379,5,39.9,'2014-12-09 00:00:00',43),(380,6,39.9,'2015-01-09 00:00:00',43),(381,7,39.9,'2015-02-09 00:00:00',43),(382,8,39.9,'2015-03-09 00:00:00',43),(383,9,39.9,'2015-04-09 00:00:00',43),(384,10,39.9,'2015-05-09 00:00:00',43),(385,1,150.19,'2014-07-09 00:00:00',16),(386,2,150.19,'2014-08-09 00:00:00',16),(387,3,150.19,'2014-09-09 00:00:00',16),(388,4,150.19,'2014-10-09 00:00:00',16),(389,5,150.19,'2014-11-09 00:00:00',16),(390,6,150.19,'2014-12-09 00:00:00',16),(391,7,150.19,'2015-01-09 00:00:00',16),(392,8,150.19,'2015-02-09 00:00:00',16),(393,9,150.19,'2015-03-09 00:00:00',16),(394,10,150.19,'2015-04-09 00:00:00',16),(395,1,19.9,'2014-12-09 00:00:00',51),(396,1,75.72,'2015-01-09 00:00:00',41),(397,1,150,'2014-09-09 00:00:00',17),(398,2,150,'2014-10-09 00:00:00',17),(399,3,150,'2014-11-09 00:00:00',17),(400,4,150,'2014-12-09 00:00:00',17),(401,5,150,'2015-01-09 00:00:00',17),(402,6,150,'2015-02-09 00:00:00',17),(406,1,55.24,'2014-11-09 00:00:00',20),(407,2,55.24,'2014-12-09 00:00:00',20),(408,3,55.24,'2015-01-09 00:00:00',20),(410,1,50.27,'2015-01-09 00:00:00',64),(413,1,64.52,'2014-12-11 00:00:00',67),(418,1,51.39000000000001,'2014-11-09 00:00:00',18),(419,2,51.39000000000001,'2014-12-09 00:00:00',18),(420,3,51.39000000000001,'2015-01-09 00:00:00',18),(421,1,16.72,'2015-01-09 00:00:00',69),(422,1,16.72,'2015-01-09 00:00:00',70),(423,1,20.06,'2015-01-09 00:00:00',71),(428,1,24.99,'2014-11-09 00:00:00',32),(429,1,16.73,'2014-12-09 00:00:00',23),(430,1,114.45,'2014-12-09 00:00:00',24),(431,1,48,'2014-12-09 00:00:00',60),(432,1,26,'2014-11-09 00:00:00',25),(433,1,87.85,'2014-11-09 00:00:00',57),(434,1,85.93,'2014-11-09 00:00:00',29),(435,1,79.53,'2014-11-09 00:00:00',22),(436,1,75.72,'2014-12-09 00:00:00',42),(437,1,53,'2014-12-09 00:00:00',34),(438,1,33.26,'2014-12-09 00:00:00',53),(439,1,30.98,'2015-01-09 00:00:00',40),(440,1,30,'2014-11-09 00:00:00',59),(442,1,26.79,'2014-12-09 00:00:00',55),(443,1,26.59,'2014-12-09 00:00:00',62),(444,1,23.5,'2014-12-09 00:00:00',31),(445,1,23.5,'2014-12-09 00:00:00',27),(446,1,23.5,'2014-12-09 00:00:00',26),(447,1,21.5,'2014-12-09 00:00:00',58),(448,1,11.98,'2014-12-09 00:00:00',61),(449,1,7.07,'2014-12-09 00:00:00',63),(451,1,64.52,'2015-01-09 00:00:00',73),(452,1,32.4,'2015-01-09 00:00:00',74),(456,1,35.8,'2014-12-10 00:00:00',76),(513,1,58.97,'2015-04-09 00:00:00',84),(514,2,58.97,'2015-05-09 00:00:00',84),(525,1,73.38,'2015-03-09 00:00:00',88),(526,1,6.04,'2015-03-09 00:00:00',90),(531,1,51.5,'2015-01-09 00:00:00',38),(532,2,51.5,'2015-02-09 00:00:00',38),(533,3,51.5,'2015-03-09 00:00:00',38),(534,4,51.5,'2015-04-09 00:00:00',38),(535,1,46.6,'2015-01-09 00:00:00',75),(536,2,46.6,'2015-02-09 00:00:00',75),(537,3,46.6,'2015-03-09 00:00:00',75),(541,1,53.32,'2015-01-09 00:00:00',91),(542,2,53.32,'2015-02-09 00:00:00',91),(543,3,53.32,'2015-03-09 00:00:00',91),(546,1,62.2,'2015-01-09 00:00:00',92),(547,2,62.2,'2015-02-09 00:00:00',92),(548,1,12.66,'2015-02-09 00:00:00',93),(549,1,33,'2015-02-09 00:00:00',94),(550,1,9,'2015-02-09 00:00:00',95),(552,1,13,'2015-02-09 00:00:00',97),(553,1,20,'2015-02-09 00:00:00',98),(554,1,23.5,'2015-02-09 00:00:00',99),(555,1,34.36,'2015-02-09 00:00:00',100),(556,1,54,'2015-02-09 00:00:00',101),(557,1,12.84,'2015-02-09 00:00:00',102),(558,1,100.47,'2015-02-09 00:00:00',103),(559,1,41.58,'2015-02-09 00:00:00',104),(584,1,29.62,'2015-02-09 00:00:00',106),(585,1,89.65,'2015-02-09 00:00:00',107),(586,1,8.98,'2015-02-09 00:00:00',108),(591,1,22.98,'2015-03-09 00:00:00',110),(593,1,32.1,'2015-02-09 00:00:00',112),(594,1,6.9,'2015-02-09 00:00:00',113),(595,1,43.16,'2014-09-09 00:00:00',48),(596,2,43.16,'2014-10-09 00:00:00',48),(597,3,43.16,'2014-11-09 00:00:00',48),(598,4,43.16,'2014-12-09 00:00:00',48),(599,5,43.16,'2015-01-09 00:00:00',48),(600,6,43.16,'2015-02-09 00:00:00',48),(601,7,43.16,'2015-03-09 00:00:00',48),(602,8,43.16,'2015-04-09 00:00:00',48),(603,9,43.16,'2015-05-09 00:00:00',48),(604,10,43.16,'2015-06-09 00:00:00',48),(605,11,43.16,'2015-07-09 00:00:00',48),(606,12,43.16,'2015-08-09 00:00:00',48),(610,1,56.63,'2014-12-09 00:00:00',52),(611,2,56.63,'2015-01-09 00:00:00',52),(612,3,56.63,'2015-02-09 00:00:00',52),(613,1,44.63,'2014-12-09 00:00:00',56),(614,2,44.63,'2015-01-09 00:00:00',56),(615,3,44.63,'2015-02-09 00:00:00',56),(616,1,133.33,'2015-01-09 00:00:00',114),(617,2,133.33,'2015-02-09 00:00:00',114),(618,3,133.33,'2015-03-09 00:00:00',114),(619,4,133.33,'2015-04-09 00:00:00',114),(620,5,133.33,'2015-05-09 00:00:00',114),(621,6,133.33,'2015-06-09 00:00:00',114),(622,1,214.66,'2015-01-09 00:00:00',115),(623,2,214.66,'2015-02-09 00:00:00',115),(624,3,214.66,'2015-03-09 00:00:00',115),(628,1,32,'2015-02-09 00:00:00',119),(629,2,32,'2015-03-09 00:00:00',119),(630,3,32,'2015-04-09 00:00:00',119),(631,1,41.4,'2015-02-09 00:00:00',120),(632,1,13.95,'2015-02-09 00:00:00',121),(633,1,16.5,'2015-02-09 00:00:00',116),(634,1,16.23,'2015-02-09 00:00:00',117),(635,1,26.55,'2015-02-09 00:00:00',122),(636,1,7,'2015-02-09 00:00:00',123),(637,1,16.5,'2015-02-09 00:00:00',124),(638,1,13.52,'2015-02-09 00:00:00',125),(640,1,10.49,'2015-02-09 00:00:00',127),(641,1,128.04,'2015-02-09 00:00:00',128),(642,1,17.62,'2015-02-09 00:00:00',129),(643,1,29.1,'2015-02-09 00:00:00',130),(644,1,33.08,'2015-02-09 00:00:00',131),(645,1,98.45,'2015-02-09 00:00:00',132),(646,1,36.5,'2015-02-09 00:00:00',133),(647,1,38.75,'2015-02-09 00:00:00',134),(648,1,21.24,'2015-02-09 00:00:00',135),(649,1,15.5,'2015-02-09 00:00:00',136),(650,1,26.5,'2015-02-09 00:00:00',137),(651,1,51.95,'2015-02-09 00:00:00',138),(652,1,38.9,'2015-02-09 00:00:00',139),(654,1,57.25,'2015-02-09 00:00:00',140),(655,1,16,'2015-02-09 00:00:00',141),(656,1,20,'2015-02-09 00:00:00',142),(657,1,8.97,'2015-02-09 00:00:00',143),(658,1,61.49,'2015-02-09 00:00:00',144),(659,1,13.89,'2015-02-09 00:00:00',145),(661,1,30.5,'2015-02-09 00:00:00',96),(662,1,4.95,'2015-02-09 00:00:00',147),(663,1,22.98,'2015-02-09 00:00:00',148),(664,1,55,'2015-02-09 00:00:00',111),(665,1,28.1,'2015-02-09 00:00:00',118),(666,1,44.13,'2015-03-09 00:00:00',149),(667,2,44.13,'2015-04-09 00:00:00',149),(668,3,44.13,'2015-05-09 00:00:00',149),(669,1,50.97,'2015-03-09 00:00:00',150),(670,1,53,'2015-03-09 00:00:00',151),(671,1,81.52,'2015-03-09 00:00:00',152),(672,1,53.58,'2015-04-09 00:00:00',153),(673,1,64.97,'2015-03-09 00:00:00',154),(674,1,56.6,'2015-03-09 00:00:00',155),(675,2,56.6,'2015-04-09 00:00:00',155),(676,3,56.6,'2015-05-09 00:00:00',155),(679,1,27,'2015-03-09 00:00:00',156),(680,1,47.5,'2015-03-09 00:00:00',157),(681,1,42.44,'2015-03-09 00:00:00',158),(682,1,66.2,'2015-03-09 00:00:00',159),(683,1,40,'2015-03-09 00:00:00',160),(684,1,17.12,'2015-03-09 00:00:00',161),(685,1,40,'2015-03-09 00:00:00',162),(686,1,34.98,'2015-03-09 00:00:00',163),(687,1,30,'2015-03-09 00:00:00',164),(688,1,72.38,'2015-03-09 00:00:00',165),(689,1,11.47,'2015-03-09 00:00:00',166),(690,1,25.5,'2015-03-09 00:00:00',167),(691,1,38.8,'2015-03-09 00:00:00',168),(692,1,100.44,'2015-03-09 00:00:00',169),(693,1,84.47,'2015-02-09 00:00:00',109),(694,2,84.47,'2015-03-09 00:00:00',109),(695,3,84.47,'2015-04-09 00:00:00',109),(696,4,84.47,'2015-05-09 00:00:00',109),(697,1,27.07,'2015-03-09 00:00:00',170),(698,1,22.53,'2015-03-09 00:00:00',171),(699,1,13.38,'2015-02-09 00:00:00',172),(700,1,76,'2015-03-09 00:00:00',173),(701,1,16,'2015-03-09 00:00:00',174),(702,1,57.4,'2015-03-09 00:00:00',175),(703,2,57.4,'2015-04-09 00:00:00',175),(704,3,57.4,'2015-05-09 00:00:00',175),(705,4,57.4,'2015-06-09 00:00:00',175),(706,1,23.19,'2015-03-09 00:00:00',176),(707,1,69.26,'2015-03-09 00:00:00',177),(708,1,14.36,'2015-03-09 00:00:00',178),(709,1,89.77,'2015-03-09 00:00:00',179),(710,1,29.4,'2015-03-09 00:00:00',180),(711,1,15,'2015-03-09 00:00:00',181),(712,1,135.89,'2015-03-09 00:00:00',182),(713,2,135.89,'2015-04-09 00:00:00',182),(714,3,135.89,'2015-05-09 00:00:00',182),(715,4,135.89,'2015-06-09 00:00:00',182),(716,5,135.89,'2015-07-09 00:00:00',182),(717,6,135.89,'2015-08-09 00:00:00',182),(718,7,135.89,'2015-09-09 00:00:00',182),(719,8,135.89,'2015-10-09 00:00:00',182),(720,9,135.89,'2015-11-09 00:00:00',182),(721,10,135.89,'2015-12-09 00:00:00',182),(723,1,90,'2015-03-09 00:00:00',183),(724,2,90,'2015-04-09 00:00:00',183),(725,1,16.5,'2015-03-09 00:00:00',184),(726,1,42.89,'2015-03-09 00:00:00',185),(727,1,40,'2015-03-09 00:00:00',186),(728,1,36.27,'2015-03-09 00:00:00',187),(729,2,36.27,'2015-04-09 00:00:00',187),(730,3,36.27,'2015-05-09 00:00:00',187),(731,4,36.27,'2015-06-09 00:00:00',187),(732,5,36.27,'2015-07-09 00:00:00',187),(733,1,40.01,'2015-03-09 00:00:00',188),(734,1,36.12,'2015-03-09 00:00:00',189),(735,2,36.12,'2015-04-09 00:00:00',189),(736,3,36.12,'2015-05-09 00:00:00',189),(737,4,36.12,'2015-06-09 00:00:00',189),(738,1,9.5,'2015-03-09 00:00:00',190),(739,1,9.9,'2015-03-09 00:00:00',191),(740,1,8.26,'2015-03-09 00:00:00',192),(742,1,708.7,'2015-02-28 00:00:00',194),(743,1,5,'2015-03-09 00:00:00',195),(744,1,23.33,'2015-03-09 00:00:00',196),(745,1,25.75,'2015-03-09 00:00:00',197),(746,1,3,'2015-03-09 00:00:00',198),(747,1,26.32,'2015-03-09 00:00:00',199),(748,1,13.73,'2015-03-09 00:00:00',200),(749,1,69.4,'2015-02-08 00:00:00',201),(750,2,69.4,'2015-03-08 00:00:00',201),(751,3,69.4,'2015-04-08 00:00:00',201),(752,4,69.4,'2015-05-08 00:00:00',201),(753,5,69.4,'2015-06-08 00:00:00',201),(754,1,87.6,'2015-02-10 00:00:00',202),(755,2,87.6,'2015-03-10 00:00:00',202),(756,3,87.6,'2015-04-10 00:00:00',202),(757,4,87.6,'2015-05-10 00:00:00',202),(758,5,87.6,'2015-06-10 00:00:00',202),(759,1,47.7,'2015-01-19 00:00:00',203),(760,2,47.7,'2015-02-19 00:00:00',203),(761,3,47.7,'2015-03-19 00:00:00',203),(762,4,47.7,'2015-04-19 00:00:00',203),(763,5,47.7,'2015-05-19 00:00:00',203),(764,1,23.8,'2015-02-22 00:00:00',204),(765,2,23.8,'2015-03-22 00:00:00',204),(766,3,23.8,'2015-04-22 00:00:00',204),(767,4,23.8,'2015-05-22 00:00:00',204),(768,5,23.8,'2015-06-22 00:00:00',204),(769,1,45,'2015-04-09 00:00:00',205),(770,1,84.76,'2015-04-09 00:00:00',206),(771,2,84.76,'2015-05-09 00:00:00',206),(772,3,84.76,'2015-06-09 00:00:00',206),(773,4,84.76,'2015-07-09 00:00:00',206),(774,1,65.01,'2015-02-09 00:00:00',105),(775,2,65.01,'2015-03-09 00:00:00',105),(776,3,65.01,'2015-04-09 00:00:00',105),(777,4,65.01,'2015-05-09 00:00:00',105),(778,5,65.01,'2015-06-09 00:00:00',105),(779,6,65.01,'2015-07-09 00:00:00',105),(780,7,65.01,'2015-08-09 00:00:00',105),(781,8,65.01,'2015-09-09 00:00:00',105),(782,9,65.01,'2015-10-09 00:00:00',105),(783,10,65.01,'2015-11-09 00:00:00',105),(784,11,65.01,'2015-12-09 00:00:00',105),(785,12,65.01,'2016-01-09 00:00:00',105);
/*!40000 ALTER TABLE `pagamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pessi'
--

--
-- Dumping routines for database 'pessi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-08 16:11:29