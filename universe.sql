-- Create the database
CREATE DATABASE universe;
\c universe

-- Create the galaxy table
CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  size INT NOT NULL,
  type TEXT NOT NULL,
  has_spiral_arms BOOLEAN NOT NULL,
  number_of_stars INT
);

-- Create the star table
CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  galaxy_id INT REFERENCES galaxy(galaxy_id),
  mass NUMERIC(10,2) NOT NULL,
  temperature INT NOT NULL,
  is_main_sequence BOOLEAN NOT NULL,
  age INT
);

-- Create the planet table
CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  star_id INT REFERENCES star(star_id),
  radius NUMERIC(10,2) NOT NULL,
  distance_from_star NUMERIC(10,2) NOT NULL,
  is_habitable BOOLEAN NOT NULL,
  number_of_moons INT
);

-- Create the moon table
CREATE TABLE moon (
  moon_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  planet_id INT REFERENCES planet(planet_id),
  mass NUMERIC(10,2) NOT NULL,
  orbital_period INT NOT NULL,
  has_atmosphere BOOLEAN NOT NULL,
  is_known_to_support_life BOOLEAN
);

-- Example data for the tables
-- Note: You can insert additional rows as needed

-- galaxy table data
INSERT INTO galaxy (name, size, type, has_spiral_arms, number_of_stars)
VALUES
  ('Milky Way', 100000, 'Spiral', true, 100000000),
  ('Andromeda', 120000, 'Spiral', true, 200000000),
  ('Whirlpool', 50000, 'Spiral', true, 50000000),
  ('Sombrero', 60000, 'Elliptical', false, 10000000),
  ('Centaurus A', 80000, 'Elliptical', false, 8000000),
  ('Triangulum', 40000, 'Spiral', true, 40000000);

-- star table data
INSERT INTO star (name, galaxy_id, mass, temperature, is_main_sequence, age)
VALUES
  ('Sun', 1, 1.989e30, 5778, true, 4.6),
  ('Sirius', 1, 2.02e30, 9940, true, 200),
  ('Proxima Centauri', 6, 0.123e30, 3042, true, 6),
  ('Alpha Centauri A', 6, 1.1e30, 5790, true, 6),
  ('Alpha Centauri B', 6, 0.907e30, 5260, true, 6),
  ('Betelgeuse', 1, 11.6e30, 3500, true, 8);

-- planet table data
INSERT INTO planet (name, star_id, radius, distance_from_star, is_habitable, number_of_moons)
VALUES
  ('Earth', 1, 6371, 149.6, true, 1),
  ('Mars', 1, 3389.5, 227.9,Continuation of the SQL commands:

```sql
-- planet table data (continued)
  true, 2),
  ('Jupiter', 1, 69911, 778.6, false, 79),
  ('Saturn', 1, 58232, 1433.5, false, 82),
  ('Neptune', 2, 24622, 4495.1, false, 14),
  ('Uranus', 2, 25362, 2871, false, 27),
  ('Mercury', 1, 2439.7, 57.9, false, 0),
  ('Venus', 1, 6051.8, 108.2, false, 0),
  ('Pluto', 1, 1188.3, 5906.4, false, 5),
  ('Kepler-452b', 3, 6371, 501.4, true, 2),
  ('HD 189733 b', 3, 115.4, 3.9, false, 0),
  ('Gliese 581g', 3, 7825, 0.146, true, 0);

-- moon table data
INSERT INTO moon (name, planet_id, mass, orbital_period, has_atmosphere, is_known_to_support_life)
VALUES
  ('Moon', 1, 7.342e22, 27.3, false, false),
  ('Phobos', 2, 1.0659e16, 0.32, false, false),
  ('Deimos', 2, 1.4762e15, 1.3, false, false),
  ('Ganymede', 3, 1.4819e23, 7.15, false, false),
  ('Callisto', 3, 1.0759e23, 16.69, false, false),
  ('Europa', 3, 4.7998e22, 3.55, false, false),
  ('Titan', 4, 1.3452e23, 15.95, true, false),
  ('Enceladus', 4, 1.08022e20, 1.37, true, false),
  ('Triton', 5, 2.139e22, 5.88, true, false),
  ('Miranda', 5, 6.413e19, 1.41, false, false),
  ('Ariel', 5, 1.353e21, 2.52, false, false),
  ('Tethys', 6, 6.176e20, 1.89, false, false),
  ('Dione', 6, 1.095452e21, 2.74, false, false),
  ('Rhea', 6, 2.306518e21, 4.52, false, false),
  ('Iapetus', 6, 1.805635e21, 79.33, false, false),
  ('Triton', 7, 2.139e22, 5.88, true, false),
  ('Miranda', 7, 6.413e19, 1.41, false, false),
  ('Ariel', 7, 1.353e21, 2.52, false, false),
  ('Tethys', 8, 6.176e20, 1.89, false, false),
Continuation of the SQL commands:

```sql
-- moon table data (continued)
  ('Dione', 8, 1.095452e21, 2.74, false, false),
  ('Rhea', 8, 2.306518e21, 4.52, false, false),
  ('Iapetus', 8, 1.805635e21, 79.33, false, false),
  ('Titania', 9, 3.527e21, 8.71, false, false),
  ('Oberon', 9, 3.014e21, 13.46, false, false),
  ('Umbriel', 9, 1.172e21, 4.14, false, false),
  ('Ariel', 9, 1.353e21, 2.52, false, false),
  ('Dione', 10, 1.095452e21, 2.74, false, false),
  ('Tethys', 10, 6.176e20, 1.89, false, false),
  ('Enceladus', 10, 1.08022e20, 1.37, true, false),
  ('Hyperion', 10, 5.62e18, 21.28, false, false),
  ('Charon', 11, 1.586e21, 6.39, false, false),
  ('Nix', 11, 4.8e16, 24.85, false, false),
  ('Hydra', 11, 4.2e16, 38.2, false, false),
  ('Styx', 11, 3.8e16, 20.16, false, false),
  ('Triton', 12, 2.139e22, 5.88, true, false),
  ('Nereid', 12, 3.1e19, 360.14, false, false),
  ('Proteus', 12, 4.4e19, 1.12, false, false);

-- Verification: Check the data in the tables
SELECT * FROM galaxy;
SELECT * FROM star;
SELECT * FROM planet;
SELECT * FROM moon;