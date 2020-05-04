-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versione server:              10.1.31-MariaDB - mariadb.org binary distribution
-- S.O. server:                  Win32
-- HeidiSQL Versione:            10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dump database dbapp
CREATE DATABASE IF NOT EXISTS `dbapp` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbapp`;

-- Dump table dbapp.tblone
CREATE TABLE IF NOT EXISTS `tblone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Dump table dbapp.tbltwo
CREATE TABLE IF NOT EXISTS `tbltwo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oneId` int(11) NOT NULL,
  `val` varchar(64) DEFAULT NULL,
  `unixtime` int(11) NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- Dump della struttura di tabella dbapp.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `permit` int(1) NOT NULL COMMENT,
  `email` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `surname` varchar(64) DEFAULT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- Dump dei dati della tabella dbapp.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
--INSERT INTO `users` (`id`, `permit`, `email`, `password`, `name`, `surname`) SELECT 1, 9, 'admin@domain.ltd', '5f4dcc3b5aa765d61d8327deb882cf99', 'Name', 'Surname' FROM DUAL WHERE NOT EXISTS (SELECT * FROM `users`) LIMIT 1;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
