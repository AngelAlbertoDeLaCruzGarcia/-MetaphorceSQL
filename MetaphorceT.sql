CREATE DATABASE ecomerce_bd;
USE ecomerce_bd;
CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    sexo CHAR(1) NOT NULL,
    edad INT(3) NOT NULL,
    estado VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);
INSERT INTO clientes(id, nombre, apellidos, sexo, edad, estado, ciudad) VALUES
    (1, 'Oscar', 'Huerta Sánchez', 'M', 25, 'Guanajuato', 'León'),
    (2, 'Octavio', 'Sánchez Ortega', 'M', 30, 'Guanajuato', 'Irapuato'),
    (3, 'Julio', 'Morales Camarena', 'M', 23, 'Jalisco', 'Guadalajara'),
    (4, 'María', 'Diaz Arellano', 'F', 25, 'Michoacán', 'Guadalajara'),
    (5, 'Lorena', 'López Ortiz', 'F', 30, 'Nuevo León', 'Monterrey'),
    (6, 'Fernando', 'Huerta Mireles', 'M', 28, 'Jalisco', 'Lagos de Moreno'),
    (7, 'Casandra', 'Contreras Pérez', 'F', 22, 'Guanajuato', 'León');

##Sentencia que arroje todos los registros con todas sus columnas
SELECT * FROM clientes;

##1)Sentencia que arroje aquellos registros cuyo sexo sea masculino y la edad sea superior a 25
SELECT * FROM clientes WHERE sexo = 'M' AND edad > 25;

##2)Escribir una sentencia que actualice el registro con Id 6 indicando que la Ciudad es San Juan de los
##Lagos y Apellidos Herrera Huerta
UPDATE clientes
SET ciudad = 'San Juan de los Lagos', apellidos = 'Herrera Huerta'
WHERE id = 6;

##3)Escribir una sentencia que arroje aquellas personas que están entre 20 y 29 años y sean sexo
SELECT * FROM clientes WHERE edad between 20 AND 29;

##4) Escribir una sentencia que arroje los registros cuyos Apellidos contienen el apellido "Huerta"
SELECT * FROM clientes WHERE apellidos LIKE '%Huerta%';

##5) Sentencia que arroje el conteo de los registros que están en el estado de Guanajuato.
SELECT COUNT(*) as Registros_Guanajuato FROM clientes WHERE estado = 'Guanajuato';

##6) Escribir una sentencia que inserte un nuevo registro a dicha tabla considerando que todos los
##campos son obligatorios
INSERT INTO clientes(nombre, apellidos, sexo, edad, estado, ciudad) VALUE
    ('Angel', 'Garcia', 'M', 22, 'Hidalgo', 'Huejutla de Reyes');

##Escribir una sentencia que seleccione la cantidad de personas que hay por estado dando como
##resultado la siguiente tabla
SELECT estado, COUNT(estado)
FROM clientes
GROUP BY estado
HAVING COUNT(estado) > 0;

##Escribir una sentencia que consulte las personas que son del sexo Masculino y las ordene de manera
##descendente por su apellido y posteriormente por su Nombre
SELECT * FROM clientes WHERE sexo = 'M' ORDER BY apellidos, nombre DESC