/* TRABAJO N°5 MODULO 3
   ====================
   
   INTEGRANTES :
   -------------
   
   - ALEJANDRO ZAMORA
   - MATIAS MARQUES
   - JOSE ALVARADO
   - CARLOS YAÑEZ
   _____________________ */

CREATE DATABASE UserTimes;

CREATE USER 'administrador'@'localhost' IDENTIFIED BY 'contraseña';

GRANT ALL PRIVILEGES ON UserTimes.* TO 'administrador'@'localhost';

FLUSH PRIVILEGES;

USE UserTimes;

CREATE TABLE usuarios (
  id_usuario INT PRIMARY KEY AUTO_INCREMENT,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  contrasena VARCHAR(100) NOT NULL,
  zona_horaria VARCHAR(10) DEFAULT 'UTC-3',
  genero ENUM('M', 'F', 'O') NOT NULL,
  telefono_contacto VARCHAR(15) NOT NULL
);

CREATE TABLE accesos (
  id_ingreso INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  fecha_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

ALTER TABLE usuarios MODIFY zona_horaria VARCHAR(10) DEFAULT 'UTC-2';

INSERT INTO usuarios (nombre, apellido, contrasena, genero, telefono_contacto)
VALUES
  ('Juan', 'Pérez', 'contraseña1', 'M', '123456789'),
  ('María', 'López', 'contraseña2', 'F', '987654321'),
  ('Pedro', 'González', 'contraseña3', 'M', '555555555'),
  ('Ana', 'Martínez', 'contraseña4', 'F', '777777777'),
  ('Luis', 'Rodríguez', 'contraseña5', 'M', '999999999'),
  ('Laura', 'Fernández', 'contraseña6', 'F', '111111111'),
  ('Carlos', 'Sanchez', 'contraseña7', 'M', '222222222'),
  ('Sofía', 'Gómez', 'contraseña8', 'F', '333333333');

INSERT INTO accesos (id_usuario)
VALUES
  (1),
  (2),
  (3),
  (4),
  (5),
  (6),
  (7),
  (8);

CREATE TABLE Contactos (
  id_contacto INT PRIMARY KEY AUTO_INCREMENT,
  id_usuario INT NOT NULL,
  numero_telefono VARCHAR(15),
  correo_electronico VARCHAR(100),
  FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario)
);

ALTER TABLE usuarios MODIFY telefono_contacto VARCHAR(15) UNIQUE;

ALTER TABLE contactos ADD FOREIGN KEY(numero_telefono) REFERENCES usuarios(telefono_contacto);

/* JUSTIFICACION DE TIPOS DE DATOS -------------

id_usuario			:	Utilizamos INT con AUTO_INCREMENT para generar automáticamente
						valores numéricos únicos para cada usuario.
nombre y apellido	:	Utilizamos VARCHAR con una longitud suficientemente grande (50)
						para almacenar los nombres y apellidos de los usuarios.
contraseña			:	Utilizamos VARCHAR con una longitud suficientemente grande (100)
						para almacenar las contraseñas de los usuarios.
zona_horaria		:	Utilizamos VARCHAR(10) para almacenar la zona horaria de los usuarios.
género				:	Utilizamos ENUM para limitar los valores posibles a 'M' (masculino),
						'F' (femenino) y 'O' (otro). Esto proporciona una validación y asegura
                        que solo se ingresen valores válidos.
telefono_contacto	:	Utilizamos VARCHAR(15) para almacenar el número de teléfono de contacto
						de los usuarios. 
fecha_ingreso		: 	Utilizamos DATETIME, para almacenar un valor de tipo
						fecha y hora, y DEFAULT CURRENT_TIMESTAMP para registrar la fecha y hora
                        actual de forma automatica en el momento de crear registro en caso de que
                        no se proporcione un valor.
correo_electronico	: 	Utilizamos VARCHAR con una longitud suficientemente grande (100)
						para almacenar los correos electronicos como dato de contacto de los usuarios.
                        */
                        