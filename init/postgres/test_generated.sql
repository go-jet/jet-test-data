CREATE SCHEMA IF NOT EXISTS test_generated;

DROP TABLE IF EXISTS test_generated.people CASCADE;

CREATE TABLE test_generated.people
(
    people_id        integer primary key,
    people_name      varchar(15) NOT NULL,
    people_height_cm numeric,
    people_height_in numeric GENERATED ALWAYS AS ((people_height_cm / 2.54)) STORED
);

INSERT INTO test_generated.people (people_id, people_name, people_height_cm) VALUES
    (1, 'Alfredo', 170),
    (2, 'Bob', null),
    (3, 'Carla', 155);
