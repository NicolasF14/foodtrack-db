-- Creacion de database: DBEAVER

CREATE DATABASE DBEAVER;

-- Usar la databaseL DBEAVER

USE DBEAVER;

-- Creacion de tablas de FOODTRUCK - DBEAVER

-- TABLE: FOODTRUCKS
CREATE TABLE foodtrucks (
	foodtruck_id INT IDENTITY(1,1) PRIMARY KEY, --LLAVE PRIMARIA AUTOINCREMENTAL
	name NVARCHAR(100) NOT NULL,
	cuisine_type NVARCHAR(100) NOT NULL,
	city NVARCHAR(100) NOT NULL
);

-- TABLE: LOCATIONS
CREATE TABLE locations (
	location_id INT IDENTITY(1,1) PRIMARY KEY,
	foodtruck_id INT,
	location_date DATE,
	zone NVARCHAR(100) NOT NULL

--Establecer restriccion de FK entre foodtrucks y locations
CONSTRAINT FK_locations_foodtrucks FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id)
);

-- TABLE: PRODUCTS
CREATE TABLE products (
	product_id INT IDENTITY(1,1) PRIMARY KEY,
	foodtruck_id INT,
	name NVARCHAR(200) NOT NULL,
	price DECIMAL,
	stock INT
--Establecer restriccion de FK entre foodtrucks y products
CONSTRAINT FK_products_foodtrucks FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id)

);

-- TABLE: ORDERS
CREATE TABLE orders (
	order_id INT IDENTITY(1001,1) PRIMARY KEY,
	foodtruck_id INT,
	order_date DATE,
	status NVARCHAR(200) NOT NULL,
	total INT
--Establecer restriccion de FK entre foodtrucks y products
CONSTRAINT FK_orders_foodtrucks FOREIGN KEY (foodtruck_id)
REFERENCES foodtrucks(foodtruck_id)
);

-- TABLE: ORDERS
CREATE TABLE order_items (
	order_item_id INT IDENTITY(1,1) PRIMARY KEY,
	order_id INT,
	product_id INT,
	quantity INT
--Establecer restriccion de FK entre orders y order_items
CONSTRAINT FK_orders_order_items FOREIGN KEY (order_id)
REFERENCES orders(order_id),

--Establecer restriccion de FK entre products y order_items
CONSTRAINT FK_product_order_items FOREIGN KEY (product_id)
REFERENCES products(product_id)

);