-- Crear la base de datos
-- CREATE DATABASE LaIslaDeLasTentaciones;

-- Usar la base de datos
USE LaIslaDeLasTentaciones;

-- Crear tabla de presentadores
CREATE TABLE presentadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Crear tabla de ediciones
CREATE TABLE ediciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    emision DATE NOT NULL,
    id_presentador INT,
    FOREIGN KEY (id_presentador) REFERENCES presentadores(id)
);

-- Crear tabla de concursantes
CREATE TABLE concursantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    id_edicion INT,
    edad INT,
    ciudad_procedencia VARCHAR(255),
    FOREIGN KEY (id_edicion) REFERENCES ediciones(id)
);

-- Crear tabla de episodios
CREATE TABLE episodios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    fecha_emision DATE,
    audiencia decimal(10, 2),
    id_edicion INT,
    FOREIGN KEY (id_edicion) REFERENCES ediciones(id)
);

-- Crear tabla de parejas
CREATE TABLE parejas (
    id_chico INT,
    id_chica INT,
    tiempo_juntos INT,
    decision_final VARCHAR(1) CHECK (decision_final IN ('J', 'S')),
    fecha_decision DATE,
    PRIMARY KEY (id_chico, id_chica),
    FOREIGN KEY (id_chico) REFERENCES concursantes(id),
    FOREIGN KEY (id_chica) REFERENCES concursantes(id)
);

-- Crear tabla de pretendientes
CREATE TABLE pretendientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    sexo VARCHAR(1) NOT NULL CHECK (sexo IN ('M', 'F')),
    id_edicion INT,
    edad INT,
    ciudad_procedencia VARCHAR(255),
    profesion VARCHAR(255),
    fecha_expulsion DATE,
    FOREIGN KEY (id_edicion) REFERENCES ediciones(id)
);

-- Insertar presentadores
INSERT INTO presentadores (nombre) VALUES
('Mónica Naranjo'),
('Sandra Barneda'),
('Carlos Sobera');

-- Insertar ediciones
INSERT INTO ediciones (emision, id_presentador) VALUES
('2020-01-09', (SELECT id FROM presentadores WHERE nombre = 'Mónica Naranjo')),
('2020-09-23', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2021-01-21', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2021-09-15', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2022-09-21', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2023-01-21', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2024-01-09', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda')),
('2025-01-06', (SELECT id FROM presentadores WHERE nombre = 'Sandra Barneda'));



-- Insertar concursantes (ejemplo de la temporada 1)
INSERT INTO concursantes (nombre, sexo, id_edicion, edad, ciudad_procedencia) VALUES
('Álex Bueno', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 27, 'Salamanca'),
('Fiama Rodríguez', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 26, 'Las Palmas'),
('Christofer Guzmán', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 28, 'Madrid'),
('Fani Carbajo', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 34, 'Madrid'),
('Gonzalo Montoya', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 27, 'Sevilla'),
('Susana Molina', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 29, 'Murcia'),
('Ismael Nicolás', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 23, 'Murcia'),
('Andrea Gasca', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 25, 'Barcelona'),
('José Sánchez', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 33, 'Madrid'),
('Adelina Seres', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 27, 'Madrid');

-- Insertar episodios (ejemplo de la temporada 1)
INSERT INTO episodios (fecha_emision, audiencia, id_edicion) VALUES
('2020-01-09', 2978000, (SELECT id FROM ediciones WHERE emision = '2020-01-09')),
('2020-01-14', 2270000, (SELECT id FROM ediciones WHERE emision = '2020-01-09')),
('2020-01-16', 2449000, (SELECT id FROM ediciones WHERE emision = '2020-01-09')),
('2020-01-21', 2772000, (SELECT id FROM ediciones WHERE emision = '2020-01-09')),
('2020-01-23', 3161000, (SELECT id FROM ediciones WHERE emision = '2020-01-09'));

-- Insertar parejas (ejemplo de la temporada 1)
INSERT INTO parejas (id_chico, id_chica, tiempo_juntos, decision_final) VALUES
((SELECT id FROM concursantes WHERE nombre = 'Álex Bueno'), (SELECT id FROM concursantes WHERE nombre = 'Fiama Rodríguez'), 5, 'S'),
((SELECT id FROM concursantes WHERE nombre = 'Christofer Guzmán'), (SELECT id FROM concursantes WHERE nombre = 'Fani Carbajo'), 84, 'J'),
((SELECT id FROM concursantes WHERE nombre = 'Gonzalo Montoya'), (SELECT id FROM concursantes WHERE nombre = 'Susana Molina'), 72, 'S'),
((SELECT id FROM concursantes WHERE nombre = 'Ismael Nicolás'), (SELECT id FROM concursantes WHERE nombre = 'Andrea Gasca'), 18, 'S'),
((SELECT id FROM concursantes WHERE nombre = 'José Sánchez'), (SELECT id FROM concursantes WHERE nombre = 'Adelina Seres'), 8, 'J');

-- Insertar pretendientes (ejemplo de la temporada 1)
INSERT INTO pretendientes (nombre, sexo, id_edicion, edad, ciudad_procedencia, profesion, fecha_expulsion) VALUES
('Joy Jara', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 27, 'Madrid', 'Entrenador fitness', NULL),
('Jusseth Medina', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 25, 'Barcelona', 'Modelo', NULL),
('Lewis Leadbetter', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 25, 'Tenerife', 'Camarero', NULL),
('Óscar Ruiz', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 25, 'Málaga', 'Camarero', NULL),
('Rubén Sánchez', 'M', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 31, 'Madrid', 'Empresario coctelero', NULL),
('Andrea Martínez', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 27, 'Álava', 'Directora creativa', NULL),
('Jenny Martínez', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 31, 'Barcelona', 'Camarera', NULL),
('Katerina Safarova', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 21, 'Barcelona', 'Modelo', NULL),
('Lourdes Figueroa', 'F', (SELECT id FROM ediciones WHERE emision = '2020-01-09'), 30, 'Madrid', 'Encargada de tienda', NULL);

-- Insertar concursantes de la temporada 8
INSERT INTO concursantes (nombre, sexo, id_edicion, edad, ciudad_procedencia) VALUES
('Eros', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 28, 'Palma de Mallorca'),
('Bayan', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 23, 'Palma de Mallorca'),
('Gerard', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 31, NULL),
('Alba', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 21, NULL),
('Montoya', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 30, NULL),
('Anita', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 26, NULL),
('Joel', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 24, NULL),
('Andrea', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 28, NULL),
('Fran', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 28, NULL),
('Ana', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 23, NULL),
('Tadeo', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 31, 'Utrera'),
('Sthefany', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 26, 'Utrera'),
('Álvaro', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL),
('Alba García', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL);

-- Insertar parejas de la temporada 8
INSERT INTO parejas (id_chico, id_chica, tiempo_juntos, decision_final) VALUES
((SELECT id FROM concursantes WHERE nombre = 'Eros' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Bayan' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 48, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Gerard' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Alba' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 12, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Montoya' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Anita' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 NULL, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Joel' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Andrea' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 NULL, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Fran' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Ana' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 NULL, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Tadeo' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Sthefany' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 NULL, NULL),
((SELECT id FROM concursantes WHERE nombre = 'Álvaro' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 (SELECT id FROM concursantes WHERE nombre = 'Alba García' AND id_edicion = (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
 NULL, NULL);

-- Insertar algunos episodios de la temporada 8
INSERT INTO episodios (fecha_emision, audiencia, id_edicion) VALUES
('2025-01-06', NULL, (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
('2025-01-13', NULL, (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
('2025-01-20', NULL, (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
('2025-01-27', NULL, (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
('2025-02-03', NULL, (SELECT id FROM ediciones WHERE emision = '2025-01-06')),
('2025-02-10', 21.4, (SELECT id FROM ediciones WHERE emision = '2025-01-06'));

-- Insertar algunos pretendientes de la temporada 8
INSERT INTO pretendientes (nombre, sexo, id_edicion, edad, ciudad_procedencia, profesion, fecha_expulsion) VALUES
('Kevin', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 22, 'Las Palmas de Gran Canaria', 'Estudiante de Magisterio', NULL),
('Jesús', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), 28, 'Córdoba', 'Montador', NULL),
('Simone', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL, NULL, NULL),
('Borja', 'M', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL, NULL, NULL),
('Mayeli', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL, NULL, NULL),
('Erika', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL, NULL, NULL),
('Gabriela', 'F', (SELECT id FROM ediciones WHERE emision = '2025-01-06'), NULL, NULL, NULL, NULL);
