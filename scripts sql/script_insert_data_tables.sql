-- INPUT DE DATOS MEDIANTE CARGA DE ARCHIVOS CSV

USE DBEAVER;

-- FOODTRUCKS

BULK INSERT foodtrucks
FROM 'G:\Mi unidad\Data Science - Henry\Data Science - Henry\Modulo 2\Lectures\FoodTrucks\foodtrack-db\data\foodtrucks.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n'
);

SELECT * FROM foodtrucks;

-- LOCATIONS

BULK INSERT locations
FROM 'G:\Mi unidad\Data Science - Henry\Data Science - Henry\Modulo 2\Lectures\FoodTrucks\foodtrack-db\data\locations.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a' --representa el salto de linea UNIX (LF)
);

SELECT * FROM locations;

SELECT MONTH(location_date) as MES --YYYY-MM-DD
FROM locations

-- PRODUCTS
BULK INSERT products
FROM 'G:\Mi unidad\Data Science - Henry\Data Science - Henry\Modulo 2\Lectures\FoodTrucks\foodtrack-db\data\products.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);

SELECT * FROM products;

-- ORDERS
BULK INSERT orders
FROM 'G:\Mi unidad\Data Science - Henry\Data Science - Henry\Modulo 2\Lectures\FoodTrucks\foodtrack-db\data\orders.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);

SELECT * FROM orders;

-- ORDER_ITEMS
-- INPUT de datos de forma manual

/*INSERT INTO order_items (order_item_id,order_id,product_id,quantity)
VALUES 
	(1,1001,101,1),
	(2,1002,103,1),
	(3,1002,104,1); */

BULK INSERT order_items
FROM 'G:\Mi unidad\Data Science - Henry\Data Science - Henry\Modulo 2\Lectures\FoodTrucks\foodtrack-db\data\order_items.csv'
WITH (
	FORMAT = 'CSV',
	FIRSTROW = 2,
	FIELDTERMINATOR = ',',
	ROWTERMINATOR = '0x0a'
);

SELECT * FROM order_items;
