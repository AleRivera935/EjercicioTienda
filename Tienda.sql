CREATE DATABASE Tienda;
USE Tienda;

CREATE TABLE AlmacenProducto
  (
    idproducto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255),
    descripcion VARCHAR(255),
    precio DOUBLE
  );
  
DELIMITER //
DROP PROCEDURE p_Insertar;
CREATE PROCEDURE p_Insertar
(
    IN _idproducto INT,
    IN _nombre VARCHAR(255),
    IN _descripcion VARCHAR(255),
    IN _precio DOUBLE
)
BEGIN
    DECLARE existe INT;
    SELECT COUNT(*) INTO existe FROM AlmacenProducto WHERE idproducto = _idproducto;
    IF existe = 0 THEN
    INSERT INTO AlmacenProducto (idproducto, nombre, descripcion, precio)
	 VALUES (_idproducto, _nombre, _descripcion, _precio);
    END IF;
END //
DELIMITER ;
CALL p_Insertar(NULL, 'Principe', 'Galletas de paquete', 18);


DELIMITER //
DROP PROCEDURE p_Eliminar;
CREATE PROCEDURE p_Eliminar
(
    IN _idproducto INT
)
BEGIN
    DELETE FROM AlmacenProducto WHERE idproducto = _idproducto;
END //
DELIMITER ;

CALL p_Eliminar(1);


DELIMITER //
DROP PROCEDURE IF EXISTS p_Modificar;
/
CREATE PROCEDURE p_Modificar
(
    IN _idproducto INT,
    IN _nombre VARCHAR(255),
    IN _descripcion VARCHAR(255),
    IN _precio DOUBLE
)
BEGIN
   UPDATE AlmacenProducto SET nombre = _nombre, descripcion = _descripcion, precio = _precio WHERE idproducto = _idproducto;
END //
DELIMITER ;
CALL p_Modificar(1, 'Principe', 'Galletas de paquete', 20);
