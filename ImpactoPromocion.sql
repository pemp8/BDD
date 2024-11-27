SELECT 
    CASE
        WHEN v.fecha < pr.fechaInicio THEN 'antes de la promocion'
        WHEN v.fecha BETWEEN pr.fechaInicio AND pr.fechaFin THEN 'durante la promocion'
        ELSE 'despues de la promocion'
    END AS Periodo,
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    COUNT(vd.idVenta) AS TotalVentas,
    SUM(vd.cantidad) AS CantidadVendida,
    SUM(vd.cantidad * (p.precio - (p.precio * vd.descuento))) AS IngresosGenerados
FROM promocion pr
JOIN promociondetalle pd ON pr.idPromocion = pd.idPromocion
JOIN producto p ON pd.idProducto = p.idProducto
JOIN ventadetalle vd ON vd.idProducto = p.idProducto
JOIN venta v ON v.idVenta = vd.idVenta
WHERE pr.idPromocion = 93 -- reemplazar con idpromocion buscada (con los datos de la bdd solo se aplico la promocion 93 en el producto 22, pq por las fechas fue la unica que estaba vigente al poblar ventadetalle)
  AND p.idProducto = 22   -- reemplazar con idproducto buscado
GROUP BY Periodo, p.idProducto, p.nombreProducto
ORDER BY FIELD(Periodo, 'Antes de la promocion', 'Durante la promocion', 'Despues de la promocion');
