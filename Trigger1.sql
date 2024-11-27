DELIMITER $$

CREATE TRIGGER actualizarStockProducto
AFTER INSERT ON proveedordetalle
FOR EACH ROW
BEGIN
    UPDATE producto
    SET stockDisponible = stockDisponible + NEW.stockProveido
    WHERE idProducto = NEW.idProducto;
END$$

DELIMITER ;