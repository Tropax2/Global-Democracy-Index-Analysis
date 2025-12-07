CREATE TABLE global_democracy_index(
    contry_code VARCHAR(3),
    country_name VARCHAR(30),
    score_2018 NUMERIC,
    score_2022 NUMERIC
);

COPY global_democracy_index
FROM 'C:\Users\Antonio\Desktop\global_democracy_index\global_democracy_index.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM global_democracy_index;