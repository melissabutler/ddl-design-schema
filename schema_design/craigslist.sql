-- psql < craigslist.sql

DROP DATABASE IF EXISTS craigslist_db;

CREATE DATABASE craigslist_db;

\c craigslist_db;

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL,
    password VARCHAR(20) NOT NULL,
    preferred_region_id INTEGER REFERENCES regions
);


CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(20)
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories,
    text TEXT NOT NULL,
    location TEXT NOT NULL,
    region_id INTEGER REFERENCES regions
);

INSERT INTO regions (name)
VALUES ('Downtown'),
('Uptown'),
('Outskirts'),
('Sketchy Alley');

INSERT INTO users (username, password, preferred_region_id)
VALUES ('chickenbuttz','ilovechickens', 4),
('furniturelover','password321', 1),
('imlost', 'chickenpassword', 2);

INSERT INTO categories (name)
VALUES ('Furniture Flippers'),
('Backyard Chickens'),
('Navigation'),
('Pool Parties');

INSERT INTO posts (user_id, category_id, text, location, region_id)
VALUES (1, 2, 'I am very enthusiastic about chickens but have no backyard, any advice?', 'Tulsa', 1),
(2, 1, 'Free vanity, you pick up', 'Michigan', 4),
(3, 4, 'Please help i am so lost', 'Somewhere', 4);