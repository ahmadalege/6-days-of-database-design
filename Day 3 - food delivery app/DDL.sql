BEGIN;


CREATE TABLE IF NOT EXISTS customer
(
    id integer NOT NULL,
    first_name character varying(30),
    last_name character varying(30),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS restaurant
(
    id integer NOT NULL,
    restaurant_name text NOT NULL,
    addess_id character varying(100),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS menu_item
(
    id integer NOT NULL,
    restaurant_id integer NOT NULL,
    item_name text NOT NULL,
    price numeric NOT NULL,
    PRIMARY KEY (price)
);

CREATE TABLE IF NOT EXISTS "order"
(
    id integer NOT NULL,
    customer_id integer NOT NULL,
    restaurant_id integer NOT NULL,
    customer_address_id integer NOT NULL,
    order_status_id integer NOT NULL,
    delivery_driver_id integer NOT NULL,
    order_datetime date NOT NULL,
    delivery_fee numeric NOT NULL,
    total_amount numeric NOT NULL,
    requested_delivery_time time without time zone NOT NULL,
    driver_rating integer,
    restaurant_rating integer,
    CONSTRAINT customer PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS order_menu_item
(
    id integer NOT NULL,
    order_id integer NOT NULL,
    menu_item_id integer NOT NULL,
    qty_ordered integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS customer_address
(
    id integer NOT NULL,
    customer_id integer NOT NULL,
    address_id integer NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS address
(
    id integer NOT NULL,
    house_number integer NOT NULL,
    street character varying(50) NOT NULL,
    address_line character varying(100) NOT NULL,
    city character varying(50),
    state character varying(50),
    country character varying(50),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS country
(
    id integer NOT NULL,
    country_name text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS order_status
(
    id integer NOT NULL,
    status text NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS delivery_driver
(
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS restaurant
    ADD CONSTRAINT address_id FOREIGN KEY (addess_id)
    REFERENCES address (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS menu_item
    ADD CONSTRAINT restaurant_id FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "order"
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id)
    REFERENCES customer (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "order"
    ADD CONSTRAINT restaurant_id FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "order"
    ADD CONSTRAINT customer_address_id FOREIGN KEY (customer_address_id)
    REFERENCES customer_address (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "order"
    ADD CONSTRAINT order_status_id FOREIGN KEY (order_status_id)
    REFERENCES order_status (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS "order"
    ADD FOREIGN KEY (delivery_driver_id)
    REFERENCES delivery_driver (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS order_menu_item
    ADD CONSTRAINT order_id FOREIGN KEY (order_id)
    REFERENCES "order" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS order_menu_item
    ADD CONSTRAINT menu_item_id FOREIGN KEY (menu_item_id)
    REFERENCES menu_item (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS customer_address
    ADD CONSTRAINT customer_id FOREIGN KEY (customer_id)
    REFERENCES customer (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS customer_address
    ADD CONSTRAINT address_id FOREIGN KEY (address_id)
    REFERENCES address (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS address
    ADD CONSTRAINT country_id FOREIGN KEY (country)
    REFERENCES country (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;