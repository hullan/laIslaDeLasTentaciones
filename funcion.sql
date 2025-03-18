DELIMITER //

CREATE FUNCTION func_media_tiempo_parejas() 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);
    
    SELECT AVG(tiempo_juntos) INTO media
    FROM parejas
    WHERE tiempo_juntos IS NOT NULL;
    
    RETURN COALESCE(media, 0);
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION func_media_tiempo_parejas_edicion(edicion_id INT) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);
    
    SELECT AVG(p.tiempo_juntos) INTO media
    FROM parejas p
    JOIN concursantes c1 ON p.id_chico = c1.id
    JOIN concursantes c2 ON p.id_chica = c2.id
    WHERE c1.id_edicion = edicion_id
      AND c2.id_edicion = edicion_id
      AND p.tiempo_juntos IS NOT NULL;
    
    RETURN COALESCE(media, 0);
END //

DELIMITER ;

DELIMITER //

CREATE FUNCTION func_media_tiempo_parejas_estado(
    edicion_id INT,
    estado_relacion CHAR(1)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);
    
    SELECT AVG(p.tiempo_juntos) INTO media
    FROM parejas p
    JOIN concursantes c1 ON p.id_chico = c1.id
    JOIN concursantes c2 ON p.id_chica = c2.id
    WHERE c1.id_edicion = edicion_id
      AND c2.id_edicion = edicion_id
      AND p.tiempo_juntos IS NOT NULL
      AND (estado_relacion IS NULL OR 
           (estado_relacion = 'J' AND p.decision_final = 'J') OR
           (estado_relacion = 'S' AND p.decision_final = 'S'));
    
    RETURN COALESCE(media, 0);
END //

DELIMITER ;

DELIMITER //

DROP FUNCTION IF EXISTS func_media_tiempo_parejas_estado //

CREATE FUNCTION func_media_tiempo_parejas_estado(
    edicion_id INT,
    estado_relacion CHAR(1)
) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE media DECIMAL(10,2);
    
    SELECT AVG(p.tiempo_juntos) INTO media
    FROM parejas p
    JOIN concursantes c1 ON p.id_chico = c1.id
    JOIN concursantes c2 ON p.id_chica = c2.id
    WHERE c1.id_edicion = edicion_id
      AND c2.id_edicion = edicion_id
      AND p.tiempo_juntos IS NOT NULL
      AND (estado_relacion IS NULL OR 
           (estado_relacion = 'J' AND p.decision_final = 'J') OR
           (estado_relacion = 'S' AND p.decision_final = 'S'));
    
    RETURN COALESCE(media, 0);
END //

DELIMITER ;

