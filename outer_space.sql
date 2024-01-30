-- from the terminal run:
-- psql < outer_space.sql

DROP DATABASE IF EXISTS outer_space;

CREATE DATABASE outer_space;

\c outer_space


CREATE TABLE galaxies(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE stars(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  galaxy_id INTEGER REFERENCES galaxies NOT NULL
);

CREATE TABLE planets(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_id INTEGER REFERENCES stars NOT NULL,
  orbital_period_in_years FLOAT NOT NULL
);

CREATE TABLE moons(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  orbital_id INTEGER REFERENCES planets NOT NULL
);

INSERT INTO galaxies (name)
VALUES ('The Milky Way');

INSERT INTO stars (name, galaxy_id)
VALUES ('The Sun', 1),
('Proxima Centauri', 1),
('Gliese 876', 1);

INSERT INTO planets (name, orbital_id, orbital_period_in_years)
VALUES ('Earth', 1, 1.00),
('Mars', 1, 1.88),
('Venus', 1, .62),
('Neptune', 1, 164.8),
('Proxima Centauri b', 2, .03),
('Gliese 876 b', 3, .23);

INSERT INTO moons (name, orbital_id)
VALUES ('The Moon', 1),
('Phobos', 2),
('Deimos', 2),
('Naiad', 4),
('Thalassa', 4),
('Despina', 4),
('Galatea', 4),
('Larissa', 4),
('S/2004 N 1', 4),
('Proteus', 4),
('Triton', 4),
('Nereid', 4),
('Halimede', 4),
('Sao', 4),
('Laomeddeia', 4),
('Psamathe', 4),
('Neso', 4);
-- CREATE TABLE planets
-- (
--   id SERIAL PRIMARY KEY,
--   name TEXT NOT NULL,
--   orbital_period_in_years FLOAT NOT NULL,
--   orbits_around TEXT NOT NULL,
--   galaxy TEXT NOT NULL,
--   moons TEXT[]
-- );

-- INSERT INTO planets
--   (name, orbital_period_in_years, orbits_around, galaxy, moons)
-- VALUES
--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
--   ('Mars', 1.88, 'The Sun', 'Milky Way', '{"Phobos", "Deimos"}'),
--   ('Venus', 0.62, 'The Sun', 'Milky Way', '{}'),
--   ('Neptune', 164.8, 'The Sun', 'Milky Way', '{"Naiad", "Thalassa", "Despina", "Galatea", "Larissa", "S/2004 N 1", "Proteus", "Triton", "Nereid", "Halimede", "Sao", "Laomedeia", "Psamathe", "Neso"}'),
--   ('Proxima Centauri b', 0.03, 'Proxima Centauri', 'Milky Way', '{}'),
--   ('Gliese 876 b', 0.23, 'Gliese 876', 'Milky Way', '{}');