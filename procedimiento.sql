DELIMITER //

DROP PROCEDURE IF EXISTS proc_media_tiempo_parejas //
CREATE PROCEDURE proc_media_tiempo_parejas(OUT media DECIMAL(10,2))
BEGIN
    SELECT COALESCE(AVG(tiempo_juntos), 0) INTO media
    FROM parejas
    WHERE tiempo_juntos IS NOT NULL;
END //

DROP PROCEDURE IF EXISTS proc_media_tiempo_parejas_edicion //
CREATE PROCEDURE proc_media_tiempo_parejas_edicion(IN edicion_id INT, OUT media DECIMAL(10,2))
BEGIN
    SELECT COALESCE(AVG(p.tiempo_juntos), 0) INTO media
    FROM parejas p
    JOIN concursantes c1 ON p.id_chico = c1.id
    JOIN concursantes c2 ON p.id_chica = c2.id
    WHERE c1.id_edicion = edicion_id
      AND c2.id_edicion = edicion_id
      AND p.tiempo_juntos IS NOT NULL;
END //

DROP PROCEDURE IF EXISTS proc_media_tiempo_parejas_estado //
CREATE PROCEDURE proc_media_tiempo_parejas_estado(
    IN edicion_id INT,
    IN estado_relacion CHAR(1),
    OUT media DECIMAL(10,2)
)
BEGIN
    SELECT COALESCE(AVG(p.tiempo_juntos), 0) INTO media
    FROM parejas p
    JOIN concursantes c1 ON p.id_chico = c1.id
    JOIN concursantes c2 ON p.id_chica = c2.id
    WHERE c1.id_edicion = edicion_id
      AND c2.id_edicion = edicion_id
      AND p.tiempo_juntos IS NOT NULL
      AND (estado_relacion IS NULL OR 
           (estado_relacion = 'J' AND p.decision_final = 'J') OR
           (estado_relacion = 'S' AND p.decision_final = 'S'));
END //

DELIMITER ;
