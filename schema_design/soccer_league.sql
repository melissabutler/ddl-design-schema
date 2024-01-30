--psql < soccer_league.sql

DROP DATABASE IF EXISTS soccer_league_db;

CREATE DATABASE soccer_league_db;

\c soccer_league_db;

CREATE TABLE seasons(
    id SERIAL PRIMARY KEY,
    date_start DATE NOT NULL,
    date_end DATE NOT NULL
);

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    ranking INTEGER

);
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    team_id INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    season_id INTEGER REFERENCES seasons NOT NULL,
    date DATE NOT NULL,
    team1 INTEGER REFERENCES teams NOT NULL,
    team2 INTEGER REFERENCES teams NOT NULL
);

CREATE TABLE goals (
    id SERIAL PRIMARY KEY,
    player_id INTEGER REFERENCES players NOT NULL,
    match_id INTEGER REFERENCES matches NOT NULL
);

INSERT INTO seasons (date_start, date_end)
VALUES ('2020-04-05', '2020-07-05'),
('2021-04-10', '2021-07-15');

INSERT INTO teams(name, ranking)
VALUES ('JUNKYARD DOGS', 10),
('Rat Bastards', 5),
('Unicorn Snot', 2);

INSERT INTO players(name, team_id)
VALUES ('Joshua Smalls', 1),
('Rodent Eater', 2),
('Dainty Paws', 2),
('Lip Tickler', 3),
('Joe', 1),
('George Washington but a Rat', 2),
('Princess Fluffington Von Sweet', 3);

INSERT INTO matches(season_id, date, team1, team2)
VALUES (1, '2020-05-13', 1, 2),
(1, '2020-05-21', 2, 3),
(2, '2021-05-17', 1, 3);

INSERT INTO goals (player_id, match_id)
VALUES (1, 1),
(2,1),
(7, 2);
