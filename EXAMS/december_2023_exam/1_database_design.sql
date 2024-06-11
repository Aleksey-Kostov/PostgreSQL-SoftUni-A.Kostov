CREATE TABLE IF NOT EXISTS countries(
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS customers(
	"id" SERIAL PRIMARY KEY,
	first_name VARCHAR(25) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender CHAR(1) CHECK gender = 'M' or gender = 'F' NOT NULL,
	age INT CHECK age > 0 NOT NULL,
	phone_mumber CHAR(10) NOT NULL,
	country_id INT REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS products(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(25) NOT NULL,
    "description" VARCHAR(250),
    recipe TEXT,
    price NUMERIC(10, 2) CHECK price > 0 NOT NULL
);

CREATE TABLE IF NOT EXISTS feedbacks(
    "id" SERIAL PRIMARY KEY,
    "description" VARCHAR(255),
    rate NUMERIC(4, 2) CHECK rate BETWEEN 0 AND 10,
    product_id INT REFERENCES products(id) NOT NULL,
    customer_id INT REFERENCES customers(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS distributors(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(25) UNIQUE NOT NULL,
    "address" VARCHAR(30) NOT NULL,
    summary VARCHAR(200) NOT NULL,
    country_id INT REFERENCES countries(id) NOT NULL
);

CREATE TABLE IF NOT EXISTS ingredients(
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(30) NOT NULL,
    "description" VARCHAR(200),
    country_id INT REFERENCES countries(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL,
    distributor_id INT REFERENCES distributors(id) ON DELETE CASCADE ON UPDATE CASCADE NOT NULL
);

CREATE TABLE IF NOT EXISTS products_ingredients(
    product_id INT REFERENCES products(id) ON DELETE CASCADE ON UPDATE CASCADE,
    ingredient_id INT REFERENCES ingredients(id) ON DELETE CASCADE ON UPDATE CASCADE
)