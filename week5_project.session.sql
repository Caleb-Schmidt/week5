DROP TABLE IF EXISTS customer CASCADE;
CREATE TABLE customer(
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    order_id INTEGER,
    FOREIGN KEY(order_id) REFERENCES orders(order_id)
);

DROP FUNCTION add_customer;
CREATE OR REPLACE FUNCTION add_customer(
    _first_name VARCHAR(50),
    _last_name VARCHAR(50)
)
RETURNS void
AS
$$
BEGIN
INSERT INTO customer(
    first_name,
    last_name
) VALUES (
    _first_name,
    _last_name
);
END;
$$

LANGUAGE plpgsql;

SELECT add_customer('Jeffery', 'Dahmer');
SELECT add_customer('Connor', 'Fuller');
SELECT add_customer('Kevin', 'Beier');
SELECT add_customer('Dylan', 'Smith');
SELECT add_customer('Eugine', 'Walker');

DROP TABLE IF EXISTS orders CASCADE;
CREATE TABLE orders(
    order_id SERIAL PRIMARY KEY,
    car_id INTEGER,
    FOREIGN KEY(car_id) REFERENCES cars(car_id)
);

DROP FUNCTION place_order;
CREATE OR REPLACE FUNCTION place_order(
    _car_id INTEGER
)
RETURNS void
AS
$$
BEGIN
INSERT INTO orders(
    car_id
)   VALUES (
    _car_id
);

END;
$$
LANGUAGE plpgsql;

SELECT place_order(1);
SELECT place_order(2);
SELECT place_order(3);
SELECT place_order(4);
SELECT place_order(5);

DROP TABLE IF EXISTS cars CASCADE;
CREATE TABLE cars(
    car_id SERIAL PRIMARY KEY,
    staff_id INTEGER,
    customer_id INTEGER,
    FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY(staff_id) REFERENCES staff(staff_id)
);

DROP FUNCTION add_car;
CREATE OR REPLACE FUNCTION add_car(
    _car_id INTEGER,
    _staff_id INTEGER,
    _customer_id INTEGER
)
RETURNS void
AS
$$
BEGIN
INSERT INTO cars(
    car_id,
    staff_id,
    customer_id
) VALUES (
    _car_id,
    _staff_id,
    _customer_id
);
END;
$$
LANGUAGE plpgsql;

SELECT add_car(1,1,1);
SELECT add_car(2,2,2);
SELECT add_car(3,3,3);
SELECT add_car(4,4,4);
SELECT add_car(5,5,5);

DROP TABLE IF EXISTS staff CASCADE;
CREATE TABLE staff(
    staff_id SERIAL PRIMARY KEY,
    department VARCHAR(150),
    payments_id INTEGER,
    FOREIGN KEY(payments_id) REFERENCES payment(payments_id)
);

DROP FUNCTION add_staff;
CREATE OR REPLACE FUNCTION add_staff(
    _staff_id INTEGER,
    _department VARCHAR(150)
)
RETURNS void
AS 
$$
BEGIN 
INSERT INTO staff(
    staff_id,
    department
) VALUES (
    _staff_id,
    _department
);
END;
$$
LANGUAGE plpgsql;

SELECT add_staff(1, 'Sales');
SELECT add_staff(2, 'Sales');
SELECT add_staff(3, 'Sales');
SELECT add_staff(4, 'Sales');
SELECT add_staff(5, 'Sales');

DROP TABLE IF EXISTS payment CASCADE;
CREATE TABLE payment(
    payments_id SERIAL PRIMARY KEY,
    amount NUMERIC(6,2)
);

DROP FUNCTION add_payment
CREATE OR REPLACE FUNCTION add_payment(
    _amount NUMERIC(6,2)
)
RETURNS void
AS 
$$
BEGIN
INSERT INTO payment(
    amount
) VALUES (
    _amount
);
END;
$$
LANGUAGE plpgsql;

SELECT add_payment(100.00);
SELECT add_payment(100.00);
SELECT add_payment(100.00);
SELECT add_payment(100.00);
SELECT add_payment(100.00);