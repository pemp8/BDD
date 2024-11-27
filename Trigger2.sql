DELIMITER $$

CREATE TRIGGER descontarStockVenta
AFTER INSERT ON ventadetalle
FOR EACH ROW
BEGIN
    UPDATE producto
    SET stockDisponible = stockDisponible - NEW.cantidad
    WHERE idProducto = NEW.idProducto;

    -- evitar que el stock sea negativo
    IF (SELECT stockDisponible FROM producto WHERE idProducto = NEW.idProducto) < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Stock insuficiente para realizar la venta';
    END IF;
END$$

DELIMITER ;