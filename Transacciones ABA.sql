use ABA

--Transaccion para cuando el usuario actualiza sus datos de domicilio
--DOMICILIO ACTUALIZADO
BEGIN TRAN
UPDATE DIRECCIONES
SET 
CodigoPostal = 89604,
EntidadFederativa = 'Tamaulipas',
Municipio = 'Tampico',
Colonia = 'El Heraldo',
Calle = 'Flor de Liz',
Num_Exterior = 783,
Num_Interior = 54
WHERE ID = 506
COMMIT TRAN







--ALTA CONYUGE (Para insertar un nuevo conyuge a la base de datos)
BEGIN TRAN
INSERT INTO CONYUGES
VALUES 
('FHJAKSJANSDASDEDE',
'FBDX021517DGVRETO9', 
'Mujer', 
'Maria', 
'Soledad', 
'Gambillo', 
'Sonora', 
'1995-12-09', 
'SociedadConyugal');
COMMIT TRAN








--BAJA CONYUGE (Para eliminar a un Conyuge por Y o X razon)
BEGIN TRAN
DELETE
FROM CONYUGES
WHERE CURP_Acreditado = 'SADV011318MTSEETA8'
COMMIT TRAN



BEGIN TRANSACTION
UPDATE CONYUGES --Usuario A
SET 
 RegimenPatrimonial = 'BieneSeparados' --Usuario A
 -----

SELECT RegimenPatrimonial --Usuario B

FROM CONYUGES --Usuario B

WAITFOR DELAY '00:00:05' --Espera 5 segundo hasta para poder realizar la consulta

WHERE CURP_Acreditado = 'SAMT051718MTSUOTA8'; --Usuario B

SET 
 RegimenPatrimonial = 'BieneSeparados'; --Usuario A

 WHERE CURP_Acreditado = 'SAMT051718MTSUOTA8'; --Usuario A

COMMIT TRAN 