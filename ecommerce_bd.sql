CREATE DATABASE IF NOT EXISTS ecommerce_bd;
USE ecommerce_bd;

-- Tabla de Usuarios
CREATE TABLE IF NOT EXISTS usuario (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  apellido VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  email VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  password VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  admin TINYINT(1) DEFAULT NULL,
  confirmado TINYINT(1) DEFAULT NULL,
  token VARCHAR(15) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Categorías
CREATE TABLE IF NOT EXISTS categoria (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Estados
CREATE TABLE IF NOT EXISTS estado (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Productos
CREATE TABLE IF NOT EXISTS producto (
  id INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  precio DECIMAL(6,2) DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  imagen VARCHAR(60) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  descripcion VARCHAR(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  idCategoria INT DEFAULT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_idCategoria FOREIGN KEY (idCategoria) REFERENCES categoria(id) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Pedidos
CREATE TABLE IF NOT EXISTS pedido (
  id INT NOT NULL AUTO_INCREMENT,
  idUsuario INT DEFAULT NULL,
  referencia VARCHAR(20) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  fecha DATE DEFAULT NULL,
  idEstado INT DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idUsuario (idUsuario),
  KEY idEstado (idEstado),
  CONSTRAINT pedido_ibfk_1 FOREIGN KEY (idUsuario) REFERENCES usuario (id) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT pedido_ibfk_2 FOREIGN KEY (idEstado) REFERENCES estado (id) ON DELETE SET NULL ON UPDATE SET NULL  
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Pedidos-Productos
CREATE TABLE IF NOT EXISTS pedidosproductos (
  id INT NOT NULL AUTO_INCREMENT,
  idPedido INT DEFAULT NULL,
  idProducto INT DEFAULT NULL,
  cantidad INT DEFAULT NULL,
  PRIMARY KEY (id),
  KEY idPedido (idPedido),
  KEY idProducto (idProducto),
  CONSTRAINT pedidosproductos_ibfk_1 FOREIGN KEY (idPedido) REFERENCES pedido (id) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT pedidosproductos_ibfk_2 FOREIGN KEY (idProducto) REFERENCES producto (id) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Tabla de Transacciones
CREATE TABLE IF NOT EXISTS transacciones (
  id INT NOT NULL AUTO_INCREMENT,
  orderID VARCHAR(255) COLLATE utf8mb3_spanish_ci DEFAULT NULL,
  pedidoID INT DEFAULT NULL,
  PRIMARY KEY(id),
  CONSTRAINT pedidoID_ibfk_1 FOREIGN KEY (pedidoID) REFERENCES pedido (id) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_spanish_ci;

-- Inserción de Usuario Administrador Predeterminado
INSERT INTO usuario (nombre, apellido, email, password, admin, confirmado, token)
VALUES ('admin', 'admin', 'admin@admin.com', '$2y$10$M/aK9Isji6kAx60npUrOlebrEhL5gk6DPkTAxeuUbW6/vb4PZxCma', 1, 1, '');