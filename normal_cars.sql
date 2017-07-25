-- DROP TABLE IF EXISTS make_titles;
-- CREATE TABLE make_titles (
--   make_codes VARCHAR(25) NOT NULL PRIMARY KEY,
--   name VARCHAR(90) UNIQUE NOT NULL
-- );

-- insert into make_titles
-- SELECT  DISTINCT make_code, make_title FROM car_models;

-- DROP TABLE IF EXISTS models;
-- CREATE TABLE models (
--   id SERIAL PRIMARY KEY,
--   model_codes VARCHAR(25) NOT NULL,
--   model_title VARCHAR(90) NOT NULL,
--   make_code_id VARCHAR(25) REFERENCES make_titles(make_codes)
-- );

-- insert into models (model_codes, model_title, make_code_id)
-- SELECT DISTINCT model_code, model_title, make_code FROM car_models ORDER BY model_code;