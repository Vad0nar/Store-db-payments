products.* FROM products LEFT JOIN orders ON products.product_id = orders.product_id WHERE orders.order_id IS NULL;	select products.product_name, orders.status from products left join transactions ON products.product_id = transactions.order_id left join orders ON transactions.order_id = orders.order_id  where orders.status is null;	select products.product_name from products join orders on orders.order_id where orders.status = 0 union all select products.product_name from products where products.product_id NOT IN (SELECT product_id FROM transactions);
