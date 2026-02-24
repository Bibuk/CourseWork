CREATE VIEW `vw_pvz_parcels` AS
SELECT
    o.id AS id,
    o.order_number,
    t.name AS пвз,
    t.address AS адрес,
    t.city AS город,
    o.customer_name,
    o.customer_phone,
    o.customer_email,
    o.total,
    o.status AS статус,                       
    CASE o.status
        WHEN 'pending'   THEN 'Ожидает поступления'
        WHEN 'confirmed' THEN 'Принята в обработку'
        WHEN 'shipped'   THEN 'В пути на ПВЗ'
        WHEN 'delivered' THEN 'На ПВЗ — ожидает клиента'
        WHEN 'completed' THEN 'Выдана клиенту'
        WHEN 'cancelled' THEN 'Отменена / Возврат'
        ELSE o.status
    END AS статус_описание,                   
    CASE
        WHEN o.status = 'delivered'
        THEN DATEDIFF(CURDATE(), DATE(o.updated_at))
        ELSE NULL
    END AS дней_на_пвз,
    CASE
        WHEN o.status = 'delivered'
         AND DATEDIFF(CURDATE(), DATE(o.updated_at)) > 7
        THEN 1
        ELSE 0
    END AS просрочка_хранения,               
    pay.payment_method,
    pay.status AS статус_оплаты,
    o.created_at AS время_создания,
    o.updated_at AS время_изменения
FROM `order` o
JOIN  tenant  t   ON o.tenant_id = t.id
LEFT JOIN payment pay ON o.id    = pay.order_id
WHERE t.is_active = 1;