-- --------------------------------------------------------
-- Host:                         localhost
-- Server version:               5.7.24 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_amproduction.p_category
CREATE TABLE IF NOT EXISTS `p_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `p_category` DISABLE KEYS */;
INSERT INTO `p_category` (`id_category`, `name`, `created`, `updated`) VALUES
	(1, 'kaos kerah', '2020-07-30 01:23:04', '2020-07-31 01:23:04'),
	(4, 'kaos oblong', '2020-07-31 20:03:54', '2020-08-02 09:55:40');
/*!40000 ALTER TABLE `p_category` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_item
CREATE TABLE IF NOT EXISTS `p_item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category` int(11) NOT NULL,
  `price` int(11) DEFAULT NULL,
  `stock` int(11) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `category` (`category`),
  CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category`) REFERENCES `p_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `p_item` DISABLE KEYS */;
INSERT INTO `p_item` (`id_item`, `barcode`, `name`, `category`, `price`, `stock`, `created`, `updated`) VALUES
	(1, 'A1', 'kaos oblong', 4, 120000, 40, '2020-08-06 10:10:08', NULL),
	(2, 'A2', 'kaos gandul', 4, 20000, 5, '2020-08-06 10:58:03', NULL);
/*!40000 ALTER TABLE `p_item` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.supplier
CREATE TABLE IF NOT EXISTS `supplier` (
  `id_supplier` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `phone` varchar(14) NOT NULL,
  `address` varchar(128) NOT NULL,
  `description` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_supplier`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.supplier: ~2 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id_supplier`, `name`, `phone`, `address`, `description`, `created`, `updated`) VALUES
	(5, 'Toko A', '09809080989', 'AMPEL', 'PEMASOK KAOS OBLONG', '2020-08-06 09:55:40', '2020-08-06 14:07:08'),
	(6, 'Toko B', '09809080989', 'Gumpang', 'PEMASOK KAOS KERAH', '2020-08-06 09:56:03', '2020-08-06 14:07:25');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.t_stock
CREATE TABLE IF NOT EXISTS `t_stock` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `item` int(11) NOT NULL,
  `type` enum('in','out') NOT NULL,
  `detail` varchar(128) NOT NULL,
  `supplier` int(11) DEFAULT NULL,
  `qty` int(11) NOT NULL,
  `date` date NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_stock`),
  KEY `supplier` (`supplier`),
  KEY `item` (`item`),
  CONSTRAINT `t_stock_ibfk_1` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`id_supplier`),
  CONSTRAINT `t_stock_ibfk_2` FOREIGN KEY (`item`) REFERENCES `p_item` (`id_item`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.t_stock: ~7 rows (approximately)
/*!40000 ALTER TABLE `t_stock` DISABLE KEYS */;
INSERT INTO `t_stock` (`id_stock`, `item`, `type`, `detail`, `supplier`, `qty`, `date`, `created`) VALUES
	(9, 1, 'in', 'kulakan', NULL, 36, '2020-08-06', '2020-08-06 12:02:40'),
	(13, 1, 'out', 'jk', NULL, 8, '2020-08-06', '2020-08-06 12:52:41'),
	(15, 2, 'in', 'pemasok', 5, 5, '2020-08-06', '2020-08-06 13:01:03'),
	(16, 1, 'in', 'baju masuk', 5, 10, '2020-08-06', '2020-08-06 20:31:41'),
	(17, 1, 'in', 'baju masuk', 5, 10, '2020-08-06', '2020-08-06 20:32:45'),
	(18, 1, 'out', 'baju keluar', NULL, 8, '2020-08-06', '2020-08-06 20:33:39');
/*!40000 ALTER TABLE `t_stock` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(128) NOT NULL,
  `password` varchar(128) NOT NULL,
  `nama` varchar(128) NOT NULL,
  `address` varchar(128) NOT NULL,
  `level` int(11) NOT NULL COMMENT '1:admin,2:kasir',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `password`, `nama`, `address`, `level`) VALUES
	(1, 'admin', 'admin', 'han', 'ampel', 1),
	(2, 'kasir', 'kasir', 'kasir', 'ampel', 2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
