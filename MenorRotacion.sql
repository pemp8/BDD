SELECT 
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    SUM(vd.cantidad) AS TotalVendido,
    p.stockDisponible AS StockActual
FROM producto p
LEFT JOIN ventadetalle vd ON p.idProducto = vd.idProducto
LEFT JOIN venta v ON vd.idVenta = v.idVenta
WHERE v.fecha BETWEEN '2023-01-01' AND '2023-12-31' -- reemplazar con fechainicio y fechafin buscadas
GROUP BY p.idProducto, p.nombreProducto, p.stockDisponible
ORDER BY TotalVendido ASC, p.stockDisponible DESC
LIMIT 20; 
