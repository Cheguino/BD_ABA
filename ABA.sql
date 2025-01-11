CREATE DATABASE ABA

USE ABA

CREATE TABLE ACREDITADOS  (
CURP VARCHAR (18) PRIMARY KEY not null,  
Genero VARCHAR (50) not null, 
Nombre VARCHAR(100),
ApellidoPaterno VARCHAR(100) not null, 
ApellidoMaterno VARCHAR(100) not null,
LugarNacimiento VARCHAR(100) not null,
FechaNacimiento DATE not null --YYYY-MM-DD
);

CREATE TABLE CONTACTOS  (
ID INT PRIMARY KEY not null,
TelefonoTrabajo INT, --puede que sea jubilado 
CorreoElectronico VARCHAR(100),
Celular INT not null, 
TelefonoCasa INT not null,
CURP_Acreditado VARCHAR (18) not null, --Foranea de ACREDITADOS

CONSTRAINT fk_CURPacreditado
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE CONYUGES  (
CURP_Conyuge VARCHAR (18) not null,
CURP_Acreditado VARCHAR (18) not null,--llave foranea ACREDITADOS
Genero VARCHAR(50),
Nombre VARCHAR(100),
ApellidoPaterno VARCHAR(100) not null, 
ApellidoMaterno VARCHAR(100) not null,
LugarNacimiento VARCHAR(100) not null,
FechaNacimiento DATE not null, --YYYY-MM-DD
RegimenPatrimonial VARCHAR(100) not null, /*SociedadConyugal/RegimenConyugal/BieneSeparados*/

CONSTRAINT pk_CurpConyuge_FKcurpAcr
  PRIMARY KEY (CURP_Conyuge, CURP_Acreditado),

CONSTRAINT fk_CURP_Acreditado
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE EMPLEOS_ACREDITADOS  (
ID_Empleo INT PRIMARY KEY not null, 
RFC VARCHAR(50) not null,
SueldoBase MONEY not null,
Nombramiento VARCHAR(50),
Sindicato VARCHAR(100) not null,
Ocupacion VARCHAR(100) not null,
Dependencia VARCHAR(100) not null,
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea ACREDITADOS

CONSTRAINT fk_CURP_A_creditado
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE EMPLEOS_CONYUGES  (
ID_Empleo INT PRIMARY KEY not null, 
RFC VARCHAR(50) not null,
SueldoBase MONEY not null,
Nombramiento VARCHAR(50),
Sindicato VARCHAR(100) not null,
Ocupacion VARCHAR(100) not null,
Dependencia VARCHAR(100) not null,
Num_SS VARCHAR(100) not null,
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea CONYUGES

CONSTRAINT fk_CURP_Acredita_do
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE DIRECCIONES  (
ID INT PRIMARY KEY not null, 
CodigoPostal INT not null,
EntidadFederativa VARCHAR (100) not null,
Municipio VARCHAR(100) not null,
Colonia VARCHAR(100) not null,
Calle VARCHAR(100) not null,
Num_Exterior INT not null,
Num_Interior INT,
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea ACREDITADOS

/*CONSTRAINT pk_FKcURPAcr_idEmpleo
  PRIMARY KEY (CURP_Acreditado, ID_Empleo),*/

CONSTRAINT fk_CurpACREditadoDir
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE EXPEDIENTES  (
Num_Solicitud INT PRIMARY KEY not null, 
SOFOM VARCHAR (100)  not null,
Prelacion VARCHAR (100) not null, --No recuerdo tipo de dato (INT¿?)
Estatus VARCHAR(100) not null,/*Protegido/En evalucion/Validacion de CUV/En notaria esperando el GRAVAMEN/Firmado/Pagado*/
CondicionExpediente VARCHAR(100) not null,
ID_Direccion INT not null, --Clave Foranea DIRECCIONES

CONSTRAINT fk_IDirecciones
 FOREIGN KEY (ID_Direccion)
  REFERENCES DIRECCIONES (ID)
);

CREATE TABLE CREDITOS  (
Num_Solicitud INT not null, 
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea ACREDITADOS
LineaCredito VARCHAR (100)  not null, --Individual, Mancomunado, Conyugal
TipoCredito VARCHAR (100) not null, --Adquisicion, Construccion, Redencion de Pasivos
Puntos INT not null,
MontoMaxCredito VARCHAR(100) not null,


CONSTRAINT pk_FKnumeroSolicitud_FKcurpAcred
  PRIMARY KEY (Num_Solicitud, CURP_Acreditado),

CONSTRAINT fk_NumSolicitud
 FOREIGN KEY (Num_Solicitud)
  REFERENCES EXPEDIENTES (Num_Solicitud),

CONSTRAINT fk_CurpAcreditadoCredit
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

DELETE FROM CREDITOS WHERE MontoMaxCredito = 85000;
ALTER TABLE dbo.CREDITOS DROP COLUMN MontoMaxCredito;

CREATE TABLE COTIZACIONES (
ID INT PRIMARY KEY not null,
NumBimestresCotizados INT not null,
CotizaInfonavit VARCHAR (2) not null, -- Si/No
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea ACREDITADOS

CONSTRAINT fk_Curp_COTIZAcreditado
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

CREATE TABLE CARACTERISTICAS_VIVIENDA(
ID_Direccion INT not null, --Clave Foranea DIRECCIONES
CURP_Acreditado VARCHAR (18) not null, --Clave Foranea ACREDITADOS
Modalidad Varchar(5) not null, --Nueva/Usada
Caracteristicas VARCHAR(500),
Especificaciones VARCHAR (500),

CONSTRAINT pk_FKIDireccion_FKcurpAcred
  PRIMARY KEY (ID_Direccion, CURP_Acreditado),

CONSTRAINT fk_DireccionID --DIRECCIONES
 FOREIGN KEY (ID_Direccion)
  REFERENCES DIRECCIONES (ID),

CONSTRAINT fk_CARACurpACReditado
 FOREIGN KEY (CURP_Acreditado)
  REFERENCES ACREDITADOS (CURP)
);

/*Revisar la funcionalidad de la misma, 
verificando con las operaciones básicas: 
altas, 
bajas (borrado), 
modificación (cambios) y 
consultas de datos en la base de datos.*/

INSERT INTO ACREDITADOS
VALUES
('SADV011318MTSEETA8', 'Hombre', 'Gabriel', 'Gonzalez', 'Alvarado', 'Chiapas', '1985-01-12'),
('FBDX021517DGVRETO9', 'Hombre', 'Antonio', 'Martinez', 'Mora', 'Tamaulipas', '1990-03-30'),
('TDLM45388MRSTNWQ2', 'Hombre', 'Jose', 'Sanchez', 'Galindo', 'Veracruz', '1987-07-21'),
('YUDN010727MTSUITA8', 'Mujer', 'Ana', 'Hernandez', 'Sosa', 'Guadalajara', '1978-11-30'),
('KIZC010918MTSAETA5', 'Mujer', 'Maria', 'Vazquez', 'Castillo', 'Tamaulipas', '1989-08-10'),
('SAMT051718MTSUOTA8', 'Mujer', 'Azuzena', 'Garcia', 'Espinoza', 'Tamaulipas', '1995-12-09')

INSERT INTO CONTACTOS
VALUES
(0102, 8331380771,'arcoiris@gmail.com', 8331974623, 8338601565, 'SAMT051718MTSUOTA8'),
(0104, null,'Mariaaaaa@gmail.com', 7711936846, 8338667830, 'KIZC010918MTSAETA5'),
(0106, 7331106183,'a787na@gmail.com', 8330934863, 8339046732, 'YUDN010727MTSUITA8'),
(0108, null,'podhjesse89@gmail.com', 8331762093, 833862145, 'TDLM45388MRSTNWQ2'),
(0110, 7711093485,'mmagg89f23ii@gmail.com', 8334689346, 833866645, 'FBDX021517DGVRETO9'),
(0112, null,'motomoto@gmail.com', 8331567109, 833565545, 'SADV011318MTSEETA8')

ALTER TABLE dbo.CONTACTOS ALTER COLUMN TelefonoTrabajo BIGINT;
ALTER TABLE dbo.CONTACTOS ALTER COLUMN Celular BIGINT;
ALTER TABLE dbo.CONTACTOS ALTER COLUMN TelefonoCasa BIGINT;

ALTER TABLE dbo.ACREDITADOS ALTER COLUMN Nombre VARCHAR (100) not null;

ALTER TABLE dbo.CONYUGES ALTER COLUMN Genero VARCHAR(50) not null;
ALTER TABLE dbo.CONYUGES ALTER COLUMN Nombre VARCHAR (100) not null;

ALTER TABLE dbo.CREDITOS ALTER COLUMN MontoMaxCredito MONEY not null;

ALTER TABLE dbo.CREDITOS 
ADD MontoMaxCredito MONEY null ;


INSERT INTO CONYUGES
VALUES
('ESSM950909SESSASA2','SAMT051718MTSUOTA8', 'Hombre', 'Miguel', 'Escobedo', 'Santiago', 'Guanajuato', '1995-12-09', 'SociedadConyugal'),
('CAOA971031OCSAMSA3','TDLM45388MRSTNWQ2', 'Mujer', 'Amanda', 'Carranza', 'Ostegin', 'Tamaulipas', '1997-10-31', 'RegimenConyugal'),
('LOMB891124MLSBLSA1','SADV011318MTSEETA8', 'Mujer', 'Belinda', 'Lopez', 'Morales', 'Estado de Mexico', '1989-11-24', 'BieneSeparados')

INSERT INTO EMPLEOS_ACREDITADOS
VALUES
(0302, 'FHJY2389', 4799, null, 'CTM', 'Obrero', 'gobierno','SADV011318MTSEETA8'), 
(0304, 'AGLO7245', 10000, null, 'CTC', 'Campesino', 'gobierno','FBDX021517DGVRETO9'),
(0306, 'VNYE0934', 15000, null, 'CROM', 'Obrero', 'gobierno','TDLM45388MRSTNWQ2'),
(0308, 'PODG7834', 20000, null, 'SESAJ', 'Agente Aduanal', 'gobierno','YUDN010727MTSUITA8'),
(0310, 'NUEO4075', 20500, null, 'CTM', 'obrero', 'gobierno','KIZC010918MTSAETA5'),
(0312, 'MLOP0813', 30800, null, 'CTM', 'obrero', 'gobierno','SAMT051718MTSUOTA8')

INSERT INTO  EMPLEOS_CONYUGES
VALUES
(0202, 'HGJL8946', 10000, null, 'CTM', 'Contador', 'Gobierno', '47823637', 'SAMT051718MTSUOTA8'),
(0204, 'QYUO9064', 3800, null, 'CTM', 'Obrero', 'Gobierno', '79024785', 'TDLM45388MRSTNWQ2'),
(0206, 'VBMU012', 13000, null, 'CTM', 'Maestro', 'Gobierno', '28034590', 'SADV011318MTSEETA8')

INSERT INTO DIRECCIONES
VALUES
(0502, 89603, 'Tamaulipas', 'Madero', 'Hermenegildo Galeana', 'Castor Blanco', 855, null, 'SADV011318MTSEETA8'),
(0504, 89603, 'Tamaulipas', 'Madero', 'El palmar', 'Las violetas', 677, null, 'FBDX021517DGVRETO9'),
(0506, 89604, 'Tamaulipas', 'Madero', 'Los castores', 'Castor Azul', 777, null, 'TDLM45388MRSTNWQ2'),
(0508, 89703, 'Tamaulipas', 'Madero', 'Lomas de la Aurora', 'Azucena', 902, null, 'YUDN010727MTSUITA8'),
(0510, 89703, 'Tamaulipas', 'Madero', 'Villas San Pedro', 'Malta', 193, null, 'KIZC010918MTSAETA5'),
(0512, 89903, 'Tamaulipas', 'Madero', 'Colinas del Sol', 'De los Ingenieros', 2876, null, 'SAMT051718MTSUOTA8')

INSERT INTO EXPEDIENTES 
VALUES
(1783, 'ABACAPITAL', '6465', 'Protegido', 'Falta Liquidar', 0502 ),
(1289, 'ABACAPITAL', '5675', 'En evalucion', 'Falta Liquidar', 0504 ),
(1903, 'ABACAPITAL', '5676', 'Validacion de CUV', 'Falta formato pago de cuv', 0506 ),
(1564, 'ABACAPITAL', '8932', 'En notaria esperando el GRAVAMEN', 'Faltante de escritura ', 0508 ),
(1092, 'ABACAPITAL', '9034', 'Firmado', 'Falta Liquidar', 0510 ),
(1578, 'ABACAPITAL', '7845', 'Pagado', 'reporte del notario en el sistema ', 0512 )

INSERT INTO CREDITOS
VALUES
(1783, 'SADV011318MTSEETA8', 'Indivudual', 'Adquisicion', 900, '950000'),
(1289, 'FBDX021517DGVRETO9', 'Mancomunado', 'Construccion', 800, '800000'),
(1903, 'TDLM45388MRSTNWQ2', 'Conyugal', 'Redencion de Pasivos',116 , '75000'),
(1564, 'YUDN010727MTSUITA8', 'Indivudual', 'Adquisicion', 1080, '1000000'),
(1092, 'KIZC010918MTSAETA5', 'Mancomunado', 'Construccion', 500, '85000'),
(1578, 'SAMT051718MTSUOTA8', 'Conyugal', 'Redencion de Pasivos', 700, '100000')



INSERT INTO COTIZACIONES
VALUES 
(0701, 8, 'No', 'SADV011318MTSEETA8'),
(0702, 15, 'Si', 'FBDX021517DGVRETO9'),
(0704, 5, 'No', 'TDLM45388MRSTNWQ2'),
(0706, 6, 'No', 'YUDN010727MTSUITA8'),
(0708, 9, 'Si', 'KIZC010918MTSAETA5'),
(0710, 12, 'Si', 'SAMT051718MTSUOTA8')

INSERT INTO CARACTERISTICAS_VIVIENDA
VALUES 
(0502, 'SADV011318MTSEETA8', 'Nueva', 'Cochera', 'Chimenea'),
(0504, 'FBDX021517DGVRETO9', 'Usada', 'Alberca', '1 Piso'),
(0506, 'TDLM45388MRSTNWQ2', 'Nueva', 'Localizado en Tamaulipas', 'Chimenea'),
(0508, 'YUDN010727MTSUITA8', 'Usada', 'Azotea', '2 pisos'),
(0510, 'KIZC010918MTSAETA5', 'Nueva', 'Cochera', 'Chimenea'),
(0512, 'SAMT051718MTSUOTA8', 'Usada', 'Cochera', 'usada')


SELECT * FROM CARACTERISTICAS_VIVIENDA
SELECT CodigoPostal, EntidadFederativa, Colonia FROM DIRECCIONES
SELECT * FROM ACREDITADOS
 WHERE Genero like 'Hombre'
SELECT * FROM CONTACTOS
 ORDER BY CURP_Acreditado DESC