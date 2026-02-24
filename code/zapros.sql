-- ЗАПРОС 1. Заказы, которые уже доставлены на ПВЗ и ждут получения
SELECT
    o.order_number          AS номер_заказа,
    t.name                  AS пвз,
    t.city                  AS город,
    o.customer_name         AS покупатель,
    o.customer_phone        AS телефон,
    o.total                 AS сумма,
    o.updated_at            AS дата_поступления_на_пвз
FROM `order` o
JOIN tenant t ON o.tenant_id = t.id
WHERE o.status   = 'delivered'
  AND t.id       = 1
ORDER BY o.updated_at ASC;

-- ЗАПРОС 2. Товары, которых нет в наличии
SELECT
    t.name                  AS пвз,
    p.name                  AS товар,
    p.sku                   AS артикул,
    p.price                 AS цена,
    p.stock_quantity        AS остаток
FROM product p
JOIN tenant t ON p.tenant_id = t.id
WHERE p.stock_quantity = 0
  AND p.is_active      = 1
  AND t.id             = 1
ORDER BY p.name;

-- ЗАПРОС 3. Заказы за конкретный месяц
SELECT
    o.order_number          AS номер_заказа,
    t.name                  AS пвз,
    o.customer_name         AS покупатель,
    o.total                 AS сумма,
    o.status                AS статус,
    o.created_at            AS дата
FROM `order` o
JOIN tenant t ON o.tenant_id = t.id
WHERE YEAR(o.created_at)  = 2024
  AND MONTH(o.created_at) = 3
  AND t.id                = 1
ORDER BY o.created_at;

-- ЗАПРОС 4. История платежей конкретного ПВЗ
SELECT
    o.order_number          AS номер_заказа,
    o.customer_name         AS покупатель,
    p.payment_method        AS способ_оплаты,
    p.amount                AS сумма,
    p.status                AS статус_платежа,
    p.completed_at          AS дата_оплаты
FROM payment p
JOIN `order` o ON p.order_id  = o.id
JOIN tenant  t ON p.tenant_id = t.id
WHERE t.id = 1
ORDER BY p.created_at DESC;

-- ЗАПРОС 5. Средний чек конкретного ПВЗ
SELECT
    t.name                  AS пвз,
    COUNT(o.id)             AS всего_заказов,
    MIN(o.total)            AS мин_чек,
    MAX(o.total)            AS макс_чек,
    ROUND(AVG(o.total), 2)  AS средний_чек
FROM `order` o
JOIN tenant t ON o.tenant_id = t.id
WHERE t.id = 1
  AND o.status != 'cancelled';