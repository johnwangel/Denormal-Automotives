-- -- --5
SELECT  DISTINCT make_code, make_title
FROM car_models;

-- -- --6
SELECT DISTINCT model_title
FROM car_models c
WHERE c.make_code = 'VOLKS'
GROUP BY model_title;

-- --7
SELECT DISTINCT make_code, model_code, model_title, year
FROM car_models
WHERE make_code = 'LAM';

--8
SELECT DISTINCT *
FROM car_models c
WHERE year >= 2010 AND year <= 2015;