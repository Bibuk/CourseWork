USE pvzbd;

DELIMITER $$

CREATE TRIGGER trg_before_product_update
BEFORE UPDATE ON product
FOR EACH ROW
BEGIN
    IF NEW.stock_quantity < 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Остаток товара не может быть отрицательным',
                MYSQL_ERRNO = 1001;
    END IF;
END$$

DELIMITER ;

INSERT INTO product (tenant_id, name, slug, price, stock_quantity, is_active)
VALUES (1, 'Тест товар', 'test-product', 100.00, 5, 1);

UPDATE product SET stock_quantity = -10 WHERE id = 43;

SELECT name, stock_quantity FROM product WHERE slug = 'test-product';

DELETE FROM product WHERE id = 43;