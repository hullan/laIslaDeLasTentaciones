DELIMITER //

CREATE TRIGGER actualizar_fecha_decision
BEFORE UPDATE ON parejas
FOR EACH ROW
BEGIN
    IF NEW.decision_final IS NOT NULL AND NEW.decision_final != OLD.decision_final THEN
        SET NEW.fecha_decision = NOW();
    END IF;
END //

DELIMITER ;