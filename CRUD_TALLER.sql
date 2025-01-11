USE TALLER
--CREATE / INsert 
--Insert un nuevo cliente
INSERT INTO CLIENTES (ID, Nombre, Apellido, Telefono, RFC )
VALUES 
/*1*/('0D834FC5', 'Alonso', 'Altamirano', '8332540310', 'CAAU803456769')

--READ
--Consulta toda la informacion del cliente con el ID '53772b06'
SELECT * FROM CLIENTES WHERE ID = '53772b06'

--UPDATE
--Con este comando, actualizaremos los datos del Cliente llamado Virginia:
UPDATE CLIENTES SET  
       [Apellido] = 'Vargas',
       [Telefono] = '833279730'
       WHERE Nombre= 'Virginia'

	   SELECT * FROM CLIENTES WHERE Nombre = 'Virginia'



--DELETE
--Borra al cliente cuyo RFC es 'CAPV841211G54'
DELETE FROM ASIGNACIONES WHERE Matricula = '4832RHZ'
