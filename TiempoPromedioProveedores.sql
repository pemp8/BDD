SELECT 
    pd.idProveedor AS ProveedorID,
    p.nombreProveedor AS NombreProveedor,
    AVG(pd.plazoDeEntrega) AS TiempoPromedioEntrega
FROM proveedordetalle pd
JOIN proveedor p ON pd.idProveedor = p.idProveedor
GROUP BY pd.idProveedor, p.nombreProveedor;
