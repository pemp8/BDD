SELECT 
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    SUM(vd.cantidad) AS CantidadComprada
FROM cliente c
JOIN venta v ON c.idCliente = v.idCliente
JOIN ventadetalle vd ON v.idVenta = vd.idVenta
JOIN producto p ON vd.idProducto = p.idProducto
WHERE c.idCliente = 1 -- reemplazar con el idcliente buscado
  AND v.fecha BETWEEN '2023-01-01' AND '2023-12-31' -- reemplazar con las fechasinicio y fechafin buscadas 
GROUP BY p.idProducto, p.nombreProducto
ORDER BY CantidadComprada DESC
LIMIT 10;
