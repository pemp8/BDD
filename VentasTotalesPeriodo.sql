SELECT 
    c.nombreCategoria AS Categoria,
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    SUM(vd.cantidad) AS CantidadVendida,
    SUM(vd.cantidad * (p.precio - (p.precio * vd.descuento))) AS IngresosGenerados
FROM venta v
JOIN ventadetalle vd ON v.idVenta = vd.idVenta
JOIN producto p ON vd.idProducto = p.idProducto
JOIN categoria c ON p.idCategoria = c.idCategoria
WHERE v.fecha BETWEEN '2023-01-01' AND '2023-12-31' -- reemplazar con fechainicio y fechafin buscadas
GROUP BY c.nombreCategoria, p.idProducto, p.nombreProducto
ORDER BY c.nombreCategoria, IngresosGenerados DESC;
