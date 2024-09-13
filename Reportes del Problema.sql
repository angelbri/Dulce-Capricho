use pasteleria;
/*
1.Necesitamos calcular el monto total de cada pedido para evaluar el valor total de las ventas realizadas.
*/
SELECT Pedido.idPedido, SUM(Detalle_pedido.Cantidad * Producto.Precio) AS Monto_Total
FROM Pedido
JOIN Detalle_pedido ON Pedido.idPedido = Detalle_pedido.idPedido
JOIN Producto ON Detalle_pedido.idProducto = Producto.idProducto
GROUP BY Pedido.idPedido;

/*
2.Queremos identificar los ingredientes cuyo stock está por debajo de un umbral específico para reabastecerlos.
*/
SELECT Nombre, Cantidad 
FROM Ingrediente 
WHERE Cantidad < 0.50;  
/*
3.Necesitamos listar los pedidos que están en estado pendiente para su seguimiento y procesamiento.
*/
SELECT Pedido.idPedido, Cliente.Nombre, Pedido.Fecha_pedido, Pedido.Fecha_entrega 
FROM Pedido 
JOIN Cliente ON Pedido.idCliente = Cliente.idCliente 
WHERE Pedido.Estado = 'Pendiente';
/*
4.Queremos ver las recetas junto con los ingredientes necesarios para cada una, para gestionar la producción de manera efectiva.
*/
SELECT Receta.Nombre, Ingrediente.Nombre, Receta_ingrediente.cantidad_necesaria 
FROM Receta 
JOIN Receta_ingrediente ON Receta.idReceta = Receta_ingrediente.idReceta 
JOIN Ingrediente ON Receta_ingrediente.idIngrediente = Ingrediente.idIngrediente;
/*
5.Queremos saber qué ingredientes se utilizan en cada receta y la cantidad necesaria para gestionar mejor el inventario y la preparación.
*/
SELECT Receta.Nombre AS Receta, Ingrediente.Nombre AS Ingrediente, Receta_ingrediente.cantidad_necesaria 
FROM Receta_ingrediente
JOIN Receta ON Receta_ingrediente.idReceta = Receta.idReceta
JOIN Ingrediente ON Receta_ingrediente.idIngrediente = Ingrediente.idIngrediente;


