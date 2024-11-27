SELECT 
    c.idCliente AS ClienteID,
    c.nombreCliente AS NombreCliente,
    v.idVenta AS VentaID,
    v.fecha AS FechaCompra,
    SUM(vd.cantidad) AS CantidadTotalProductos,
    SUM(vd.cantidad * (p.precio - (p.precio * vd.descuento))) AS PrecioFinalTotal
FROM cliente c
JOIN venta v ON c.idCliente = v.idCliente
JOIN ventadetalle vd ON v.idVenta = vd.idVenta
JOIN producto p ON vd.idProducto = p.idProducto
WHERE c.idCliente = 1 -- reemplazar con el idcliente buscado
GROUP BY c.idCliente, c.nombreCliente, v.idVenta, v.fecha
ORDER BY v.fecha DESC;
