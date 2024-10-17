stores.store_name from stores inner join orders on orders.store_id = stores.store_id inner join transactions on orders.order_id = transactions.order_id where orders.status = 0;
