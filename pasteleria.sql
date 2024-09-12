CREATE DATABASE IF NOT EXISTS pasteleria;
USE pasteleria;

-- Tabla Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Dirección VARCHAR(45),
    Teléfono VARCHAR(45),
    Email VARCHAR(45),
    Pedido_idPedido INT,
    FOREIGN KEY (Pedido_idPedido) REFERENCES Pedido(idPedido)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    id_Empleados INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Dirección VARCHAR(45),
    Teléfono VARCHAR(45)
);

-- Tabla Receta
CREATE TABLE Receta (
    idReceta INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Descripción VARCHAR(45),
    Tiempo_preparación INT
);

-- Tabla Ingrediente
CREATE TABLE Ingrediente (
    idIngrediente INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Cantidad DECIMAL(10, 2),
    Unidad_medida VARCHAR(45)
);

-- Tabla Producto
CREATE TABLE Producto (
    idProducto INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(45),
    Descripción VARCHAR(45),
    Precio DECIMAL(10, 2),
    Stock INT,
    Receta_idReceta INT,
    FOREIGN KEY (Receta_idReceta) REFERENCES Receta(idReceta)
);

-- Tabla Receta_ingrediente (Relación entre Receta e Ingrediente)
CREATE TABLE Receta_ingrediente (
    idReceta INT,
    idIngrediente INT,
    cantidad_necesaria DECIMAL(10, 2),
    PRIMARY KEY (idReceta, idIngrediente),
    FOREIGN KEY (idReceta) REFERENCES Receta(idReceta),
    FOREIGN KEY (idIngrediente) REFERENCES Ingrediente(idIngrediente)
);

-- Tabla Pedido
CREATE TABLE Pedido (
    idPedido INT AUTO_INCREMENT PRIMARY KEY,
    Fecha_pedido DATE,
    Fecha_entrega DATE,
    Estado VARCHAR(45),
    idCliente INT,
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

-- Tabla Detalle_pedido (Relación entre Pedido y Producto)
CREATE TABLE Detalle_pedido (
    idDetalle INT AUTO_INCREMENT PRIMARY KEY,
    idPedido INT,
    idProducto INT,
    Cantidad INT,
    FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    FOREIGN KEY (idProducto) REFERENCES Producto(idProducto)
);
