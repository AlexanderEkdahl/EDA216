-- Delete the tables if they exist.
-- Disable foreign key checks, so the tables can
-- be dropped in arbitrary order.
PRAGMA foreign_keys=OFF;
DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS theaters;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS performances;
DROP TABLE IF EXISTS reservations;
PRAGMA foreign_keys=ON;

-- Create the tables.
CREATE TABLE users (
  username varchar(20) PRIMARY KEY,
  address varchar(40),
  telephone varchar(10) NOT NULL
);

CREATE TABLE theaters (
  name varchar(20) PRIMARY KEY,
  seats integer NOT NULL
);

CREATE TABLE movies (
  name varchar(30) PRIMARY KEY
);

CREATE TABLE performances (
  movie_name varchar(30) REFERENCES movies(name),
  theater_name varchar(20) REFERENCES theaters(name),
  day date,
  PRIMARY KEY (movie_name, day)
);

CREATE TABLE reservations (
  nbr integer PRIMARY KEY,
  username varchar(20) REFERENCES users(username),
  movie_name varchar(30),
  day date,
  FOREIGN KEY (movie_name, day) REFERENCES performances(movie_name, day),
  UNIQUE (username, movie_name, day)
);

INSERT INTO users (username, address, telephone) VALUES
('DonaldTrump', null, '+1 123 456'),
('BarackObama', null, '+1 123 456'),
('GeorgeWBush', null, '+1 123 456'),
('BillClinton', null, '+1 123 456'),
('GeorgeHWBush', null, '+1 123 456'),
('RonaldReagan', null, '+1 123 456'),
('JimmyCarter', null, '+1 123 456');

INSERT INTO theaters (name, seats) VALUES
('Helsingborg', 140),
('Lund', 80),
('Malmö', 350);

INSERT INTO movies (name) VALUES
('Star Wars: The Force Awakens'),
('Jurassic World'),
('Furious 7'),
('Avengers: Age of Ultron'),
('Minions'),
('Spectre'),
('Inside Out'),
('Mission: Impossible – Rogue Nation'),
('The Hunger Games: Mockingjay – Part 2'),
('The Martian');

INSERT INTO performances (movie_name, theater_name, day) VALUES
('Star Wars: The Force Awakens', 'Helsingborg', '2015–12–18'),
('Star Wars: The Force Awakens', 'Lund', '2015–12–19'),
('Star Wars: The Force Awakens', 'Malmö', '2015–12–20');

INSERT INTO reservations (username, movie_name, day) VALUES
('BarackObama', 'Star Wars: The Force Awakens', '2015–12–18'),
('BillClinton', 'Star Wars: The Force Awakens', '2015–12–18');

SELECT "1) SELECT * FROM movies";
SELECT * FROM movies;

SELECT "2) SELECT day FROM performances WHERE movie_name = 'Star Wars: The Force Awakens'";
SELECT day FROM performances WHERE movie_name = 'Star Wars: The Force Awakens';

SELECT "SELECT nbr, username FROM reservations WHERE movie_name = 'Star Wars: The Force Awakens' AND day = '2015–12–18';";
SELECT nbr, username FROM reservations WHERE movie_name = 'Star Wars: The Force Awakens' AND day = '2015–12–18';
