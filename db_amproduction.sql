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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_category: ~10 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- Dumping data for table db_amproduction.p_color: ~12 rows (approximately)
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.p_item: ~11 rows (approximately)
/*!40000 ALTER TABLE `p_item` DISABLE KEYS */;
INSERT INTO `p_item` (`id_item`, `barcode`, `name`, `category`, `color`, `size`, `price`, `stock`, `created`, `updated`) VALUES
	(8, 'A1', 'Baju Partai', 9, 1, 'XS', 80000, 400, '2020-08-11 20:57:12', NULL),
	(9, 'A2', 'Baju APD', 6, 8, 'M', 100000, 900, '2020-08-11 21:00:55', NULL),
	(10, 'A3', 'Baju Muslim', 8, 8, '', 130000, 100, '2020-08-11 21:02:12', NULL),
	(11, 'A4', 'Baju E-Sport', 8, 1, 'S', 150000, 800, '2020-08-11 21:03:18', NULL),
	(13, 'A5', 'Kaos Polos', 7, 4, '', 75000, 570, '2020-08-31 11:57:34', '2020-08-31 05:08:14'),
	(14, 'A6', 'Kaos Casual', 13, 13, 'L', 80000, 150, '2020-08-31 12:05:45', NULL),
	(15, 'A7', 'Baju Kemeja', 10, 9, 'L', 100000, 300, '2020-08-31 12:06:25', NULL),
	(16, 'A8', 'Kaos Crew Neck', 13, 4, '', 78000, 400, '2020-08-31 12:07:55', NULL),
	(17, 'A9', 'Kaos V-Neck', 13, 8, 'XL', 75000, 300, '2020-08-31 12:08:55', NULL),
	(18, 'A10', 'Kaos Turtle Neck', 13, 7, '', 80000, 200, '2020-08-31 12:10:01', NULL),
	(23, 'A11', 'Kaos Polo', 5, 1, 'M', 75000, 400, '2020-08-31 12:25:24', NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table db_amproduction.t_stock: ~23 rows (approximately)
/*!40000 ALTER TABLE `t_stock` DISABLE KEYS */;
INSERT INTO `t_stock` (`id_stock`, `item`, `type`, `detail`, `supplier`, `qty`, `date`, `created`) VALUES
	(28, 9, 'in', 'Barang Masuk ', 7, 150, '2020-07-11', '2020-08-11 21:07:04'),
	(37, 9, 'out', 'baju keluar', NULL, 150, '2020-08-31', '2020-08-31 11:34:47'),
	(38, 8, 'in', 'baju masuk', 7, 500, '2020-07-31', '2020-08-31 12:37:44'),
	(39, 18, 'in', 'baju masuk', 7, 400, '2020-07-22', '2020-08-31 12:37:59'),
	(40, 23, 'in', 'baju masuk', 7, 900, '2020-07-20', '2020-08-31 12:38:13'),
	(41, 9, 'in', 'baju masuk', 7, 1500, '2020-07-01', '2020-08-31 12:38:28'),
	(42, 10, 'in', 'baju masuk', 7, 800, '2020-08-15', '2020-08-31 12:38:49'),
	(43, 11, 'in', 'baju masuk', 7, 850, '2020-08-15', '2020-08-31 12:39:07'),
	(44, 13, 'in', 'baju masuk', 7, 750, '2020-08-25', '2020-08-31 12:39:29'),
	(45, 14, 'in', 'baju masuk', 7, 150, '2020-08-22', '2020-08-31 12:39:44'),
	(46, 15, 'in', 'baju masuk', 7, 300, '2020-08-28', '2020-08-31 12:40:02'),
	(47, 16, 'in', 'baju masuk', 7, 450, '2020-08-19', '2020-08-31 12:40:34'),
	(48, 17, 'in', 'baju masuk', 7, 500, '2020-08-21', '2020-08-31 12:41:03'),
	(49, 8, 'out', 'baju keluar', NULL, 100, '2020-08-29', '2020-08-31 12:43:51'),
	(50, 18, 'out', 'baju keluar', NULL, 200, '2020-08-30', '2020-08-31 12:44:34'),
	(51, 23, 'out', 'baju keluar', NULL, 500, '2020-08-30', '2020-08-31 12:44:56'),
	(52, 9, 'out', 'baju keluar', NULL, 400, '2020-08-31', '2020-08-31 12:45:18'),
	(53, 10, 'out', 'baju keluar', NULL, 700, '2020-08-31', '2020-08-31 12:45:46'),
	(54, 11, 'out', 'baju keluar', NULL, 50, '2020-08-28', '2020-08-31 12:46:02'),
	(55, 13, 'out', 'baju keluar', NULL, 180, '2020-08-31', '2020-08-31 12:46:42'),
	(56, 16, 'out', 'baju keluar', NULL, 50, '2020-08-31', '2020-08-31 12:47:09'),
	(57, 17, 'out', 'baju keluar', NULL, 200, '2020-08-31', '2020-08-31 12:47:26'),
	(58, 9, 'out', 'baju keluar', NULL, 200, '2020-08-31', '2020-08-31 12:47:48');
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
