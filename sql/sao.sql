-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 10-04-2024 a las 21:30:50
-- Versión del servidor: 8.0.31
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sao`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_country` int NOT NULL,
  `state` varchar(100) NOT NULL,
  `locality` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `main_street` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `street1` varchar(100) DEFAULT NULL,
  `street2` varchar(100) DEFAULT NULL,
  `references` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `address-cat_country` (`id_country`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `address`
--

INSERT INTO `address` (`id`, `id_country`, `state`, `locality`, `main_street`, `street1`, `street2`, `references`, `created_at`) VALUES
(1, 1, 'Tlaxcala', 'Apizaco', 'Calle', NULL, NULL, NULL, '2024-04-05 21:18:59'),
(37, 1, 'adef', 'sdv', 'sdv', 'dv', 'dsv', 'sdV', '2024-04-06 23:08:36'),
(38, 1, 'Tlaxcala', 'Apizaco', 'Calle 5 de mayo', 'Calle 2 de marzo', 'Calle Xicotencalt', 'Casa ', '2024-04-07 02:11:15'),
(39, 1, 'vdsqv', 'fqv', 'qev', 'qefv', 'asdfv', 'qwev', '2024-04-07 18:26:05'),
(40, 1, 'vdsqv', 'fqv', 'qev', 'qefv', 'asdfv', 'qwev', '2024-04-07 18:26:08'),
(41, 1, 'Tlaxcala', 'Apizaco', 'Calle de gerltina', 'Calle feita', 'Calle bonita', 'Casita', '2024-04-10 07:53:30'),
(42, 1, 'Tlaxcala', 'Apizaco', 'Calle', '', '', '', '2024-04-10 08:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` int DEFAULT '1',
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `cart-user` (`id_user`),
  KEY `cart-product` (`id_product`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cart`
--

INSERT INTO `cart` (`id_user`, `id_product`, `quantity`, `last_update`) VALUES
(1, 65, 1, '2024-04-10 07:42:34'),
(1, 74, 1, '2024-04-10 07:42:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_brand`
--

DROP TABLE IF EXISTS `cat_brand`;
CREATE TABLE IF NOT EXISTS `cat_brand` (
  `id` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) NOT NULL,
  `description` varchar(100) NOT NULL,
  `id_address` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `cat_brand-address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_brand`
--

INSERT INTO `cat_brand` (`id`, `brand`, `description`, `id_address`) VALUES
(1, 'Sony', 'sin descripcion', 1),
(2, 'Samsung', 'sin descripcion', 1),
(3, 'Apple', 'sin descripcion', 1),
(4, 'Bose', 'sin descripcion', 1),
(5, 'Canon', 'sin descripcion', 1),
(6, 'Post-it', 'sin descripcion', 1),
(7, 'Sharpie', 'sin descripcion', 1),
(8, 'Prismacolor', 'sin descripcion', 1),
(9, 'Moleskine', 'sin descripcion', 1),
(10, 'Expo', 'sin descripcion', 1),
(11, 'Requiez', 'sin descripcion', 1),
(12, 'H2', 'sin descripcion', 1),
(13, 'Offiho', 'sin descripcion', 1),
(14, 'Techno', 'sin descripcion', 1),
(15, 'Versa', 'sin descripcion', 1),
(16, 'Estrella', 'sin descripcion', 1),
(17, 'NORMA', 'sin descripcion', 1),
(18, 'SCRIBE', 'sin descripcion', 1),
(19, 'PILOT', 'sin descripcion', 1),
(20, 'AZOR', 'sin descripcion', 1),
(21, 'marca', 'sin descripcion', 1),
(22, 'hp', '', 1),
(23, 'empos', '', 1),
(24, 'canon', '', 1),
(25, 'sony', '', 1),
(26, 'kingston', '', 1),
(27, 'ikea', '', 1),
(28, 'hon', '', 1),
(29, 'office star', '', 1),
(30, 'ashley', '', 1),
(31, 'steelcase', '', 1),
(32, 'hni', '', 1),
(33, 'post-it', '', 1),
(34, 'five star', '', 1),
(35, 'bik', '', 1),
(36, 'faber-caste', '', 1),
(37, 'papermate', '', 1),
(38, 'papermatesharpie', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_category`
--

DROP TABLE IF EXISTS `cat_category`;
CREATE TABLE IF NOT EXISTS `cat_category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `category_UNIQUE` (`category`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_category`
--

INSERT INTO `cat_category` (`id`, `category`) VALUES
(2, 'electronica'),
(3, 'moviliario'),
(4, 'ofertas'),
(1, 'papeleria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_country`
--

DROP TABLE IF EXISTS `cat_country`;
CREATE TABLE IF NOT EXISTS `cat_country` (
  `id` int NOT NULL AUTO_INCREMENT,
  `country` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `country_UNIQUE` (`country`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_country`
--

INSERT INTO `cat_country` (`id`, `country`) VALUES
(1, 'mexico');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_history_process`
--

DROP TABLE IF EXISTS `cat_history_process`;
CREATE TABLE IF NOT EXISTS `cat_history_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon_process` longtext NOT NULL,
  `name_process` varchar(100) NOT NULL,
  `description` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `process_name_UNIQUE` (`name_process`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_history_process`
--

INSERT INTO `cat_history_process` (`id`, `icon_process`, `name_process`, `description`) VALUES
(1, '<svg stroke=\"currentColor\" fill=\"none\" stroke-width=\"0\" viewBox=\"0 0 24 24\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M6 6C6 5.44772 6.44772 5 7 5H17C17.5523 5 18 5.44772 18 6C18 6.55228 17.5523 7 17 7H7C6.44771 7 6 6.55228 6 6Z\" fill=\"currentColor\"></path><path d=\"M6 10C6 9.44771 6.44772 9 7 9H17C17.5523 9 18 9.44771 18 10C18 10.5523 17.5523 11 17 11H7C6.44771 11 6 10.5523 6 10Z\" fill=\"currentColor\"></path><path d=\"M7 13C6.44772 13 6 13.4477 6 14C6 14.5523 6.44771 15 7 15H17C17.5523 15 18 14.5523 18 14C18 13.4477 17.5523 13 17 13H7Z\" fill=\"currentColor\"></path><path d=\"M6 18C6 17.4477 6.44772 17 7 17H11C11.5523 17 12 17.4477 12 18C12 18.5523 11.5523 19 11 19H7C6.44772 19 6 18.5523 6 18Z\" fill=\"currentColor\"></path><path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M2 4C2 2.34315 3.34315 1 5 1H19C20.6569 1 22 2.34315 22 4V20C22 21.6569 20.6569 23 19 23H5C3.34315 23 2 21.6569 2 20V4ZM5 3H19C19.5523 3 20 3.44771 20 4V20C20 20.5523 19.5523 21 19 21H5C4.44772 21 4 20.5523 4 20V4C4 3.44772 4.44771 3 5 3Z\" fill=\"currentColor\"></path></svg>', 'Se creo tu orden', NULL),
(2, '<svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 24 24\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path fill=\"none\" stroke-width=\"2\" d=\"M16,16 C16,14.8954305 12.8659932,14 9,14 C5.13400675,14 2,14.8954305 2,16 C2,17.1045695 5.13400675,18 9,18 C12.8659932,18 16,17.1045695 16,16 Z M2,16 L2,20.9367547 C2,22.0762536 5.13400675,23 9,23 C12.8659932,23 16,22.0762537 16,20.9367548 L16,16 M9,5 C4.581722,5 1,5.8954305 1,7 C1,8.1045695 4.581722,9 9,9 M1,7 L1,12.0000002 C1,13.0128881 4.581722,14 9,14 M23,4 C23,2.8954305 19.9004329,2 16.0769231,2 C12.2534133,2 9.15384615,2.8954305 9.15384615,4 C9.15384615,5.1045695 12.2534133,6 16.0769231,6 C19.9004329,6 23,5.1045695 23,4 Z M16,16 C19.8235098,16 23.0000002,15.0128879 23.0000002,14 L23,4 M9.15384615,3.99999999 L9.15384615,14.1660042 M8.99999999,9.00000001 C8.99999999,10.0128879 12.2534135,11 16.0769233,11 C19.9004331,11 23.0000004,10.0128879 23.0000004,9.00000001\"></path></svg>', 'Se Recibio el pago', NULL),
(3, '<svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 16 16\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M15.854.146a.5.5 0 0 1 .11.54l-5.819 14.547a.75.75 0 0 1-1.329.124l-3.178-4.995L.643 7.184a.75.75 0 0 1 .124-1.33L15.314.037a.5.5 0 0 1 .54.11ZM6.636 10.07l2.761 4.338L14.13 2.576 6.636 10.07Zm6.787-8.201L1.591 6.602l4.339 2.76 7.494-7.493Z\"></path></svg>', 'Se envio tu orden a la marca', NULL),
(4, '<svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 24 24\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M21 11h-3V4a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v14c0 1.654 1.346 3 3 3h14c1.654 0 3-1.346 3-3v-6a1 1 0 0 0-1-1zM5 19a1 1 0 0 1-1-1V5h12v13c0 .351.061.688.171 1H5zm15-1a1 1 0 0 1-2 0v-5h2v5z\"></path><path d=\"M6 7h8v2H6zm0 4h8v2H6zm5 4h3v2h-3z\"></path></svg>', 'La marca recibio la orden', NULL),
(5, '<svg stroke=\"currentColor\" fill=\"currentColor\" stroke-width=\"0\" viewBox=\"0 0 256 256\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M225.6,62.64l-88-48.17a19.91,19.91,0,0,0-19.2,0l-88,48.17A20,20,0,0,0,20,80.19v95.62a20,20,0,0,0,10.4,17.55l88,48.17a19.89,19.89,0,0,0,19.2,0l88-48.17A20,20,0,0,0,236,175.81V80.19A20,20,0,0,0,225.6,62.64ZM128,36.57,200,76,178.57,87.73l-72-39.42Zm0,78.83L56,76,81.56,62l72,39.41ZM44,96.79l72,39.4v76.67L44,173.44Zm96,116.07V136.19l24-13.13V152a12,12,0,0,0,24,0V109.92l24-13.13v76.65Z\"></path></svg>', 'Tu pedido se esta haciendo', NULL),
(6, '<svg stroke=\"currentColor\" fill=\"none\" stroke-width=\"2\" viewBox=\"0 0 24 24\" stroke-linecap=\"round\" stroke-linejoin=\"round\" height=\"1em\" width=\"1em\" xmlns=\"http://www.w3.org/2000/svg\"><path stroke=\"none\" d=\"M0 0h24v24H0z\" fill=\"none\"></path><path d=\"M7 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0\"></path><path d=\"M17 17m-2 0a2 2 0 1 0 4 0a2 2 0 1 0 -4 0\"></path><path d=\"M5 17h-2v-6l2 -5h9l4 5h1a2 2 0 0 1 2 2v4h-2m-4 0h-6m-6 -6h15m-6 0v-5\"></path></svg>', 'La marca a enviado tu pedido', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_payment_method`
--

DROP TABLE IF EXISTS `cat_payment_method`;
CREATE TABLE IF NOT EXISTS `cat_payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `imagen` longtext NOT NULL,
  `payment_method` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `payment_method_UNIQUE` (`payment_method`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_payment_method`
--

INSERT INTO `cat_payment_method` (`id`, `imagen`, `payment_method`) VALUES
(1, 'https://xihmai.com/api/assets/brands/vs.png', 'visa'),
(2, 'https://xihmai.com/api/assets/brands/mc.png', 'mastercard'),
(3, 'https://xihmai.com/api/assets/brands/oxxo.png', 'oxxo'),
(4, 'https://xihmai.com/api/assets/brands/mp.png', 'mercado pago'),
(5, 'https://xihmai.com/api/assets/brands/pp.png', 'paypal');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_payment_status`
--

DROP TABLE IF EXISTS `cat_payment_status`;
CREATE TABLE IF NOT EXISTS `cat_payment_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `payment_status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `payment_status_UNIQUE` (`payment_status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_payment_status`
--

INSERT INTO `cat_payment_status` (`id`, `payment_status`) VALUES
(2, 'cancelado'),
(3, 'pagado'),
(1, 'pendiente'),
(4, 'rechazado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat_user`
--

DROP TABLE IF EXISTS `cat_user`;
CREATE TABLE IF NOT EXISTS `cat_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_of_user` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `type_of_user_UNIQUE` (`type_of_user`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `cat_user`
--

INSERT INTO `cat_user` (`id`, `type_of_user`) VALUES
(1, 'admin'),
(2, 'empleado'),
(3, 'usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `history_process`
--

DROP TABLE IF EXISTS `history_process`;
CREATE TABLE IF NOT EXISTS `history_process` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_process` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `history_process-cat_history_process_idx` (`id_process`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `history_process`
--

INSERT INTO `history_process` (`id`, `id_process`, `created_at`) VALUES
(1, 4, '2024-04-06 23:08:36'),
(2, 4, '2024-04-07 02:11:15'),
(3, 2, '2024-04-07 18:26:05'),
(4, 3, '2024-04-10 07:53:30'),
(5, 3, '2024-04-10 07:53:30'),
(6, 2, '2024-04-10 08:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `payment`
--

DROP TABLE IF EXISTS `payment`;
CREATE TABLE IF NOT EXISTS `payment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_method` int NOT NULL,
  `id_status` int NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `payment-payment_method` (`id_method`),
  KEY `payment-payment_status` (`id_status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `payment`
--

INSERT INTO `payment` (`id`, `id_method`, `id_status`, `created_at`, `last_update`) VALUES
(1, 1, 3, '2024-04-06 23:08:36', '2024-04-10 07:49:40'),
(2, 1, 3, '2024-04-07 02:11:15', '2024-04-10 07:49:45'),
(3, 1, 3, '2024-04-07 18:26:05', '2024-04-10 07:49:56'),
(4, 1, 3, '2024-04-10 07:53:30', '2024-04-10 07:53:30'),
(5, 1, 3, '2024-04-10 07:53:30', '2024-04-10 07:53:30'),
(6, 1, 3, '2024-04-10 08:00:44', '2024-04-10 08:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_category` int NOT NULL,
  `id_brand` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `imagen` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `description` longtext NOT NULL,
  `specifications` longtext NOT NULL,
  `dimensions` longtext,
  `stock` int NOT NULL,
  `price` double NOT NULL,
  `discount` double DEFAULT '0',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `product-cat_category` (`id_category`),
  KEY `product-cat_brand` (`id_brand`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `product`
--

INSERT INTO `product` (`id`, `id_category`, `id_brand`, `name`, `imagen`, `description`, `specifications`, `dimensions`, `stock`, `price`, `discount`, `status`, `created_at`, `last_update`) VALUES
(9, 1, 1, 'Moleskine Classic Notebook', '/assets/products/661698c5bad535.54883267.png', 'Cuaderno clásico con tapa dura y papel libre ', 'Papel marfil de 70 g/m², cinta marcapáginas, ', '130 x 210 mm', 1, 40, 0, 1, '0000-00-00 00:00:00', '2024-04-10 14:49:02'),
(12, 3, 1, 'H2 Escritorio', '/assets/products/661698956082b9.62146330.png', 'Escritorio con superficie de melamina y patas', 'Superficie de 120 x 60 cm, altura ajustable, ', '', 1, 20, 0, 1, '0000-00-00 00:00:00', '2024-04-10 14:49:48'),
(18, 2, 1, 'SCRIBE Marcador Permanente jeje2', '/assets/products/6616fc5e9f47b2.63868790.jpeg', 'Marcador permanente con tinta resistente al a', 'Punta fina, tinta a base de alcohol, 12 color', '', 1, 30, 0, 1, '0000-00-00 00:00:00', '2024-04-10 14:53:50'),
(22, 2, 1, 'Pc gamer', '/assets/products/6616fab8d7b741.86212079.jpeg', 'Pc gamer con gatito', 'Pc gamer con gatito enojado', '', 15, 50.99, 0, 1, '2024-04-03 20:14:42', '2024-04-10 14:46:48'),
(25, 3, 8, 'Silla Operativa Volt H5725HT Tela Confetti Azul', '/assets/products/660dbed895e523.53476687.png', 'De elementos ligeros y formas sencillas la linea Volt es la solucion ideal para aprovechar al maximo los espacios reducidos con practicas y funcionales configuraciones que se distinguen por la calidad de sus componentes', 'Mecánimos neumatico con ajuste de altura', 'Alto 130 cm, Ancho 65 cm, Fondo 20 cm', 10, 6470, 0, 1, '2024-04-03 20:40:56', '2024-04-03 20:40:56'),
(58, 2, 1, 'AD<VSD', '/assets/products/661465cc8b8695.86525612.jpg', 'SDV', 'advfsdv', '<SDVadv', 12, 132, 0, 1, '2024-04-08 15:46:52', '2024-04-08 15:46:52'),
(64, 3, 8, 'Silla Operativa Volt H5725HT Tela Confetti Azul', '/assets/products/660dbed895e523.53476687.png', 'De elementos ligeros y formas sencillas la linea Volt es la solucion ideal para aprovechar al maximo los espacios reducidos con practicas y funcionales configuraciones que se distinguen por la calidad de sus componentes', 'Mecánimos neumatico con ajuste de altura', 'Alto 130 cm, Ancho 65 cm, Fondo 20 cm', 10, 6470, 0, 1, '2024-04-03 20:40:56', '2024-04-03 20:40:56'),
(65, 3, 1, 'NAPA 30D DESK PEDESTAL BOX BOXFILE', '/assets/products/660dcf44d7c758.58121196.jpg', 'Mueble de madera altamente fina adecuado para oficinas ', 'Soporta un gran peso', '3228 largo x 3031 ancho x 1772 alto', 5, 9000, 0, 1, '2024-04-03 21:51:00', '2024-04-03 21:51:00'),
(66, 3, 1, 'Ashley Furniture Signature Design - Chadton Accent', '/assets/products/660dd1646b60c9.52764635.jpg', 'Mesa de acento moderna. Dos tonos cubiera blanca y base dorada.', 'Mesa de centro', '45 cm  x 45 cm x 51 cm', 7, 1200, 0, 1, '2024-04-03 22:00:04', '2024-04-03 22:00:04'),
(67, 3, 1, 'Steelcase Series 1 Office Chair Carpet Casters G', '/assets/products/660dd737c50918.42909737.jpg', 'La malla trasera y la tela del asiento Connect son 100% poliester. Ruedas para suelos duros. Silla ergonómica - Este modelo incluye una profundidad de asiento ajustable, brazos totalmente ajustables, lumbares ajustables, ajuste de altura del asiento neumático, ajuste de tensión reclinable respaldo flexible con tapicería de malla y asiento tapizado.', 'Silla ergonomica ', 'Alto 130 cm, Ancho 65 cm, Fondo 20 cm', 3, 15000, 0, 1, '2024-04-03 22:24:55', '2024-04-03 22:24:55'),
(68, 3, 12, 'Silla de Malla para Trabajo', '/assets/products/660dd8a5c291b6.26328972.png', 'Diseño de última tecnología. Tela de malla ventilada lo mantiene fresco y cómodo. Asiento de 3 1/2\" de grosor. Inclinación estándar con tensión ajustable. Descansabrazos fijos', 'Silla ergonomica ', 'Alto 120 cm, Ancho 60 cm, ', 4, 4000, 0, 1, '2024-04-03 22:31:01', '2024-04-03 22:31:01'),
(69, 1, 13, '3M Post-it Notas Adhesivas Super Sticky Ultra', '/assets/products/660dd94d66c986.52058465.jpg', 'OTAS ADHESIVAS. Las Notas Super Adhesivas Colección Shot de Energía de Post-it cuentan con un adhesivo doblemente fuerte, lo que les permite poder quedarse adheridas en superficies verticales tales como paredes, puertas o ventanas.', '', '7,6cm x 7,6 cm', 9, 125, 0, 1, '2024-04-03 22:33:49', '2024-04-10 07:53:30'),
(70, 1, 14, 'Five Star Cuaderno Profesional 200 hojas', '/assets/products/660dda1036b508.82861041.jpg', 'El cuaderno negro de 5 sujetos contiene 200 hojas con normas universitarias que son resistentes al sangrado de tinta', '', '11 x 10 x 1.5 pulgadas ', 10, 195, 0, 1, '2024-04-03 22:37:04', '2024-04-03 22:37:04'),
(71, 1, 15, 'BIC, Bolígrafo de Punto Mediano, Pluma Clásica, ', '/assets/products/660ddaebbde289.17176426.jpg', 'BIC CRISTAL DURA MÁS. El bolígrafo Cristal es el producto más reconocido a nivel mundial y el favorito de muchos por su clásica silueta. Las plumas BIC están creadas para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina.', '', '1cm x 1cm ', 20, 60, 0, 1, '2024-04-03 22:40:43', '2024-04-03 22:40:43'),
(72, 1, 16, 'Faber-Castell - Colores Faber Castell Hexagonales ', '/assets/products/660ddb9e155fc1.56671915.jpg', 'Fabricado con material resistente y duradero Facil de usar Marca', '', '1cm x 1cm ', 3, 620, 0, 1, '2024-04-03 22:43:42', '2024-04-03 22:43:42'),
(73, 3, 8, ' Ignition Silla de Malla - Roja', '/assets/products/660ddc6aeaf2e4.59516473.png', 'Asiento duradero de espuma moldeada y tela resistente a las manchas. Descansabrazos acojinados con botón para ajustar la altura', 'Asiento de 3 1/2\" de grosor y respaldo amplio.', 'Alto 120 cm, Ancho 60 cm', 5, 14700, 0, 1, '2024-04-03 22:47:06', '2024-04-03 22:47:06'),
(74, 3, 9, 'Escritorio de Oficina con Doble Pedestal', '/assets/products/660ddd8772ac29.69711258.png', 'Elegante cubierta laminada resiste rayones, manchas y derrames. 2 ojales para cables. Altura de 30\".', '', '180 cm x 160 cm ', 3, 22000, 0, 1, '2024-04-03 22:51:51', '2024-04-03 22:51:51'),
(75, 3, 10, 'Silla Giratoria para Oficina ', '/assets/products/660ddde7e7e703.91708945.jpg', 'Silla de computadora giratoria: disfruta de comodidad y estilo enrollado en uno. Esta silla giratoria es ideal para trabajar en computadora, jugar o para el tiempo de estudio. Fabricado con todo el apoyo adecuado y un estilo elegante.', '', 'Alto 120 cm, Ancho 60 cm, ', 4, 2753, 0, 1, '2024-04-03 22:53:27', '2024-04-10 07:53:30'),
(76, 3, 11, 'Steelcase Work Chair Office Blue ', '/assets/products/660dde914c7b77.47701537.jpg', 'El respaldo de la Serie 1 cuenta con la tecnología LiveBack integrada. Los flexores interdependientes se doblan y se mueven con el usuario para sostener la columna durante todo el día. Las suaves tapas curvadas para los brazos mantienen el soporte del antebrazo y permanecen cómodas ya sea sentado erguido o reclinado.', '', 'Alto 130 cm Ancho 65 ', 4, 17400, 0, 1, '2024-04-03 22:56:17', '2024-04-03 22:56:17'),
(77, 1, 13, '700 Piezas Notas Adhesivas, Índices 3 Tamaños', '/assets/products/660ddf5dcd0321.27425069.jpg', 'Etiquetas de Codificación de 7 Colores - Pestañas de índice Ilamativas, Buena para Resaltar el Punto Clave o Código de Colores de Su Trabajo, Para que Pueda Recuperar Rápida y Fácilmente Información.', '', '1 set de 1.0 x 1.8 P, 3 sets de 0.5 x 1.7 ', 9, 150, 0, 1, '2024-04-03 22:59:41', '2024-04-03 22:59:41'),
(78, 1, 13, '3M Post-it Notas Adhesivas', '/assets/products/660ddfea98c5a9.63616466.jpg', 'Las Notas Post-it fueron especialmente diseñadas para dejar mensajes coloridos y divertidos', '', '7,6cm x 7,6 cm', 12, 115, 0, 1, '2024-04-03 23:02:02', '2024-04-03 23:02:02'),
(79, 4, 14, 'Five Star - Organizador de archivos', '/assets/products/660de18295bc48.96458532.jpg', 'El diseño 7-Pocket le permite ordenar y organizar fácilmente con espacio para todo. Las inserciones de tabulación coloreadas lo ayudan a codificar con color dentro del archivo. Las pestañas patentadas de recordatorio de levantamiento facilitan el acceso a los documentos.', '', '11 x 8 pulgadas ', 6, 394, 0, 1, '2024-04-03 23:08:50', '2024-04-03 23:08:50'),
(80, 4, 14, 'Five Star cuaderno de espiral, 5 materias', '/assets/products/660de1d837e577.40573748.jpg', 'El cuaderno de 5 materias contiene 200 hojas rayadas universitarias, que son resistentes a la decoloración de la tinta, 4 separadores, cada uno con 2 bolsillos, para guardar notas tamaño carta y folletos. Los separadores ayudan a mantenerte organizado y están reforzados para evitar que se rompan.', '', '27.9 cm x 21.5 cm ', 8, 250, 0, 1, '2024-04-03 23:10:16', '2024-04-03 23:10:16'),
(81, 4, 15, 'Cinta Correctora 4.2 mm Fácil de Aplicar', '/assets/products/660de2597fdc13.04239519.jpg', 'BIC CORRECTORES. Los correctores de BIC son perfectos para corregir con precisión cualquier detalle. Están creados para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina.', '', '6 cm x 3 cm', 6, 200, 0, 1, '2024-04-03 23:12:25', '2024-04-03 23:12:25'),
(82, 4, 15, 'BIC, Lápices de Punta Resistente, Lápiz de Grafito', '/assets/products/660de2faab0bd0.81592896.jpg', 'BIC LÁPICES. Los lápices de BIC están creados para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina. Son perfectos para anotar y escribir cómodamente.', '', '1cm x 1cm ', 20, 30, 0, 1, '2024-04-03 23:15:06', '2024-04-03 23:15:06'),
(83, 4, 16, 'Faber-Castell Juego Pitt Graphite Matt Lata', '/assets/products/660de3c702bfc4.06325691.jpg', 'Lápices de grafito mate: crea arte de grafito sin el deslumbramiento. A diferencia de otros lápices de grafito que tienen un diseño brillante, los lápices Faber-Castell Graphite Matte reducen el reflejo en el papel, lo que permite la mayor densidad de valor tonal para un efecto de profundidad máximo', '', '1 cm x cm ', 6, 500, 0, 1, '2024-04-03 23:18:31', '2024-04-03 23:18:31'),
(84, 1, 2, 'Panel de EDTeam', '/assets/products/660df0d9c60892.38476139.png', 'Panel de EDTeam', 'Panel de EDTeam', '', 10, 1200, 0, 1, '2024-04-04 00:14:17', '2024-04-04 00:14:17'),
(85, 2, 2, 'Hub multipuerto USB-C universal HP', '/assets/products/660eda05882135.41713192.jpg', 'Un hub que lo hace todo', '7 puertos y 1 cable de alimentación', '20 cm', 3, 1649, 0, 1, '2024-04-04 16:49:09', '2024-04-04 16:49:09'),
(86, 2, 2, 'Unidad HP Externa USB DVDRW', '/assets/products/660edc86d724e9.06243239.png', 'Conecte el HP External USB DVD/RW a cualquier puerto USB disponible en su PC[1] para obtener acceso de lectura/escritura', 'USB DVD/RW a cualquier puerto USB ', '20 cm', 3, 1409, 0, 1, '2024-04-04 16:59:50', '2024-04-04 16:59:50'),
(87, 2, 2, 'Webcam Full HD HP 320', '/assets/products/660ede62871ba3.43284823.png', 'Únase a una llamada con facilidad al instante y luzca y suene de manera excelente. Simplemente conecte esta webcam FHD 1080p[3] todo en una y de gran angular, y deje que la cámara haga el resto.', 'Sumérjase en Full HD 1080p[3] con un micrófono int', '20 cm', 3, 799, 0, 1, '2024-04-04 17:07:46', '2024-04-04 17:07:46'),
(88, 2, 4, 'Cámara Canon Mirrorless', '/assets/products/660edf9b3f6bc5.29914000.png', 'La tecnología de la EOS R se combina con el diseño APS-C para ofrecer una cámara mirrorless híbrida pequeña, rápida y potente.', 'Calidad de video :4K UHD Fine (30p)/4K UHD (60p)/4', '25 cm', 4, 40000, 0, 1, '2024-04-04 17:12:59', '2024-04-04 17:12:59'),
(89, 2, 4, 'Multifuncional Canon ImageCLASS MF264dw II', '/assets/products/660ee02c5d28b8.58771150.png', 'Diseñado para entornos de oficina pequeños, donde se necesita un equipo con capacidad todo en uno en blanco y negro. La productividad, facilidad de uso, gran capacidad de tóner y papel, son prioridades.', 'Memoria de Impresión :256 MB compartida con copia', ' Impresora: 15.4” x 15.9” x 14.8” ', 5, 6000, 0, 1, '2024-04-04 17:15:24', '2024-04-04 17:15:24'),
(90, 2, 4, 'Cámara Canon Powershot V10', '/assets/products/660ee0a7484857.46877476.png', 'La PowerShot V10 es una cámara de vlogs y fotografías con un tamaño pequeño para ser portátil, con componentes de la popular línea G que te permitirá crear videos impresionantes sobre la marcha.', 'La lente de 19 mm (equivalente a 35 mm)', '', 4, 7999, 0, 1, '2024-04-04 17:17:27', '2024-04-04 17:17:27'),
(91, 2, 5, 'Audífonos inalámbricos LinkBuds S x Olivia Rodrigo', '/assets/products/660ee176110c90.41106438.png', 'No te desconectes con los audífonos inalámbricos LinkBuds S de Sony. Los LinkBuds S tienen optimización del sonido ambiente y noise cancelling, además de ser pequeños y ligeros para llevarlos cómodamente todo el día.', 'Están siempre activos para conectar tus mundos.', '', 5, 5713, 0, 1, '2024-04-04 17:20:54', '2024-04-04 17:20:54'),
(92, 2, 5, 'SRS-XV900 Bocinas inalámbricas de alta potencia', '/assets/products/660ee1ddae7fb3.34300382.png', 'El nuevo XV900, con la mayor presión sonora de la gama de altavoces inalámbricos de Sony y una enorme duración de batería de 25 horas, está siempre listo para la fiesta.', 'Sonido de fiesta omnidireccional ', '', 3, 22000, 0, 1, '2024-04-04 17:22:37', '2024-04-04 17:22:37'),
(93, 4, 5, 'Cámara digital con lente intercambiable para vlogg', '/assets/products/660ee295924771.57056387.png', 'La PowerShot V10 es una cámara de vlogs y fotografías con un tamaño pequeño para ser portátil, con componentes de la popular línea G que te permitirá crear videos impresionantes sobre la marcha.', 'Sensor CMOS Exmor™ APS-C de gran tamaño y 24.2 MP', '', 3, 18000, 0, 1, '2024-04-04 17:25:41', '2024-04-04 17:25:41'),
(94, 4, 5, 'Audífonos inalámbricos con noise cancelling WH-100', '/assets/products/660ee2f2be2904.75916633.png', 'Los intuitivos e inteligentes audífonos WH-1000XM4 te ofrecen nuevas mejoras en la tecnología de noise cancelling avanzada, una calidad de sonido excepcional y funciones de escucha inteligente que se ajustan al entorno y lo que estés haciendo.', 'Audio inalámbrico de alta calidad con tecnología B', '', 3, 10000, 0, 1, '2024-04-04 17:27:14', '2024-04-04 17:27:14'),
(95, 2, 6, 'Memoria Kingston FURY Renegade Pro DDR5 RDIMM', '/assets/products/660ee3adc92215.68333141.png', 'DIMM registrado ECC para Overclocking', 'Capacidad total: 16GB (1x16GB)', '', 3, 2236, 0, 1, '2024-04-04 17:30:21', '2024-04-04 17:30:21'),
(96, 2, 6, 'Kingston FURY Beast DDR5 RGB Memory', '/assets/products/660ee42cb95726.54831550.png', 'Juega con estilo al personalizar la gama suave e impresionante de efectos de iluminación RGB1 con Kingston FURY CTRL™ o el software del fabricante de la placa madre.', 'Capacidad total: 8GB (1x8GB)', '', 3, 4099, 0, 1, '2024-04-04 17:32:28', '2024-04-04 17:32:28'),
(97, 2, 6, 'NV2 PCIe 4.0 NVMe SSD', '/assets/products/660ee526f392d0.20406424.png', 'El NV2 PCIe 4.0 NVMe SSD de Kingston es una gran solución de almacenamiento de última generación impulsada por un controlador Gen 4x4 NVMe.', 'Rendimiento PCIe NVMe Gen 4x4', '', 4, 1046, 0, 1, '2024-04-04 17:36:38', '2024-04-04 17:36:38'),
(98, 2, 7, 'ÖVERSIDAN', '/assets/products/660ee6335f61b0.57599155.png', 'Iluminación LED p/clóset,con sensor, atenuable gris oscuro', 'Iluminación LED', '46 cm', 4, 499, 0, 1, '2024-04-04 17:41:07', '2024-04-04 17:41:07'),
(99, 2, 7, 'MITTLED', '/assets/products/660ee6b528bc48.14573257.png', 'Bombilla LED, atenuable color aluminio', 'Bombilla LED', '', 3, 299, 0, 1, '2024-04-04 17:43:17', '2024-04-04 17:43:17'),
(100, 2, 7, 'STYRBAR', '/assets/products/660ee6fcd4aca3.21154159.png', 'Control remoto, Inteligente blanco', 'Sensor para el hogar', '', 4, 399, 0, 1, '2024-04-04 17:44:28', '2024-04-04 17:44:28'),
(101, 1, 17, 'Boligrafo Kilometrico 100ST ', '/assets/products/660ee7a17baf93.93806126.png', 'Los Bolígrafos Paper Mate InkJoy Kilométrico 100ST MINI tienen tinta ultra suave que ayuda a tener lineas fluidas de escritura. Vienen disponibles en 10 colores vivos. Tamaño perfecto para que los lleves a cualquier lado.', 'Punta media 10 piezas', '', 4, 60, 0, 1, '2024-04-04 17:47:13', '2024-04-04 17:47:13'),
(102, 1, 17, 'Paper Mate InkJoy Gel ST', '/assets/products/660ee863b673e7.71069436.png', 'Los bolígrafos Paper Mate InkJoy Gel ST son de secado rápido lo que reduce las manchas a la hora de escribir. Ergonómicos, cómodo agarre. Varios colores vivos. Tinta suave.', '14 Piezas', '', 4, 150, 0, 1, '2024-04-04 17:50:27', '2024-04-04 17:50:27'),
(103, 1, 17, 'Lápiz MIRADO de Grafito #2HB', '/assets/products/660ee8bbbe48e7.68872358.png', 'Los lápices de grafito Paper Mate MIRADO cuentan con una mina oscura reforzada y ultra resistente a quebraduras.', ' Con goma 100% de latex.', '', 4, 79, 0, 1, '2024-04-04 17:51:55', '2024-04-04 17:51:55'),
(109, 3, 8, 'Silla Operativa Volt H5725HT Tela Confetti Azul', '/assets/products/660dbed895e523.53476687.png', 'De elementos ligeros y formas sencillas la linea Volt es la solucion ideal para aprovechar al maximo los espacios reducidos con practicas y funcionales configuraciones que se distinguen por la calidad de sus componentes', 'Mecánimos neumatico con ajuste de altura', 'Alto 130 cm, Ancho 65 cm, Fondo 20 cm', 10, 6470, 0, 1, '2024-04-03 20:40:56', '2024-04-03 20:40:56'),
(110, 3, 1, 'NAPA 30D DESK PEDESTAL BOX BOXFILE', '/assets/products/660dcf44d7c758.58121196.jpg', 'Mueble de madera altamente fina adecuado para oficinas ', 'Soporta un gran peso', '3228 largo x 3031 ancho x 1772 alto', 5, 9000, 0, 1, '2024-04-03 21:51:00', '2024-04-03 21:51:00'),
(111, 3, 1, 'Ashley Furniture Signature Design - Chadton Accent', '/assets/products/660dd1646b60c9.52764635.jpg', 'Mesa de acento moderna. Dos tonos cubiera blanca y base dorada.', 'Mesa de centro', '45 cm  x 45 cm x 51 cm', 7, 1200, 0, 1, '2024-04-03 22:00:04', '2024-04-03 22:00:04'),
(112, 3, 1, 'Steelcase Series 1 Office Chair Carpet Casters G', '/assets/products/660dd737c50918.42909737.jpg', 'La malla trasera y la tela del asiento Connect son 100% poliester. Ruedas para suelos duros. Silla ergonómica - Este modelo incluye una profundidad de asiento ajustable, brazos totalmente ajustables, lumbares ajustables, ajuste de altura del asiento neumático, ajuste de tensión reclinable respaldo flexible con tapicería de malla y asiento tapizado.', 'Silla ergonomica ', 'Alto 130 cm, Ancho 65 cm, Fondo 20 cm', 3, 15000, 0, 1, '2024-04-03 22:24:55', '2024-04-03 22:24:55'),
(113, 3, 12, 'Silla de Malla para Trabajo', '/assets/products/660dd8a5c291b6.26328972.png', 'Diseño de última tecnología. Tela de malla ventilada lo mantiene fresco y cómodo. Asiento de 3 1/2\" de grosor. Inclinación estándar con tensión ajustable. Descansabrazos fijos', 'Silla ergonomica ', 'Alto 120 cm, Ancho 60 cm, ', 4, 4000, 0, 1, '2024-04-03 22:31:01', '2024-04-03 22:31:01'),
(114, 1, 13, '3M Post-it Notas Adhesivas Super Sticky Ultra', '/assets/products/660dd94d66c986.52058465.jpg', 'OTAS ADHESIVAS. Las Notas Super Adhesivas Colección Shot de Energía de Post-it cuentan con un adhesivo doblemente fuerte, lo que les permite poder quedarse adheridas en superficies verticales tales como paredes, puertas o ventanas.', '', '7,6cm x 7,6 cm', 10, 125, 0, 1, '2024-04-03 22:33:49', '2024-04-03 22:33:49'),
(115, 1, 14, 'Five Star Cuaderno Profesional 200 hojas', '/assets/products/660dda1036b508.82861041.jpg', 'El cuaderno negro de 5 sujetos contiene 200 hojas con normas universitarias que son resistentes al sangrado de tinta', '', '11 x 10 x 1.5 pulgadas ', 10, 195, 0, 1, '2024-04-03 22:37:04', '2024-04-03 22:37:04'),
(116, 1, 15, 'BIC, Bolígrafo de Punto Mediano, Pluma Clásica, ', '/assets/products/660ddaebbde289.17176426.jpg', 'BIC CRISTAL DURA MÁS. El bolígrafo Cristal es el producto más reconocido a nivel mundial y el favorito de muchos por su clásica silueta. Las plumas BIC están creadas para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina.', '', '1cm x 1cm ', 20, 60, 0, 1, '2024-04-03 22:40:43', '2024-04-03 22:40:43'),
(117, 1, 16, 'Faber-Castell - Colores Faber Castell Hexagonales ', '/assets/products/660ddb9e155fc1.56671915.jpg', 'Fabricado con material resistente y duradero Facil de usar Marca', '', '1cm x 1cm ', 3, 620, 0, 1, '2024-04-03 22:43:42', '2024-04-03 22:43:42'),
(118, 3, 8, ' Ignition Silla de Malla - Roja', '/assets/products/660ddc6aeaf2e4.59516473.png', 'Asiento duradero de espuma moldeada y tela resistente a las manchas. Descansabrazos acojinados con botón para ajustar la altura', 'Asiento de 3 1/2\" de grosor y respaldo amplio.', 'Alto 120 cm, Ancho 60 cm', 5, 14700, 0, 1, '2024-04-03 22:47:06', '2024-04-03 22:47:06'),
(119, 3, 9, 'Escritorio de Oficina con Doble Pedestal', '/assets/products/660ddd8772ac29.69711258.png', 'Elegante cubierta laminada resiste rayones, manchas y derrames. 2 ojales para cables. Altura de 30\".', '', '180 cm x 160 cm ', 3, 22000, 0, 1, '2024-04-03 22:51:51', '2024-04-03 22:51:51'),
(120, 3, 10, 'Silla Giratoria para Oficina ', '/assets/products/660ddde7e7e703.91708945.jpg', 'Silla de computadora giratoria: disfruta de comodidad y estilo enrollado en uno. Esta silla giratoria es ideal para trabajar en computadora, jugar o para el tiempo de estudio. Fabricado con todo el apoyo adecuado y un estilo elegante.', '', 'Alto 120 cm, Ancho 60 cm, ', 7, 2753, 0, 1, '2024-04-03 22:53:27', '2024-04-03 22:53:27'),
(121, 3, 11, 'Steelcase Work Chair Office Blue ', '/assets/products/660dde914c7b77.47701537.jpg', 'El respaldo de la Serie 1 cuenta con la tecnología LiveBack integrada. Los flexores interdependientes se doblan y se mueven con el usuario para sostener la columna durante todo el día. Las suaves tapas curvadas para los brazos mantienen el soporte del antebrazo y permanecen cómodas ya sea sentado erguido o reclinado.', '', 'Alto 130 cm Ancho 65 ', 4, 17400, 0, 1, '2024-04-03 22:56:17', '2024-04-03 22:56:17'),
(122, 1, 13, '700 Piezas Notas Adhesivas, Índices 3 Tamaños', '/assets/products/660ddf5dcd0321.27425069.jpg', 'Etiquetas de Codificación de 7 Colores - Pestañas de índice Ilamativas, Buena para Resaltar el Punto Clave o Código de Colores de Su Trabajo, Para que Pueda Recuperar Rápida y Fácilmente Información.', '', '1 set de 1.0 x 1.8 P, 3 sets de 0.5 x 1.7 ', 9, 150, 0, 1, '2024-04-03 22:59:41', '2024-04-03 22:59:41'),
(123, 1, 13, '3M Post-it Notas Adhesivas', '/assets/products/660ddfea98c5a9.63616466.jpg', 'Las Notas Post-it fueron especialmente diseñadas para dejar mensajes coloridos y divertidos', '', '7,6cm x 7,6 cm', 12, 115, 0, 1, '2024-04-03 23:02:02', '2024-04-03 23:02:02'),
(124, 4, 14, 'Five Star - Organizador de archivos', '/assets/products/660de18295bc48.96458532.jpg', 'El diseño 7-Pocket le permite ordenar y organizar fácilmente con espacio para todo. Las inserciones de tabulación coloreadas lo ayudan a codificar con color dentro del archivo. Las pestañas patentadas de recordatorio de levantamiento facilitan el acceso a los documentos.', '', '11 x 8 pulgadas ', 6, 394, 0, 1, '2024-04-03 23:08:50', '2024-04-03 23:08:50'),
(125, 4, 14, 'Five Star cuaderno de espiral, 5 materias', '/assets/products/660de1d837e577.40573748.jpg', 'El cuaderno de 5 materias contiene 200 hojas rayadas universitarias, que son resistentes a la decoloración de la tinta, 4 separadores, cada uno con 2 bolsillos, para guardar notas tamaño carta y folletos. Los separadores ayudan a mantenerte organizado y están reforzados para evitar que se rompan.', '', '27.9 cm x 21.5 cm ', 8, 250, 0, 1, '2024-04-03 23:10:16', '2024-04-03 23:10:16'),
(126, 4, 15, 'Cinta Correctora 4.2 mm Fácil de Aplicar', '/assets/products/660de2597fdc13.04239519.jpg', 'BIC CORRECTORES. Los correctores de BIC son perfectos para corregir con precisión cualquier detalle. Están creados para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina.', '', '6 cm x 3 cm', 6, 200, 0, 1, '2024-04-03 23:12:25', '2024-04-03 23:12:25'),
(127, 4, 15, 'BIC, Lápices de Punta Resistente, Lápiz de Grafito', '/assets/products/660de2faab0bd0.81592896.jpg', 'BIC LÁPICES. Los lápices de BIC están creados para satisfacer las necesidades del consumidor en la escuela, el hogar y la oficina. Son perfectos para anotar y escribir cómodamente.', '', '1cm x 1cm ', 20, 30, 0, 1, '2024-04-03 23:15:06', '2024-04-03 23:15:06'),
(128, 4, 16, 'Faber-Castell Juego Pitt Graphite Matt Lata', '/assets/products/660de3c702bfc4.06325691.jpg', 'Lápices de grafito mate: crea arte de grafito sin el deslumbramiento. A diferencia de otros lápices de grafito que tienen un diseño brillante, los lápices Faber-Castell Graphite Matte reducen el reflejo en el papel, lo que permite la mayor densidad de valor tonal para un efecto de profundidad máximo', '', '1 cm x cm ', 6, 500, 0, 1, '2024-04-03 23:18:31', '2024-04-03 23:18:31'),
(129, 1, 2, 'Panel de EDTeam', '/assets/products/660df0d9c60892.38476139.png', 'Panel de EDTeam', 'Panel de EDTeam', '', 10, 1200, 0, 1, '2024-04-04 00:14:17', '2024-04-04 00:14:17'),
(130, 2, 2, 'Hub multipuerto USB-C universal HP', '/assets/products/660eda05882135.41713192.jpg', 'Un hub que lo hace todo', '7 puertos y 1 cable de alimentación', '20 cm', 3, 1649, 0, 1, '2024-04-04 16:49:09', '2024-04-04 16:49:09'),
(131, 2, 2, 'Unidad HP Externa USB DVDRW', '/assets/products/660edc86d724e9.06243239.png', 'Conecte el HP External USB DVD/RW a cualquier puerto USB disponible en su PC[1] para obtener acceso de lectura/escritura', 'USB DVD/RW a cualquier puerto USB ', '20 cm', 3, 1409, 0, 1, '2024-04-04 16:59:50', '2024-04-04 16:59:50'),
(132, 2, 2, 'Webcam Full HD HP 320', '/assets/products/660ede62871ba3.43284823.png', 'Únase a una llamada con facilidad al instante y luzca y suene de manera excelente. Simplemente conecte esta webcam FHD 1080p[3] todo en una y de gran angular, y deje que la cámara haga el resto.', 'Sumérjase en Full HD 1080p[3] con un micrófono int', '20 cm', 3, 799, 0, 1, '2024-04-04 17:07:46', '2024-04-04 17:07:46'),
(133, 2, 4, 'Cámara Canon Mirrorless', '/assets/products/660edf9b3f6bc5.29914000.png', 'La tecnología de la EOS R se combina con el diseño APS-C para ofrecer una cámara mirrorless híbrida pequeña, rápida y potente.', 'Calidad de video :4K UHD Fine (30p)/4K UHD (60p)/4', '25 cm', 2, 40000, 0, 1, '2024-04-04 17:12:59', '2024-04-10 08:00:44'),
(134, 2, 4, 'Multifuncional Canon ImageCLASS MF264dw II', '/assets/products/660ee02c5d28b8.58771150.png', 'Diseñado para entornos de oficina pequeños, donde se necesita un equipo con capacidad todo en uno en blanco y negro. La productividad, facilidad de uso, gran capacidad de tóner y papel, son prioridades.', 'Memoria de Impresión :256 MB compartida con copia', ' Impresora: 15.4” x 15.9” x 14.8” ', 5, 6000, 0, 1, '2024-04-04 17:15:24', '2024-04-04 17:15:24'),
(135, 2, 4, 'Cámara Canon Powershot V10', '/assets/products/660ee0a7484857.46877476.png', 'La PowerShot V10 es una cámara de vlogs y fotografías con un tamaño pequeño para ser portátil, con componentes de la popular línea G que te permitirá crear videos impresionantes sobre la marcha.', 'La lente de 19 mm (equivalente a 35 mm)', '', 4, 7999, 0, 1, '2024-04-04 17:17:27', '2024-04-04 17:17:27'),
(136, 2, 5, 'Audífonos inalámbricos LinkBuds S x Olivia Rodrigo', '/assets/products/660ee176110c90.41106438.png', 'No te desconectes con los audífonos inalámbricos LinkBuds S de Sony. Los LinkBuds S tienen optimización del sonido ambiente y noise cancelling, además de ser pequeños y ligeros para llevarlos cómodamente todo el día.', 'Están siempre activos para conectar tus mundos.', '', 5, 5713, 0, 1, '2024-04-04 17:20:54', '2024-04-04 17:20:54'),
(137, 2, 5, 'SRS-XV900 Bocinas inalámbricas de alta potencia', '/assets/products/660ee1ddae7fb3.34300382.png', 'El nuevo XV900, con la mayor presión sonora de la gama de altavoces inalámbricos de Sony y una enorme duración de batería de 25 horas, está siempre listo para la fiesta.', 'Sonido de fiesta omnidireccional ', '', 3, 22000, 0, 1, '2024-04-04 17:22:37', '2024-04-04 17:22:37'),
(138, 4, 5, 'Cámara digital con lente intercambiable para vlogg', '/assets/products/660ee295924771.57056387.png', 'La PowerShot V10 es una cámara de vlogs y fotografías con un tamaño pequeño para ser portátil, con componentes de la popular línea G que te permitirá crear videos impresionantes sobre la marcha.', 'Sensor CMOS Exmor™ APS-C de gran tamaño y 24.2 MP', '', 3, 18000, 0, 1, '2024-04-04 17:25:41', '2024-04-04 17:25:41'),
(139, 4, 5, 'Audífonos inalámbricos con noise cancelling WH-100', '/assets/products/660ee2f2be2904.75916633.png', 'Los intuitivos e inteligentes audífonos WH-1000XM4 te ofrecen nuevas mejoras en la tecnología de noise cancelling avanzada, una calidad de sonido excepcional y funciones de escucha inteligente que se ajustan al entorno y lo que estés haciendo.', 'Audio inalámbrico de alta calidad con tecnología B', '', 3, 10000, 0, 1, '2024-04-04 17:27:14', '2024-04-04 17:27:14'),
(140, 2, 6, 'Memoria Kingston FURY Renegade Pro DDR5 RDIMM', '/assets/products/660ee3adc92215.68333141.png', 'DIMM registrado ECC para Overclocking', 'Capacidad total: 16GB (1x16GB)', '', 3, 2236, 0, 1, '2024-04-04 17:30:21', '2024-04-04 17:30:21'),
(141, 2, 6, 'Kingston FURY Beast DDR5 RGB Memory', '/assets/products/660ee42cb95726.54831550.png', 'Juega con estilo al personalizar la gama suave e impresionante de efectos de iluminación RGB1 con Kingston FURY CTRL™ o el software del fabricante de la placa madre.', 'Capacidad total: 8GB (1x8GB)', '', 3, 4099, 0, 1, '2024-04-04 17:32:28', '2024-04-04 17:32:28'),
(142, 2, 6, 'NV2 PCIe 4.0 NVMe SSD', '/assets/products/660ee526f392d0.20406424.png', 'El NV2 PCIe 4.0 NVMe SSD de Kingston es una gran solución de almacenamiento de última generación impulsada por un controlador Gen 4x4 NVMe.', 'Rendimiento PCIe NVMe Gen 4x4', '', 4, 1046, 0, 1, '2024-04-04 17:36:38', '2024-04-04 17:36:38'),
(143, 2, 7, 'ÖVERSIDAN', '/assets/products/660ee6335f61b0.57599155.png', 'Iluminación LED p/clóset,con sensor, atenuable gris oscuro', 'Iluminación LED', '46 cm', 4, 499, 0, 1, '2024-04-04 17:41:07', '2024-04-04 17:41:07'),
(144, 2, 7, 'MITTLED', '/assets/products/660ee6b528bc48.14573257.png', 'Bombilla LED, atenuable color aluminio', 'Bombilla LED', '', 3, 299, 0, 1, '2024-04-04 17:43:17', '2024-04-04 17:43:17'),
(145, 2, 7, 'STYRBAR', '/assets/products/660ee6fcd4aca3.21154159.png', 'Control remoto, Inteligente blanco', 'Sensor para el hogar', '', 4, 399, 0, 1, '2024-04-04 17:44:28', '2024-04-04 17:44:28'),
(146, 1, 17, 'Boligrafo Kilometrico 100ST ', '/assets/products/660ee7a17baf93.93806126.png', 'Los Bolígrafos Paper Mate InkJoy Kilométrico 100ST MINI tienen tinta ultra suave que ayuda a tener lineas fluidas de escritura. Vienen disponibles en 10 colores vivos. Tamaño perfecto para que los lleves a cualquier lado.', 'Punta media 10 piezas', '', 4, 60, 0, 1, '2024-04-04 17:47:13', '2024-04-04 17:47:13'),
(147, 1, 17, 'Paper Mate InkJoy Gel ST', '/assets/products/660ee863b673e7.71069436.png', 'Los bolígrafos Paper Mate InkJoy Gel ST son de secado rápido lo que reduce las manchas a la hora de escribir. Ergonómicos, cómodo agarre. Varios colores vivos. Tinta suave.', '14 Piezas', '', 4, 150, 0, 1, '2024-04-04 17:50:27', '2024-04-04 17:50:27'),
(148, 1, 17, 'Lápiz MIRADO de Grafito #2HB', '/assets/products/660ee8bbbe48e7.68872358.png', 'Los lápices de grafito Paper Mate MIRADO cuentan con una mina oscura reforzada y ultra resistente a quebraduras.', ' Con goma 100% de latex.', '', 4, 79, 0, 1, '2024-04-04 17:51:55', '2024-04-04 17:51:55');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sale`
--

DROP TABLE IF EXISTS `sale`;
CREATE TABLE IF NOT EXISTS `sale` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_user` int NOT NULL,
  `id_product` int NOT NULL,
  `id_payment` int NOT NULL,
  `id_process` int NOT NULL DEFAULT '1',
  `total` double NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `sale-payment` (`id_payment`),
  KEY `sale-user` (`id_user`),
  KEY `sale-product` (`id_product`),
  KEY `sale-history_process_idx` (`id_process`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `sale`
--

INSERT INTO `sale` (`id`, `id_user`, `id_product`, `id_payment`, `id_process`, `total`, `quantity`, `created_at`, `last_update`) VALUES
(1, 2, 9, 1, 1, 40, 1, '2024-04-06 23:08:36', '2024-04-06 23:08:36'),
(2, 2, 12, 2, 2, 20, 1, '2024-04-07 02:11:15', '2024-04-07 02:11:15'),
(3, 2, 18, 3, 3, 30, 1, '2024-04-07 18:26:05', '2024-04-07 18:26:05'),
(4, 2, 75, 4, 4, 8259, 3, '2024-04-10 07:53:30', '2024-04-10 07:53:30'),
(5, 2, 69, 5, 5, 125, 1, '2024-04-10 07:53:30', '2024-04-10 07:53:30'),
(6, 2, 133, 6, 6, 80000, 2, '2024-04-10 08:00:44', '2024-04-10 08:00:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastnameF` varchar(45) NOT NULL,
  `lastnameM` varchar(45) DEFAULT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `id_address` int NOT NULL DEFAULT '1',
  `id_user` int NOT NULL DEFAULT '3',
  `status` int NOT NULL DEFAULT '1',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user-cat_user` (`id_user`),
  KEY `user-address` (`id_address`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `lastnameF`, `lastnameM`, `email`, `password`, `id_address`, `id_user`, `status`, `created_at`, `last_update`) VALUES
(1, 'Geraldin', 'Arenas', 'Hernandez', 'admin@admin.com', 'admin1234', 1, 1, 1, '2024-03-18 21:34:52', '2024-03-18 21:34:52'),
(2, 'Geraldin', 'Arenas', 'Hernandez', 'geraldin@geraldin.com', '1234', 42, 3, 3, '2024-03-18 22:39:53', '2024-04-10 08:00:44'),
(5, 'Alejandro', 'Calderon', 'Aguilar', 'ale@ale.com', '1234', 1, 1, 3, '2024-04-05 22:52:27', '2024-04-05 22:52:27'),
(6, 'Jesus', 'Ajuech', ' Zempoalteca', 'jesus@jesus.com', '1234', 1, 1, 3, '2024-04-07 03:17:42', '2024-04-08 15:52:17'),
(7, 'q', 'q', 'q', 'q@1.1', 'q', 1, 3, 3, '2024-04-08 14:52:06', '2024-04-08 14:53:15'),
(8, 'w', 'w', 'w', 'w@w.w', 'w', 1, 3, 3, '2024-04-08 14:53:32', '2024-04-08 14:53:32');

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart-product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `cart-user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `cat_brand`
--
ALTER TABLE `cat_brand`
  ADD CONSTRAINT `cat_brand-address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`);

--
-- Filtros para la tabla `history_process`
--
ALTER TABLE `history_process`
  ADD CONSTRAINT `history_process-cat_history_process` FOREIGN KEY (`id_process`) REFERENCES `cat_history_process` (`id`);

--
-- Filtros para la tabla `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment-payment_method` FOREIGN KEY (`id_method`) REFERENCES `cat_payment_method` (`id`),
  ADD CONSTRAINT `payment-payment_status` FOREIGN KEY (`id_status`) REFERENCES `cat_payment_status` (`id`);

--
-- Filtros para la tabla `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product-cat_brand` FOREIGN KEY (`id_brand`) REFERENCES `cat_brand` (`id`),
  ADD CONSTRAINT `product-cat_category` FOREIGN KEY (`id_category`) REFERENCES `cat_category` (`id`);

--
-- Filtros para la tabla `sale`
--
ALTER TABLE `sale`
  ADD CONSTRAINT `sale-history_process` FOREIGN KEY (`id_process`) REFERENCES `history_process` (`id`),
  ADD CONSTRAINT `sale-payment` FOREIGN KEY (`id_payment`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `sale-product` FOREIGN KEY (`id_product`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `sale-user` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user-address` FOREIGN KEY (`id_address`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `user-cat_user` FOREIGN KEY (`id_user`) REFERENCES `cat_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
