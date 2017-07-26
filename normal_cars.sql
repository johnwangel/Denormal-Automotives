DROP TABLE IF EXISTS car_models;
\i scripts/denormal_data.sql

DROP TABLE IF EXISTS model_year;
DROP TABLE IF EXISTS models;
DROP TABLE IF EXISTS make_titles;

CREATE TABLE make_titles (
  make_codes VARCHAR(25) NOT NULL PRIMARY KEY,
  name VARCHAR(90) UNIQUE NOT NULL
);

insert into make_titles
SELECT  DISTINCT make_code, make_title FROM car_models;

CREATE TABLE models (
  id SERIAL PRIMARY KEY,
  model_codes VARCHAR(25) NOT NULL,
  model_title VARCHAR(90) NOT NULL,
  make_code_id VARCHAR(25) REFERENCES make_titles(make_codes)
);

insert into models (model_codes, model_title, make_code_id)
SELECT DISTINCT model_code, model_title, make_code FROM car_models ORDER BY model_code;

CREATE TABLE model_year (
  id SERIAL PRIMARY KEY,
  model INT REFERENCES models(id),
  year INT NOT NULL
);

INSERT INTO model_year (model, year)
SELECT DISTINCT m.id, year
FROM car_models c
JOIN models m ON m.model_title = c.model_title;

--7
SELECT DISTINCT name
FROM make_titles;

--8
SELECT DISTINCT m.model_title
FROM model_year y
JOIN models m ON y.model = m.id
WHERE m.make_code_id = 'VOLKS';

--9
SELECT DISTINCT mt.make_codes, mo.model_codes, mo.model_title, my.year
FROM model_year my
JOIN models mo ON my.model = mo.id
JOIN make_titles mt ON mt.make_codes = mo.make_code_id
WHERE mt.make_codes = 'LAM';

--10
SELECT DISTINCT mt.make_codes, mo.model_codes, mo.model_title, my.year
FROM model_year my
JOIN models mo ON my.model = mo.id
JOIN make_titles mt ON mt.make_codes = mo.make_code_id
WHERE my.year >= 2010 and my.year <= 2015;