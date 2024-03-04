-- Дані про товари (назва, ціна, кількість замовленго товару, категорія, виробник) у конкретному замовленні
SELECT name, price, pto.quantity, category, manufacturer
FROM orders o
JOIN products_to_orders pto ON pto.order_id = o.id
JOIN products p ON pto.product_id = p.id
WHERE o.id = 1;

-- Кількість одиниць куплених товарів певної категорії у конкретному замовлені (3 пляшки коли + 2 пачки ципсів = 5 товарів )
SELECT SUM (pto.quantity)
FROM orders o
JOIN products_to_orders pto ON pto.order_id = o.id
JOIN products p ON pto.product_id = p.id
WHERE o.id = 1;

-- Кількість коментарів певного користувача з рейтингом більше 3
SELECT u.comments, ra.rating
FROM reviews re
JOIN users u ON re.user_id = u.id
JOIN ratings ra ON re.rating_id = ra.id
WHERE re.user_id = 21 AND ra.rating >3;

-- Кожне замовлення певного користувача зі статусом 'finished' та його загальна ціна
SELECT SUM (p.price)"загальна ціна"
FROM orders o
JOIN products_to_orders pto ON pto.order_id = o.id
JOIN products p ON pto.product_id = p.id
JOIN users u ON o.user_id = u.id
WHERE u.id = 21 AND o.status = 'finished'

