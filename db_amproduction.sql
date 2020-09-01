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

-- Dumping structure for table db_amproduction.p_bahan
CREATE TABLE IF NOT EXISTS `p_bahan` (
  `id_bahan` int(11) NOT NULL AUTO_INCREMENT,
  `nm_bahan` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_bahan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table db_amproduction.p_bahan: ~2 rows (approximately)
/*!40000 ALTER TABLE `p_bahan` DISABLE KEYS */;
INSERT INTO `p_bahan` (`id_bahan`, `nm_bahan`) VALUES
	(2, 'Cutton'),
	(3, 'Flannel');
/*!40000 ALTER TABLE `p_bahan` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_category
CREATE TABLE IF NOT EXISTS `p_category` (
  `id_category` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_category: ~9 rows (approximately)
/*!40000 ALTER TABLE `p_category` DISABLE KEYS */;
INSERT INTO `p_category` (`id_category`, `name`, `created`, `updated`) VALUES
	(5, 'Polo', '2020-08-11 20:49:28', '2020-08-11 13:56:12'),
	(6, 'APD', '2020-08-11 20:49:39', '2020-08-11 13:56:17'),
	(7, 'Oblong', '2020-08-11 20:49:54', '2020-08-11 13:56:23'),
	(8, 'Lengan Panjang', '2020-08-11 20:50:09', '2020-08-11 13:56:30'),
	(9, 'Partai', '2020-08-11 20:50:20', '2020-08-11 13:56:45'),
	(10, 'Kemeja', '2020-08-31 11:58:51', NULL),
	(11, 'Jaket', '2020-08-31 11:59:01', NULL),
	(12, 'Sweeter', '2020-08-31 11:59:10', NULL),
	(13, 'Polos', '2020-08-31 11:59:53', NULL),
	(14, 'Hoodie', '2020-08-31 12:01:26', NULL);
/*!40000 ALTER TABLE `p_category` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_color
CREATE TABLE IF NOT EXISTS `p_color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- Dumping data for table db_amproduction.p_color: ~11 rows (approximately)
/*!40000 ALTER TABLE `p_color` DISABLE KEYS */;
INSERT INTO `p_color` (`id_color`, `color`) VALUES
	(1, 'Merah'),
	(4, 'Kuning'),
	(5, 'Hijau'),
	(6, 'Biru'),
	(7, 'Hitam'),
	(8, 'Putih'),
	(9, 'Orange'),
	(10, 'Ungu'),
	(11, 'Abu - Abu'),
	(12, 'Denim'),
	(13, 'Coklat'),
	(14, 'Pink');
/*!40000 ALTER TABLE `p_color` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_item
CREATE TABLE IF NOT EXISTS `p_item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `bahan` int(11) DEFAULT NULL,
  `size` varchar(10),
  `price` int(11),
  `stock` int(11) DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `category` (`category`),
  KEY `color` (`color`),
  KEY `bahan` (`bahan`),
  CONSTRAINT `FK_p_item_p_bahan` FOREIGN KEY (`bahan`) REFERENCES `p_bahan` (`id_bahan`),
  CONSTRAINT `FK_p_item_p_color` FOREIGN KEY (`color`) REFERENCES `p_color` (`id_color`),
  CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category`) REFERENCES `p_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_item: ~2 rows (approximately)
/*!40000 ALTER TABLE `p_item` DISABLE KEYS */;
INSERT INTO `p_item` (`id_item`, `barcode`, `name`, `category`, `color`, `bahan`, `size`, `price`, `stock`, `created`, `updated`) VALUES
	(25, 'A3', 'Kaos Polo', 7, 9, 3, 'L', 1111111, 0, '2020-09-01 14:19:46', NULL),
	(26, 'A5', 'Kaos Oblonga', 10, 4, 3, 'S', 75000, 0, '2020-09-01 14:21:24', '2020-09-01 07:39:20'),
	(28, 'A4', 'Baju Muslim', 7, 1, 2, 'L', 130000, 0, '2020-09-01 14:28:58', '2020-09-01 07:37:48');
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

-- Dumping data for table db_amproduction.supplier: ~0 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` (`id_supplier`, `name`, `phone`, `address`, `description`, `created`, `updated`) VALUES
	(7, 'CV AMProduction', '081236715261', 'Lawean', 'Pemasok Baju', '2020-08-11 20:48:49', '2020-08-11 13:49:09');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.t_stock: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_stock` DISABLE KEYS */;
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
	(1, 'admin', 'admin', 'Admin', 'Lawean', 1),
	(3, 'kasir', 'kasir', 'Kasir', 'Lawean', 2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
