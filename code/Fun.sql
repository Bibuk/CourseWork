CREATE FUNCTION `fn_calc_shipping` (
p_pvz_id   BIGINT,
p_subtotal DECIMAL(10,2)
) RETURNS DECIMAL(10,2)
READS SQL DATA
BEGIN
DECLARE v_free_from   DECIMAL(10,2) DEFAULT 0.00;
DECLARE v_cfg_val     VARCHAR(20)   DEFAULT '0';
DECLARE v_ship_cost   DECIMAL(10,2) DEFAULT 350.00;

-- Читаем порог бесплатной доставки из конфига ПВЗ
SELECT COALESCE(value->>'₽', '0')
INTO   v_cfg_val
FROM   site_config
WHERE  tenant_id = p_pvz_id
	AND  `key`     = 'free_ship_from'
LIMIT  1;

SET v_free_from = CAST(v_cfg_val AS DECIMAL(10,2));

-- Если сумма превышает порог — доставка бесплатна
IF v_free_from > 0 AND p_subtotal >= v_free_from THEN
	SET v_ship_cost = 0.00;
END IF;

RETURN v_ship_cost;
END

-- ТЕСТ
-- Порог бесплатной доставки TechMart = 5000 руб.
SELECT fn_calc_shipping(1, 3000.00)  AS ship_cost_low;    -- 350.00 (ниже порога)
SELECT fn_calc_shipping(1, 6000.00)  AS ship_cost_high;   -- 0.00   (выше порога)



SELECT
    o.order_number,
    o.subtotal,
    fn_calc_shipping(o.tenant_id, o.subtotal) AS calc_shipping,
    o.shipping_cost                            AS actual_shipping
FROM `order` o
WHERE o.tenant_id = 1
LIMIT 5;