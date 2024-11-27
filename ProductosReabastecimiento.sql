SELECT 
    p.idProducto AS ProductoID,
    p.nombreProducto AS NombreProducto,
    p.stockDisponible AS StockActual,
    5 AS NivelMinimo, 
    (5 - p.stockDisponible) AS CantidadRequerida 
FROM producto p
WHERE p.stockDisponible < 5 -- filtrar productos con stock menor al nivel minimo
ORDER BY CantidadRequerida DESC;
