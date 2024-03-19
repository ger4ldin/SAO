-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Mar 19, 2024 at 08:13 PM
-- Server version: 8.0.31
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `integradoranorma`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `estado` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `localidad` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `calle_principal` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `calle1` varchar(45) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `calle2` varchar(45) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `detalles` longtext COLLATE utf8mb3_spanish2_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `address-cat_country` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `id_country`, `estado`, `localidad`, `calle_principal`, `calle1`, `calle2`, `detalles`, `created_at`) VALUES
(1, 1, 'estado', 'localidad', 'calle', NULL, NULL, NULL, '2024-03-18 14:51:43');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int DEFAULT '1',
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP,
  KEY `cart-user` (`id_user`),
  KEY `cart-product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id_user`, `id_product`, `quantity`, `last_update`) VALUES
(1, 3, 3, '2024-03-18 20:53:52'),
(1, 16, 1, '2024-03-19 00:19:04'),
(1, 17, 1, '2024-03-19 00:19:47'),
(1, 18, 1, '2024-03-19 00:20:02'),
(1, 19, 1, '2024-03-19 00:20:16');

-- --------------------------------------------------------

--
-- Table structure for table `cat_brand`
--

DROP TABLE IF EXISTS `cat_brand`;
CREATE TABLE IF NOT EXISTS `cat_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `description` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `id_address` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cat_brand-address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_brand`
--

INSERT INTO `cat_brand` (`id`, `brand`, `description`, `id_address`) VALUES
(1, 'marca', 'sin descripcion', 1),
(2, 'Sony', 'sin descripcion', 1),
(3, 'Samsung', 'sin descripcion', 1),
(4, 'Apple', 'sin descripcion', 1),
(5, 'Bose', 'sin descripcion', 1),
(6, 'Canon', 'sin descripcion', 1),
(7, 'Post-it', 'sin descripcion', 1),
(8, 'Sharpie', 'sin descripcion', 1),
(9, 'Prismacolor', 'sin descripcion', 1),
(10, 'Moleskine', 'sin descripcion', 1),
(11, 'Expo', 'sin descripcion', 1),
(12, 'Requiez', 'sin descripcion', 1),
(13, 'H2', 'sin descripcion', 1),
(14, 'Offiho', 'sin descripcion', 1),
(15, 'Techno', 'sin descripcion', 1),
(16, 'Versa', 'sin descripcion', 1),
(17, 'Estrella', 'sin descripcion', 1),
(18, 'NORMA', 'sin descripcion', 1),
(19, 'SCRIBE', 'sin descripcion', 1),
(20, 'PILOT', 'sin descripcion', 1),
(21, 'AZOR', 'sin descripcion', 1);

-- --------------------------------------------------------

--
-- Table structure for table `cat_category`
--

DROP TABLE IF EXISTS `cat_category`;
CREATE TABLE IF NOT EXISTS `cat_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_category`
--

INSERT INTO `cat_category` (`id`, `category`) VALUES
(2, 'electronica'),
(3, 'moviliario'),
(4, 'ofertas'),
(1, 'papeleria');

-- --------------------------------------------------------

--
-- Table structure for table `cat_country`
--

DROP TABLE IF EXISTS `cat_country`;
CREATE TABLE IF NOT EXISTS `cat_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `country_UNIQUE` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_country`
--

INSERT INTO `cat_country` (`id`, `country`) VALUES
(1, 'estados unidos'),
(2, 'mexico');

-- --------------------------------------------------------

--
-- Table structure for table `cat_payment_method`
--

DROP TABLE IF EXISTS `cat_payment_method`;
CREATE TABLE IF NOT EXISTS `cat_payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_method` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `payment_method_UNIQUE` (`payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_payment_method`
--

INSERT INTO `cat_payment_method` (`id`, `payment_method`) VALUES
(6, 'banco azteca'),
(3, 'bbva'),
(7, 'coppel'),
(1, 'deposito'),
(4, 'nu'),
(2, 'paypal'),
(5, 'santander');

-- --------------------------------------------------------

--
-- Table structure for table `cat_payment_status`
--

DROP TABLE IF EXISTS `cat_payment_status`;
CREATE TABLE IF NOT EXISTS `cat_payment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `payment_status_UNIQUE` (`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_payment_status`
--

INSERT INTO `cat_payment_status` (`id`, `payment_status`) VALUES
(1, 'cancelado'),
(2, 'pagado'),
(3, 'pendiente'),
(4, 'rechazado');

-- --------------------------------------------------------

--
-- Table structure for table `cat_user`
--

DROP TABLE IF EXISTS `cat_user`;
CREATE TABLE IF NOT EXISTS `cat_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_of_user` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `type_of_user_UNIQUE` (`type_of_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `cat_user`
--

INSERT INTO `cat_user` (`id`, `type_of_user`) VALUES
(1, 'admin'),
(2, 'empleado'),
(3, 'usuario');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL,
  `id_,method` int NOT NULL,
  `id_status` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `payment-payment_method` (`id_,method`),
  KEY `payment-payment_status` (`id_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `id_brand` int NOT NULL,
  `name` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `imagen` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `description` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `specifications` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `dimensions` varchar(45) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `stock` int NOT NULL,
  `price` int NOT NULL,
  `discount` float DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product-cat_category` (`id_category`),
  KEY `product-cat_brand` (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `id_category`, `id_brand`, `name`, `imagen`, `description`, `specifications`, `dimensions`, `stock`, `price`, `discount`, `status`, `created_at`, `last_update`) VALUES
(1, 2, 1, 'Sony WH-1000XM4', '', 'Auriculares inalámbricos con cancelación de r', 'Cancelación de ruido adaptativa, hasta 30 hor', NULL, 1, 10, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(2, 2, 2, 'Samsung Galaxy S21 Ultra', '', 'Smartphone con cámara de 108 MP y zoom de 100', 'Pantalla Dynamic AMOLED 2X de 6.8 pulgadas, E', '165.1 x 75.6 x 8.9 mm', 1, 20, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(3, 2, 3, 'Apple Watch Series 7', '', 'Smartwatch con pantalla siempre encendida y d', 'Pantalla Retina siempre activa, resistente al', NULL, 1, 30, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(4, 2, 4, 'Bose QuietComfort Earbuds', '', 'Auriculares inalámbricos con cancelación de r', 'Cancelación de ruido ajustable, hasta 6 horas', NULL, 1, 40, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(5, 2, 5, 'Canon EOS R5', '', 'Cámara mirrorless de alta resolución con capa', 'Sensor CMOS de formato completo de 45 MP, AF ', '138.5 x 97.5 x 88 mm', 1, 50, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(6, 1, 6, 'Post-it Super Sticky Notes', '', 'Notas adhesivas con tecnología Super Sticky p', 'Papel reciclado, adhesivo acrílico, 90 hojas ', '76 x 76 mm', 1, 10, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(7, 1, 7, 'Sharpie Permanent Markers', '', 'Marcadores permanentes con tinta resistente a', 'Punta fina, tinta a base de alcohol, 12 color', NULL, 1, 20, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(8, 1, 8, 'Prismacolor Premier Colored Pencils', '', 'Lápices de colores de alta calidad para artis', 'Núcleo de plomo suave, resistente a la rotura', NULL, 1, 30, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(9, 1, 9, 'Moleskine Classic Notebook', '', 'Cuaderno clásico con tapa dura y papel libre ', 'Papel marfil de 70 g/m², cinta marcapáginas, ', '130 x 210 mm', 1, 40, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(10, 1, 10, 'Expo Dry Erase Markers', '', 'Marcadores para pizarras blancas con tinta de', 'Punta fina, tinta a base de alcohol, 12 color', NULL, 1, 50, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(11, 3, 11, 'Requiez Silla Ejecutiva', '', 'Silla ejecutiva con respaldo alto y soporte l', 'Asiento acolchado, base de aluminio, ruedas d', NULL, 1, 10, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(12, 3, 12, 'H2 Escritorio', '', 'Escritorio con superficie de melamina y patas', 'Superficie de 120 x 60 cm, altura ajustable, ', NULL, 1, 20, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(13, 3, 13, 'Offiho Archivero', '', 'Archivero con 3 cajones y ruedas para oficina', 'Cajones con cerradura, ruedas giratorias, 3 c', NULL, 1, 30, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(14, 3, 14, 'Techno Lámpara de Escritorio', '', 'Lámpara de escritorio con brazo ajustable y p', 'Brazo flexible, 3 niveles de brillo, 3 colore', NULL, 1, 40, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(15, 3, 15, 'Versa Silla Plegable', '', 'Silla plegable con asiento acolchado y respal', 'Estructura de acero, asiento de poliéster, 3 ', NULL, 1, 50, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(16, 4, 16, 'Estrella Cuaderno Profesional', '', 'Cuaderno profesional con tapa dura y papel de', 'Papel de 90 g/m², cinta marcapáginas, bolsill', '130 x 210 mm', 1, 10, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(17, 4, 17, 'NORMA Lápiz Mecánico', '', 'Lápiz mecánico con cuerpo de plástico y clip ', 'Punta de 0.7 mm, goma de borrar incorporada, ', NULL, 1, 20, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(18, 4, 18, 'SCRIBE Marcador Permanente', '', 'Marcador permanente con tinta resistente al a', 'Punta fina, tinta a base de alcohol, 12 color', NULL, 1, 30, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(19, 4, 19, 'PILOT G2 Bolígrafo Gel', '', 'Bolígrafo gel con tinta de secado rápido y re', 'Punta de 0.7 mm, tinta de gel, 12 colores sur', NULL, 1, 40, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55'),
(20, 4, 20, 'AZOR Papel Bond', '', 'Papel bond de alta calidad para impresión lás', 'Papel de 75 g/m², tamaño carta, 500 hojas por', NULL, 1, 50, 0, 1, '0000-00-00 00:00:00', '2024-03-18 16:41:55');

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `id_payment` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `sale-payment` (`id_payment`),
  KEY `sale-user` (`id_user`),
  KEY `sale-product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `lastnameF` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `lastnameM` varchar(45) COLLATE utf8mb3_spanish2_ci DEFAULT NULL,
  `email` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `password` varchar(45) COLLATE utf8mb3_spanish2_ci NOT NULL,
  `id_address` int NOT NULL,
  `id_user` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user-cat_user` (`id_user`),
  KEY `user-address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish2_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `lastnameF`, `lastnameM`, `email`, `password`, `id_address`, `id_user`, `status`, `created_at`, `last_update`) VALUES
(1, 'brian', 'hernandez', 'garcia', 'email', '1234', 1, 1, 1, '2024-03-18 15:02:02', '2024-03-18 15:02:02');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address-cat_country` FOREIGN KEY (`id_country`) REFERENCES `cat_country` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart-product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart-user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `cat_brand`
--
ALTER TABLE `cat_brand`
  ADD CONSTRAINT `cat_brand-address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment-payment_method` FOREIGN KEY (`id_,method`) REFERENCES `cat_payment_method` (`id`),
  ADD CONSTRAINT `payment-payment_status` FOREIGN KEY (`id_status`) REFERENCES `cat_payment_status` (`id`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product-cat_brand` FOREIGN KEY (`id_brand`) REFERENCES `cat_brand` (`id`),
  ADD CONSTRAINT `product-cat_category` FOREIGN KEY (`id_category`) REFERENCES `cat_category` (`id`);

--
-- Constraints for table `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale-payment` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `sale-product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `sale-user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user-address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `user-cat_user` FOREIGN KEY (`id_user`) REFERENCES `cat_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
