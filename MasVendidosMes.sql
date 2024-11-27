SELECT 
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    SUM(vd.cantidad) AS CantidadVendida
FROM ventadetalle vd
JOIN producto p ON vd.idProducto = p.idProducto
JOIN venta v ON vd.idVenta = v.idVenta
WHERE MONTH(v.fecha) = 3 -- reemplazar con el mes buscado (1-12)
  AND YEAR(v.fecha) = 2024  -- reemplazar con el año buscado
GROUP BY p.idProducto, p.nombreProducto
ORDER BY CantidadVendida DESC
LIMIT 100;
