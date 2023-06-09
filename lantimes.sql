

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema lantimes
--

CREATE DATABASE IF NOT EXISTS lantimes;
USE lantimesdefinitiva;

--
-- Definition of table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `NUM_CLIE` int(11) NOT NULL DEFAULT '0',
  `EMPRESA` char(20) NOT NULL,
  `REP_CLIE` int(11) DEFAULT NULL,
  `LIMITE_CREDITO` decimal(20,4) DEFAULT NULL,
  PRIMARY KEY (`NUM_CLIE`),
  KEY `NUM_CLIE` (`NUM_CLIE`),
  KEY `REP_CLIE` (`REP_CLIE`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`REP_CLIE`) REFERENCES `repventas` (`NUM_EMPL`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clientes`
--

/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` (`NUM_CLIE`,`EMPRESA`,`REP_CLIE`,`LIMITE_CREDITO`) VALUES 
 (2101,'Jones Mfg.',106,'65000.0000'),
 (2102,'Firts Corp.',101,'65000.0000'),
 (2103,'Acme Mfg.',105,'50000.0000'),
 (2105,'AAA Investments',101,'45000.0000'),
 (2106,'Fred Lewis Corp.',102,'65000.0000'),
 (2107,'Ace International',110,'35000.0000'),
 (2108,'Holm & Landis',109,'55000.0000'),
 (2109,'Chen Associates',103,'25000.0000'),
 (2111,'JCP Inc.',103,'50000.0000'),
 (2112,'Zetacorp',108,'50000.0000'),
 (2113,'Ian & Schmidt',104,'20000.0000'),
 (2114,'Orion Corp.',102,'20000.0000'),
 (2115,'Smithson Corp.',101,'20000.0000'),
 (2117,'J.P. Sinclair',106,'35000.0000'),
 (2118,'Midwest Systems',108,'60000.0000'),
 (2119,'Solomon Inc.',109,'25000.0000'),
 (2120,'Rico Enterprises',102,'50000.0000'),
 (2121,'QMA Assoc.',103,'45000.0000'),
 (2122,'Three-Way Lines',105,'30000.0000'),
 (2123,'Carter & Sons',102,'40000.0000'),
 (2124,'Peter Brothers',107,'40000.0000');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;


--
-- Definition of table `oficinas`
--

DROP TABLE IF EXISTS `oficinas`;
CREATE TABLE `oficinas` (
  `OFICINA` int(11) NOT NULL DEFAULT '0',
  `CIUDAD` char(15) NOT NULL,
  `REGION` char(10) NOT NULL,
  `DIR` int(11) NOT NULL DEFAULT '0',
  `OBJETIVO` decimal(20,4) DEFAULT NULL,
  `VENTAS` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`OFICINA`),
  KEY `DIR` (`DIR`),
  KEY `DIR_2` (`DIR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `oficinas`
--

/*!40000 ALTER TABLE `oficinas` DISABLE KEYS */;
INSERT INTO `oficinas` (`OFICINA`,`CIUDAD`,`REGION`,`DIR`,`OBJETIVO`,`VENTAS`) VALUES 
 (11,'New York','Este',106,'575000.0000','692637.0000'),
 (12,'Chicago','Este',104,'800000.0000','735042.0000'),
 (13,'Atlanta','Este',105,'350000.0000','367911.0000'),
 (21,'Los Angeles','Oeste',108,'725000.0000','835915.0000'),
 (22,'Denver','Oeste',108,'300000.0000','186042.0000');
/*!40000 ALTER TABLE `oficinas` ENABLE KEYS */;


--
-- Definition of table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE `pedidos` (
  `NUM_PEDIDO` int(11) NOT NULL,
  `FECHA_PEDIDO` datetime NOT NULL,
  `CLIE` int(11) NOT NULL,
  `REP` int(11) DEFAULT NULL,
  `FAB` char(3) NOT NULL,
  `PRODUCTO` char(5) NOT NULL,
  `CANT` int(11) NOT NULL,
  `IMPORTE` decimal(20,4) NOT NULL,
  PRIMARY KEY (`NUM_PEDIDO`),
  KEY `FAB` (`FAB`,`PRODUCTO`),
  KEY `REP` (`REP`),
  KEY `CLIE` (`CLIE`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`CLIE`) REFERENCES `clientes` (`NUM_CLIE`) ON DELETE CASCADE,
  CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`REP`) REFERENCES `repventas` (`NUM_EMPL`) ON DELETE SET NULL,
  CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`FAB`, `PRODUCTO`) REFERENCES `productos` (`ID_FAB`, `ID_PRODUCTO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pedidos`
--

/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` (`NUM_PEDIDO`,`FECHA_PEDIDO`,`CLIE`,`REP`,`FAB`,`PRODUCTO`,`CANT`,`IMPORTE`) VALUES 
 (110036,'1990-01-30 00:00:00',2107,110,'ACI','4100Z',9,'22500.0000'),
 (112961,'1989-12-17 00:00:00',2117,106,'REI','2A44L',7,'31500.0000'),
 (112963,'1989-12-17 00:00:00',2103,105,'ACI','41004',28,'3276.0000'),
 (112968,'1989-10-12 00:00:00',2102,101,'ACI','41004',34,'3978.0000'),
 (112975,'1989-10-12 00:00:00',2111,103,'REI','2A44G',6,'2100.0000'),
 (112979,'1989-10-12 00:00:00',2114,102,'ACI','4100Z',6,'15000.0000'),
 (112983,'1989-12-27 00:00:00',2103,105,'ACI','41004',6,'702.0000'),
 (112987,'1989-12-31 00:00:00',2103,105,'ACI','4100Y',11,'27500.0000'),
 (112989,'1990-01-03 00:00:00',2101,106,'FEA','114',6,'1458.0000'),
 (112992,'1989-11-04 00:00:00',2118,108,'ACI','41002',10,'760.0000'),
 (112993,'1989-01-04 00:00:00',2106,102,'REI','2A45C',24,'1896.0000'),
 (112997,'1990-01-08 00:00:00',2124,107,'BIC','41003',1,'652.0000'),
 (113003,'1990-01-25 00:00:00',2108,109,'IMM','779C',3,'5625.0000'),
 (113007,'1990-01-08 00:00:00',2112,108,'IMM','773C',3,'2925.0000'),
 (113012,'1990-01-11 00:00:00',2111,105,'ACI','41003',35,'3745.0000'),
 (113013,'1990-01-14 00:00:00',2118,108,'BIC','41003',1,'652.0000'),
 (113024,'1990-01-20 00:00:00',2114,108,'QSA','XK47',20,'7100.0000'),
 (113027,'1990-01-22 00:00:00',2103,105,'ACI','41002',54,'4104.0000'),
 (113034,'1990-01-29 00:00:00',2107,110,'REI','2A45C',8,'632.0000'),
 (113042,'1990-02-02 00:00:00',2113,101,'REI','2A44R',5,'22500.0000'),
 (113045,'1990-02-02 00:00:00',2112,108,'REI','2A44R',10,'45000.0000'),
 (113048,'1990-02-10 00:00:00',2120,102,'IMM','779C',2,'3750.0000'),
 (113049,'1990-02-10 00:00:00',2118,108,'QSA','XK47',2,'776.0000'),
 (113051,'1990-02-10 00:00:00',2118,108,'QSA','XK47',4,'1420.0000'),
 (113055,'1990-02-15 00:00:00',2108,101,'ACI','4100X',6,'150.0000'),
 (113057,'1990-02-18 00:00:00',2111,103,'ACI','4100X',24,'600.0000'),
 (113058,'1990-02-23 00:00:00',2108,109,'FEA','112',10,'1480.0000'),
 (113062,'1990-02-24 00:00:00',2124,107,'FEA','114',10,'2430.0000'),
 (113065,'1990-02-27 00:00:00',2106,102,'QSA','XK47',6,'2130.0000'),
 (113069,'1990-03-02 00:00:00',2109,107,'IMM','775C',22,'31350.0000');
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;


--
-- Definition of table `productos`
--

DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos` (
  `ID_FAB` char(3) NOT NULL,
  `ID_PRODUCTO` char(5) NOT NULL,
  `DESCRIPCION` char(20) NOT NULL,
  `PRECIO` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `EXISTENCIAS` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_FAB`,`ID_PRODUCTO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `productos`
--

/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`ID_FAB`,`ID_PRODUCTO`,`DESCRIPCION`,`PRECIO`,`EXISTENCIAS`) VALUES 
 ('ACI','41001','Artículo Tipo 1','55.0000',277),
 ('ACI','41002','Artículo Tipo 2','76.0000',167),
 ('ACI','41003','Artículo Tpo 3','107.0000',207),
 ('ACI','41004','Artículo Tipo 4','117.0000',139),
 ('ACI','4100X','Ajustador','25.0000',37),
 ('ACI','4100Y','Desmontador','2750.0000',25),
 ('ACI','4100Z','Montador','2500.0000',28),
 ('BIC','41003','Tirador','625.0000',3),
 ('BIC','41089','Retén','225.0000',78),
 ('BIC','41672','Placa','180.0000',0),
 ('FEA','112','Cubierta','148.0000',115),
 ('FEA','114','Bancada Motor','243.0000',15),
 ('IMM','773C','Abrazadera 300-lb','975.0000',28),
 ('IMM','775C','Abrazadera 500-lb','1425.0000',5),
 ('IMM','779C','Abrazadera 900.lb','1875.0000',9),
 ('IMM','887H','Soporte Abrazadera','54.0000',233),
 ('IMM','887P','Perno Abrazadera','250.0000',24),
 ('IMM','887X','Retén Abrazadera','475.0000',32),
 ('QSA','XK47','Reductor','355.0000',38),
 ('QSA','XK48','Reductor','134.0000',203),
 ('QSA','XK48A','Reductor','117.0000',37),
 ('REI','2A44G','Pasador Bisagra','350.0000',14),
 ('REI','2A44L','Bisagra Izqda.','4500.0000',12),
 ('REI','2A44R','Bisagra Dcha.','4500.0000',12),
 ('REI','2A45C','Unión Trinquete','79.0000',210);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;


--
-- Definition of table `repventas`
--

DROP TABLE IF EXISTS `repventas`;
CREATE TABLE `repventas` (
  `NUM_EMPL` int(11) NOT NULL DEFAULT '0',
  `NOMBRE` char(15) NOT NULL,
  `EDAD` smallint(6) DEFAULT NULL,
  `OFICINA_REP` int(11) DEFAULT NULL,
  `TITULO` char(10) DEFAULT NULL,
  `CONTRATO` datetime NOT NULL,
  `DIRECTOR` int(11) DEFAULT NULL,
  `CUOTA` decimal(20,4) DEFAULT NULL,
  `VENTAS` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`NUM_EMPL`),
  KEY `NUM_EMPL` (`NUM_EMPL`),
  KEY `OFICINA_REP` (`OFICINA_REP`),
  KEY `DIRECTOR` (`DIRECTOR`),
  CONSTRAINT `repventas_ibfk_1` FOREIGN KEY (`DIRECTOR`) REFERENCES `repventas` (`NUM_EMPL`) ON DELETE SET NULL,
  CONSTRAINT `repventas_ibfk_2` FOREIGN KEY (`OFICINA_REP`) REFERENCES `oficinas` (`OFICINA`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `repventas`
--

/*!40000 ALTER TABLE `repventas` DISABLE KEYS */;
INSERT INTO `repventas` (`NUM_EMPL`,`NOMBRE`,`EDAD`,`OFICINA_REP`,`TITULO`,`CONTRATO`,`DIRECTOR`,`CUOTA`,`VENTAS`) VALUES 
 (101,'Dan Roberts',45,12,'Rep Ventas','1986-10-20 00:00:00',104,'300000.0000','305673.0000'),
 (102,'Sue Smith',48,21,'Rep Ventas','1986-12-10 00:00:00',108,'350000.0000','474050.0000'),
 (103,'Paul Cruz',29,12,'Rep Ventas','1987-03-01 00:00:00',104,'275000.0000','286775.0000'),
 (104,'Bob Smith',33,12,'Dir Ventas','1987-05-19 00:00:00',106,'200000.0000','142594.0000'),
 (105,'Bill Adams',37,13,'Rep Ventas','1988-02-12 00:00:00',104,'350000.0000','367911.0000'),
 (106,'Sam Clark',52,11,'VP Ventas','1988-06-14 00:00:00',NULL,'275000.0000','299912.0000'),
 (107,'Nancy Angelli',49,22,'Rep Ventas','1988-11-14 00:00:00',108,'300000.0000','186042.0000'),
 (108,'Larry Fitch',62,21,'Dir Ventas','1989-10-12 00:00:00',106,'350000.0000','361865.0000'),
 (109,'Mary Jones',31,11,'Rep Ventas','1999-10-12 00:00:00',106,'300000.0000','392725.0000'),
 (110,'Tom Snyder',41,NULL,'Rep Ventas','1990-01-13 00:00:00',101,NULL,'75985.0000');
/*!40000 ALTER TABLE `repventas` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
