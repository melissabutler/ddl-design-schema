-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE countries (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  country_id INTEGER REFERENCES countries NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  from_city INTEGER REFERENCES cities NOT NULL,
  to_city INTEGER REFERENCES cities NOT NULL
);


CREATE TABLE tickets (
  id SERIAL PRIMARY KEY,
  seat TEXT NOT NULL,
  airline_id INTEGER REFERENCES airlines NOT NULL,
  flight_id INTEGER REFERENCES flights NOT NULL
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  ticket_id INTEGER REFERENCES tickets NOT NULL
);

INSERT INTO countries (name)
VALUES ('United States'),
('United Kingdom'),
('Japan'),
('China'),
('Brazil');

INSERT INTO cities (name, country_id)
VALUES ('Washington DC', 1),
('Tokyo', 3),
('Seattle', 1),
('London', 2),
('Los Angeles', 1),
('Las Vegas', 1);

INSERT INTO airlines (name) 
VALUES ('United'),
('British Airways'),
('Delta'),
('Air China'),
('American Airlines');



INSERT INTO flights (departure, arrival, from_city, to_city)
VALUES ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 3),
('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 4),
('2018-01-02 07:00:00', '2018-01-02 08:03:00', 5, 6);

INSERT INTO tickets (seat, flight_id, airline_id)
VALUES ('33B', 1, 1),
('8A', 2, 2),
('12F', 3, 3);

INSERT INTO passengers (first_name, last_name, ticket_id)
VALUES ('Jennifer', 'Finch', 1),
('Thadeus', 'Gathercoal', 2),
('Sonja', 'Pauley', 3);

-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');

