CREATE TABLE `producto` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombreproducto` varchar(100) DEFAULT null,
  `categoriaId` int,
  `stock` int DEFAULT null,
  `detallesproducto` text,
  `precio` decimal(10,2) DEFAULT null,
  `imagenes` text
);

CREATE TABLE `categorias` (
  `categoriaId` int,
  `categoria` varchar(50)
);

CREATE TABLE `carrito` (
  `usuarioId` int,
  `productoId` int,
  `cantidad` int DEFAULT null
);

CREATE TABLE `historialcompras` (
  `usuarioId` int,
  `productoId` int,
  `fechahoracompra` timestamp NOT NULL DEFAULT (current_timestamp),
  `cantidad` int DEFAULT null,
  `preciounitario` decimal(10,2) DEFAULT null
);

CREATE TABLE `informacionenvio` (
  `usuarioId` int PRIMARY KEY,
  `direccion` varchar(255) DEFAULT null,
  `codigopostal` varchar(10) DEFAULT null,
  `ciudad` varchar(100) DEFAULT null,
  `municipio` varchar(100) DEFAULT null,
  `referencias` text
);

CREATE TABLE `metodospago` (
  `ventaId` int PRIMARY KEY,
  `status` int,
  `fecha` date
);

CREATE TABLE `notificaciones` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuarioId` int,
  `mensaje` text,
  `fechahora` timestamp DEFAULT (current_timestamp),
  `estado` int DEFAULT null,
  `productoId` int DEFAULT null
);

CREATE TABLE `preguntasfrecuentes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pregunta` text,
  `respuesta` text
);

CREATE TABLE `usuarios` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT null,
  `apellidomaterno` varchar(50) DEFAULT null,
  `apellidopaterno` varchar(50) DEFAULT null,
  `correoelectronico` varchar(100) DEFAULT null,
  `contraseña` varchar(100) DEFAULT null
);

CREATE TABLE `ventas` (
  `id` int PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `usuarioId` int,
  `productoId` int,
  `fechaventa` date DEFAULT null,
  `cantidadvendida` int DEFAULT null,
  `preciounitario` decimal(10,2) DEFAULT null
);

ALTER TABLE `categorias` ADD FOREIGN KEY (`categoriaId`) REFERENCES `producto` (`categoriaId`);

CREATE TABLE `usuarios_carrito` (
  `usuarios_id` int,
  `carrito_usuarioId` int,
  PRIMARY KEY (`usuarios_id`, `carrito_usuarioId`)
);

ALTER TABLE `usuarios_carrito` ADD FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `usuarios_carrito` ADD FOREIGN KEY (`carrito_usuarioId`) REFERENCES `carrito` (`usuarioId`);


CREATE TABLE `producto_carrito` (
  `producto_id` int,
  `carrito_productoId` int,
  PRIMARY KEY (`producto_id`, `carrito_productoId`)
);

ALTER TABLE `producto_carrito` ADD FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

ALTER TABLE `producto_carrito` ADD FOREIGN KEY (`carrito_productoId`) REFERENCES `carrito` (`productoId`);


CREATE TABLE `usuarios_historialcompras` (
  `usuarios_id` int,
  `historialcompras_usuarioId` int,
  PRIMARY KEY (`usuarios_id`, `historialcompras_usuarioId`)
);

ALTER TABLE `usuarios_historialcompras` ADD FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `usuarios_historialcompras` ADD FOREIGN KEY (`historialcompras_usuarioId`) REFERENCES `historialcompras` (`usuarioId`);


CREATE TABLE `producto_historialcompras` (
  `producto_id` int,
  `historialcompras_productoId` int,
  PRIMARY KEY (`producto_id`, `historialcompras_productoId`)
);

ALTER TABLE `producto_historialcompras` ADD FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

ALTER TABLE `producto_historialcompras` ADD FOREIGN KEY (`historialcompras_productoId`) REFERENCES `historialcompras` (`productoId`);


ALTER TABLE `informacionenvio` ADD FOREIGN KEY (`usuarioId`) REFERENCES `usuarios` (`id`);

CREATE TABLE `ventas_metodospago` (
  `ventas_id` int,
  `metodospago_ventaId` int,
  PRIMARY KEY (`ventas_id`, `metodospago_ventaId`)
);

ALTER TABLE `ventas_metodospago` ADD FOREIGN KEY (`ventas_id`) REFERENCES `ventas` (`id`);

ALTER TABLE `ventas_metodospago` ADD FOREIGN KEY (`metodospago_ventaId`) REFERENCES `metodospago` (`ventaId`);


CREATE TABLE `usuarios_notificaciones` (
  `usuarios_id` int,
  `notificaciones_usuarioId` int,
  PRIMARY KEY (`usuarios_id`, `notificaciones_usuarioId`)
);

ALTER TABLE `usuarios_notificaciones` ADD FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `usuarios_notificaciones` ADD FOREIGN KEY (`notificaciones_usuarioId`) REFERENCES `notificaciones` (`usuarioId`);


CREATE TABLE `usuarios_preguntasfrecuentes` (
  `usuarios_id` int,
  `preguntasfrecuentes_id` int,
  PRIMARY KEY (`usuarios_id`, `preguntasfrecuentes_id`)
);

ALTER TABLE `usuarios_preguntasfrecuentes` ADD FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `usuarios_preguntasfrecuentes` ADD FOREIGN KEY (`preguntasfrecuentes_id`) REFERENCES `preguntasfrecuentes` (`id`);


CREATE TABLE `usuarios_ventas` (
  `usuarios_id` int,
  `ventas_usuarioId` int,
  PRIMARY KEY (`usuarios_id`, `ventas_usuarioId`)
);

ALTER TABLE `usuarios_ventas` ADD FOREIGN KEY (`usuarios_id`) REFERENCES `usuarios` (`id`);

ALTER TABLE `usuarios_ventas` ADD FOREIGN KEY (`ventas_usuarioId`) REFERENCES `ventas` (`usuarioId`);


CREATE TABLE `producto_ventas` (
  `producto_id` int,
  `ventas_productoId` int,
  PRIMARY KEY (`producto_id`, `ventas_productoId`)
);

ALTER TABLE `producto_ventas` ADD FOREIGN KEY (`producto_id`) REFERENCES `producto` (`id`);

ALTER TABLE `producto_ventas` ADD FOREIGN KEY (`ventas_productoId`) REFERENCES `ventas` (`productoId`);

