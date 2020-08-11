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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_category: ~2 rows (approximately)
/*!40000 ALTER TABLE `p_category` DISABLE KEYS */;
INSERT INTO `p_category` (`id_category`, `name`, `created`, `updated`) VALUES
	(5, 'Polo', '2020-08-11 20:49:28', '2020-08-11 13:56:12'),
	(6, 'APD', '2020-08-11 20:49:39', '2020-08-11 13:56:17'),
	(7, 'Oblong', '2020-08-11 20:49:54', '2020-08-11 13:56:23'),
	(8, 'Lengan Panjang', '2020-08-11 20:50:09', '2020-08-11 13:56:30'),
	(9, 'Partai', '2020-08-11 20:50:20', '2020-08-11 13:56:45');
/*!40000 ALTER TABLE `p_category` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_color
CREATE TABLE IF NOT EXISTS `p_color` (
  `id_color` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id_color`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table db_amproduction.p_color: ~0 rows (approximately)
/*!40000 ALTER TABLE `p_color` DISABLE KEYS */;
INSERT INTO `p_color` (`id_color`, `color`) VALUES
	(1, 'Merah'),
	(4, 'Kuning'),
	(5, 'Hijau'),
	(6, 'Biru'),
	(7, 'Hitam'),
	(8, 'Putih');
/*!40000 ALTER TABLE `p_color` ENABLE KEYS */;

-- Dumping structure for table db_amproduction.p_item
CREATE TABLE IF NOT EXISTS `p_item` (
  `id_item` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(128) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `color` int(11) DEFAULT NULL,
  `size` varchar(10),
  `price` int(11),
  `stock` int(11) DEFAULT '0',
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`id_item`),
  UNIQUE KEY `barcode` (`barcode`),
  KEY `category` (`category`),
  KEY `color` (`color`),
  CONSTRAINT `FK_p_item_p_color` FOREIGN KEY (`color`) REFERENCES `p_color` (`id_color`),
  CONSTRAINT `p_item_ibfk_1` FOREIGN KEY (`category`) REFERENCES `p_category` (`id_category`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_item: ~0 rows (approximately)
/*!40000 ALTER TABLE `p_item` DISABLE KEYS */;
INSERT INTO `p_item` (`id_item`, `barcode`, `name`, `category`, `color`, `size`, `price`, `stock`, `created`, `updated`) VALUES
	(8, 'A1', 'Baju Partai', 9, 1, 'XS', 80000, 100, '2020-08-11 20:57:12', NULL),
	(9, 'A2', 'Baju APD', 6, 8, 'M', 100000, 100, '2020-08-11 21:00:55', NULL),
	(10, 'A3', 'Baju Muslim', 8, 8, '', 130000, 790, '2020-08-11 21:02:12', NULL),
	(11, 'A4', 'Baju E-Sport', 8, 1, 'S', 150000, 0, '2020-08-11 21:03:18', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.t_stock: ~0 rows (approximately)
/*!40000 ALTER TABLE `t_stock` DISABLE KEYS */;
INSERT INTO `t_stock` (`id_stock`, `item`, `type`, `detail`, `supplier`, `qty`, `date`, `created`) VALUES
	(27, 8, 'in', 'Barang Masuk ', 7, 100, '2020-08-11', '2020-08-11 21:04:39'),
	(28, 9, 'in', 'Barang Masuk ', 7, 150, '2020-08-11', '2020-08-11 21:07:04'),
	(29, 10, 'in', 'Barang Masuk ', 7, 2000, '2020-08-11', '2020-08-11 21:07:35'),
	(30, 10, 'out', 'Baju Keluar', NULL, 1200, '2020-08-11', '2020-08-11 21:08:42'),
	(31, 9, 'out', 'Baju Keluar', NULL, 50, '2020-08-11', '2020-08-11 21:09:07'),
	(32, 10, 'out', 'Baju Keluar', NULL, 10, '2020-08-11', '2020-08-11 21:09:33');
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
