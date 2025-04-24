CREATE TABLE equipos (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(50)
);

CREATE TABLE jugadores (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    nombre_completo VARCHAR(100),
    pais VARCHAR(50)
);

CREATE TABLE torneos (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha date NOT NULL,
    sede VARCHAR(100)
);

CREATE TABLE puestos (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT,
    id_torneo INT,
    puesto INT,
    FOREIGN KEY (id_equipo) REFERENCES equipos(id_equipo),
    FOREIGN KEY (id_torneo) REFERENCES torneos(id_torneo)
);

CREATE TABLE jugadores_equipos (
    id_jugador INT,
    id_equipo INT,
    fecha_desde INT,
    fecha_hasta INT,
    PRIMARY KEY (id_jugador, id_equipo, fecha_desde)
   );

CREATE TABLE equipos_replica (
    id_equipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    region VARCHAR(50),
    fecha_alta TIMESTAMP NULL,
    fecha_modificacion TIMESTAMP NULL,
    fecha_baja TIMESTAMP NULL
);

CREATE TABLE jugadores_replica (
    id_jugador INT AUTO_INCREMENT PRIMARY KEY,
    nickname VARCHAR(50) NOT NULL,
    nombre_completo VARCHAR(100),
    pais VARCHAR(50),
    fecha_alta TIMESTAMP NULL,
    fecha_modificacion TIMESTAMP NULL,
    fecha_baja TIMESTAMP NULL
);

CREATE TABLE torneos_replica (
    id_torneo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    sede VARCHAR(100),
    fecha_alta TIMESTAMP NULL,
    fecha_modificacion TIMESTAMP NULL,
    fecha_baja TIMESTAMP NULL
);

CREATE TABLE puestos_replica (
    id_puesto INT AUTO_INCREMENT PRIMARY KEY,
    id_equipo INT,
    id_torneo INT,
    puesto INT,
    fecha_alta TIMESTAMP NULL,
    fecha_modificacion TIMESTAMP NULL,
    fecha_baja TIMESTAMP NULL,
    FOREIGN KEY (id_equipo) REFERENCES equipos_replica(id_equipo),
    FOREIGN KEY (id_torneo) REFERENCES torneos_replica(id_torneo)
);

CREATE TABLE jugadores_equipos_replica (
    id_jugador INT,
    id_equipo INT,
    desde_anio INT,
    hasta_anio INT,
    fecha_alta TIMESTAMP NULL,
    fecha_modificacion TIMESTAMP NULL,
    fecha_baja TIMESTAMP NULL,
    PRIMARY KEY (id_jugador, id_equipo, desde_anio)
);

ALTER TABLE equipos ADD COLUMN numero_victorias INT DEFAULT 0;
ALTER TABLE equipos_replica ADD COLUMN numero_victorias INT;
