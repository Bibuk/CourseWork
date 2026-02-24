CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_cancel_order`(
    IN  p_order_id  BIGINT,       -- ID заказа
    IN  p_pvz_id    BIGINT,       -- ID ПВЗ
    IN  p_reason    VARCHAR(255) -- Причина отмены
)
BEGIN
    DECLARE v_status     VARCHAR(20)   DEFAULT NULL;
    DECLARE v_order_num  VARCHAR(50)   DEFAULT NULL;
    DECLARE v_user_id    BIGINT        DEFAULT NULL;
    DECLARE v_total      DECIMAL(10,2) DEFAULT 0.00;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        GET DIAGNOSTICS CONDITION 1 @err_text = MESSAGE_TEXT;
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @err_text;
    END;

    IF p_order_id IS NULL OR p_order_id <= 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Некорректный ID заказа';
    END IF;

    IF p_reason IS NULL OR TRIM(p_reason) = '' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Укажите причину отмены';
    END IF;

    SELECT status, order_number, user_id, total
    INTO   v_status, v_order_num, v_user_id, v_total
    FROM   `order`
    WHERE  id = p_order_id AND tenant_id = p_pvz_id;

    IF v_order_num IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Заказ не найден';
    END IF;

    IF v_status = 'completed' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Нельзя отменить уже выданный заказ';
    END IF;

    IF v_status = 'cancelled' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Заказ уже отменён';
    END IF;

    START TRANSACTION;

    UPDATE `order`
    SET    status     = 'cancelled',
           updated_at = NOW()
    WHERE  id = p_order_id;

    UPDATE payment
    SET    status = 'cancelled'
    WHERE  order_id = p_order_id
      AND  status != 'completed';

    IF v_user_id IS NOT NULL THEN
        INSERT INTO notification (tenant_id, user_id, type, title, message, is_read)
        VALUES (
            p_pvz_id,
            v_user_id,
            'order',
            CONCAT('Заказ ', v_order_num, ' отменён'),
            CONCAT(
                'Причина: ', p_reason, '. ',
                'Возврат ', v_total, ' руб. - до 3 рабочих дней.'
            ),
            0
        );
    END IF;
    COMMIT;
    SELECT CONCAT('OK: Заказ ', v_order_num, ' отменён. Причина: ', p_reason) AS result;
END