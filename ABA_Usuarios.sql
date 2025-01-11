
--Creacion de los usuarios "Empleado" y "Cliente"

sp_addlogin 'Empleado', 'empleado90$', 'master'

sp_addlogin 'Cliente', 'cliente65#', 'master'




--Asignacion de los usuarios a la base de datos ABA

USE ABA

sp_adduser 'Empleado', 'Empleado' 

sp_adduser 'Cliente', 'Cliente' 




--Asignacion de privilegios a cada uno de los usuarios

--Usuario "Empleado"
GRANT 
SELECT, INSERT, UPDATE, DELETE
ON EXPEDIENTES  TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CREDITOS   TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON DIRECCIONES TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CARACTERISTICAS_VIVIENDA  TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CONYUGES   TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON EMPLEOS_ACREDITADOS TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON COTIZACIONES TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON ACREDITADOS TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CONTACTOS TO Empleado

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON EMPLEOS_CONYUGES TO Empleado





--Usuario Cliente
GRANT 
SELECT
ON EXPEDIENTES TO Cliente

GRANT 
SELECT
ON CREDITOS TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON DIRECCIONES TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CARACTERISTICAS_VIVIENDA TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CONYUGES TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON EMPLEOS_ACREDITADOS TO Cliente

GRANT 
SELECT
ON COTIZACIONES TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON ACREDITADOS TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON CONTACTOS TO Cliente

GRANT 
SELECT, INSERT, UPDATE, DELETE
ON EMPLEOS_CONYUGES TO Cliente


 
 


