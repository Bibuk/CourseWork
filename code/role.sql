-- 1. РОЛИ И ПРАВА ДОСТУПА

CREATE ROLE IF NOT EXISTS 'db_admin';
CREATE ROLE IF NOT EXISTS 'db_manager';
CREATE ROLE IF NOT EXISTS 'db_customer';

-- Права администратора — полный доступ
GRANT ALL PRIVILEGES ON pvzbd.* TO 'db_admin';

-- Права менеджера — управление товарами, заказами, уведомлениями
GRANT SELECT, INSERT, UPDATE        ON pvzbd.product        TO 'db_manager';
GRANT SELECT, INSERT, UPDATE        ON pvzbd.category       TO 'db_manager';
GRANT SELECT, INSERT, UPDATE        ON pvzbd.brand          TO 'db_manager';
GRANT SELECT, UPDATE                ON pvzbd.`order`        TO 'db_manager';
GRANT SELECT                        ON pvzbd.order_item     TO 'db_manager';
GRANT SELECT                        ON pvzbd.payment        TO 'db_manager';
GRANT SELECT, INSERT, UPDATE        ON pvzbd.notification   TO 'db_manager';
GRANT SELECT                        ON pvzbd.auth_user      TO 'db_manager';
GRANT SELECT                        ON pvzbd.tenant         TO 'db_manager';

-- Права покупателя — просмотр каталога, работа с корзиной и своими заказами
GRANT SELECT                        ON pvzbd.product        TO 'db_customer';
GRANT SELECT                        ON pvzbd.category       TO 'db_customer';
GRANT SELECT                        ON pvzbd.brand          TO 'db_customer';
GRANT SELECT, INSERT, UPDATE, DELETE ON pvzbd.cart          TO 'db_customer';
GRANT SELECT, INSERT, UPDATE, DELETE ON pvzbd.cart_item     TO 'db_customer';
GRANT SELECT, INSERT                ON pvzbd.`order`        TO 'db_customer';
GRANT SELECT                        ON pvzbd.order_item     TO 'db_customer';
GRANT SELECT                        ON pvzbd.payment        TO 'db_customer';
GRANT SELECT                        ON pvzbd.notification   TO 'db_customer';