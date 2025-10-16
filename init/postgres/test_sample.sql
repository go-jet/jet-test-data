
-- AllTypes table -----------------------------

DROP SCHEMA IF EXISTS test_sample CASCADE;
CREATE SCHEMA test_sample;

-- enum
CREATE TYPE test_sample.mood AS ENUM ('sad', 'ok', 'happy');

-- AllTypes table -----------------------------
CREATE TABLE test_sample.all_types
(
    -- numeric
    small_int_ptr smallint,
    small_int smallint NOT NULL DEFAULT 0,
    integer_ptr  integer,
    integer integer NOT NULL DEFAULT 0,
    big_int_ptr   bigint,
    big_int bigint NOT NULL DEFAULT 0,
    decimal_ptr decimal(10, 2),
    decimal decimal(10, 2) NOT NULL DEFAULT 0,
    numeric_ptr numeric(20, 3),
    numeric numeric(20,3) NOT NULL DEFAULT 0,
    real_ptr    real,
    real        real NOT NULL DEFAULT 0,
    double_precision_ptr double precision,
    double_precision double precision NOT NULL DEFAULT 0,
    smallserial     smallserial NOT NULL,
    serial serial NOT NULL,
    bigserial bigserial NOT NULL,

    --monetary
--     money_ptr money,
--     money     money NOT NULL,

    var_char_ptr character varying(100),
    var_char character varying(200) NOT NULL DEFAULT 0,
    char_ptr character(80),
    char character(80) NOT NULL DEFAULT 0,
    text_ptr text,
    text text NOT NULL DEFAULT 0,

    --binary
    bytea_ptr bytea,
    bytea bytea NOT NULL DEFAULT '',

    --datetime
    timestampz_ptr timestamp with time zone,
    timestampz timestamp with time zone NOT NULL DEFAULT now(),
    timestamp_ptr timestamp without time zone,
    timestamp timestamp without time zone NOT NULL DEFAULT now(),
    date_ptr date,
    date date NOT NULL DEFAULT now(),
    timez_ptr time with time zone,
    timez time with time zone NOT NULL DEFAULT now(),
    time_ptr time without time zone,
    time time without time zone NOT NULL DEFAULT now(),
    interval_ptr interval,
    interval interval NOT NULL DEFAULT '1 hour',

    --boolean
    boolean_ptr boolean,
    boolean boolean NOT NULL DEFAULT false,

    --geometry
    point_ptr point,

    --bitstrings
    bit_ptr bit(3),
    bit bit(3) NOT NULL DEFAULT '000',
    bit_varying_ptr bit varying(20),
    bit_varying bit varying(40) NOT NULL DEFAULT '',

    --textsearch
    tsvector_ptr tsvector,
    tsvector tsvector NOT NULL DEFAULT '',

    --uuid
    uuid_ptr uuid,
    uuid uuid NOT NULL DEFAULT '00000000-00000000-00000000-00000000',

    --xml
    xml_ptr xml,
    xml xml NOT NULL DEFAULT '',

    --json
    json_ptr json,
    json json NOT NULL DEFAULT '{}',
    jsonb_ptr jsonb,
    jsonb jsonb NOT NULL DEFAULT '{}',

    --array
    integer_array_ptr integer[],
    integer_array     integer[] NOT NULL DEFAULT array[]::integer[],
    text_array_ptr    text[],
    text_array        text[] NOT NULL DEFAULT array[]::text[],
    jsonb_array       jsonb[] NOT NULL DEFAULT array[]::jsonb[],
    text_multi_dim_array_ptr text[][],
    text_multi_dim_array text[][] NOT NULL DEFAULT array[]::text[],

    -- enum
    mood_ptr test_sample.mood,
    mood test_sample.mood NOT NULL DEFAULT 'ok'
);

INSERT INTO test_sample.ALL_types(
    small_int_ptr, "small_int", integer_ptr, "integer", big_int_ptr, "big_int", decimal_ptr, "decimal", numeric_ptr, "numeric", real_ptr, "real", double_precision_ptr, double_precision, smallserial, serial, bigserial,
--     money_ptr, money,
    var_char_ptr, var_char, char_ptr, char, text_ptr, text,
    bytea_ptr, bytea,
    timestampz_ptr, timestampz, timestamp_ptr, "timestamp", date_ptr, date, timez_ptr, timez, time_ptr, "time", interval_ptr, "interval",
    boolean_ptr, "boolean",
    point_ptr,
    bit_ptr, "bit", bit_varying_ptr, bit_varying,
    tsvector_ptr, tsvector,
    uuid_ptr, uuid,
    xml_ptr, xml,
    json_ptr, json, jsonb_ptr, jsonb,
    integer_array_ptr, integer_array, text_array_ptr, text_array, jsonb_array, text_multi_dim_array_ptr, text_multi_dim_array,
    mood_ptr, mood)
VALUES (14, 14, 300, 300, 50000, 5000, 1.11, 1.11, 2.22, 2.22, 5.55, 5.55, 11111111.22, 11111111.22, DEFAULT, DEFAULT, DEFAULT,
--         100000, 100000,
        'ABBA', 'ABBA', 'JOHN', 'JOHN', 'Some text', 'Some text',
        'bytea', 'bytea',
        'January 8 04:05:06 1999 PST', 'January 8 04:05:06 1999 PST', '1999-01-08 04:05:06', '1999-01-08 04:05:06', '1999-01-08', '1999-01-08', '04:05:06 -8:00', '04:05:06 -8:00', '04:05:06', '04:05:06', '3 4:05:06', '3 4:05:06',
        TRUE, FALSE,
        '(2,3)',
        B'101', B'101', B'101111', B'101111',
        to_tsvector('supernovae'), to_tsvector('supernovae'),
        'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11', 'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
        '<Sub>abc</Sub>', '<Sub>abc</Sub>',
        '{"a": 1, "b": 3}', '{"a": 1, "b": 3}', '{"a": 1, "b": 3}', '{"a": 1, "b": 3}',
        '{1, 2, 3}', '{1, 2, 3}', '{"breakfast", "consulting"}', '{"breakfast", "consulting"}', ARRAY['{"a": 1, "b": 2}'::jsonb, '{"a":3, "b": 4}'::jsonb], '{{"meeting", "lunch"}, {"training", "presentation"}}', '{{"meeting", "lunch"}, {"training", "presentation"}}',
        'sad', 'happy'
       ),
       (NULL, 14, NULL, 300, NULL, 5000, NULL, 1.11, NULL, 2.22, NULL, 5.55, NULL, 11111111.22, DEFAULT, DEFAULT, DEFAULT,
--         NULL, 100000,
        NULL, 'ABBA', NULL, 'JOHN', NULL, 'Some text',
        NULL, 'bytea',
        NULL, 'January 8 04:05:06 1999 PST', NULL, '1999-01-08 04:05:06', NULL, '1999-01-08', NULL, '04:05:06 -8:00', NULL, '04:05:06', NULL, '3 4:05:06',
        NULL, FALSE,
        NULL,
        NULL, B'101', NULL, B'101111',
        NULL, to_tsvector('supernovae'),
        NULL, 'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
        NULL, '<Sub>abc</Sub>',
        NULL, '{"a": 1, "b": 3}', NULL, '{"a": 1, "b": 3}',
        NULL, '{1, 2, 3}', NULL, '{"breakfast", "consulting"}', ARRAY['{"a": 1, "b": 2}'::jsonb, '{"a":3, "b": 4}'::jsonb], NULL, '{{"meeting", "lunch"}, {"training", "presentation"}}',
        NULL, 'ok'
       );

-- Link table --------------------
CREATE TABLE IF NOT EXISTS test_sample.link (
    id BIGSERIAL PRIMARY KEY,
    url VARCHAR (255) NOT NULL,
    name VARCHAR (255) NOT NULL,
    description VARCHAR (255)
);

COMMENT ON TABLE test_sample.link IS 'Link table';

COMMENT ON COLUMN test_sample.link.id IS 'this is link id';

COMMENT ON COLUMN test_sample.link.url IS 'link url';

COMMENT ON COLUMN test_sample.link.name IS 'Unicode characters comment ₲鬼佬℧⇄↻';

COMMENT ON COLUMN test_sample.link.description IS E'''\"\b\n\r\t\Z\\\%\_';

INSERT INTO test_sample.link (id, url, name, description) VALUES
    (0, 'http://www.youtube.com', 'Youtube' , ''),
    (1, 'www.gmail.com', 'Gmail', 'Email service developed by Google'),
    (2, 'www.outlook.live.com', 'Outlook', 'Email service developed by Microsoft'),
    (200, 'http://www.postgresqltutorial.com', 'PostgreSQL Tutorial', DEFAULT),
    (201, 'http://www.ask.com', 'Ask', DEFAULT),
    (202, 'http://www.ask.com', 'Ask', DEFAULT),
    (203, 'http://www.yahoo.com', 'Yahoo', DEFAULT),
    (204, 'http://www.bing.com', 'Bing', DEFAULT);

-- fix for https://stackoverflow.com/questions/4448340/postgresql-duplicate-key-violates-unique-constraint
SELECT SETVAL((SELECT PG_GET_SERIAL_SEQUENCE('test_sample.link', 'id')), (SELECT (MAX(id) + 1) FROM test_sample.link), FALSE);

-- Employee table ---------------
CREATE TABLE test_sample.employee (
  employee_id INT PRIMARY KEY,
  first_name VARCHAR (255) NOT NULL,
  last_name VARCHAR (255) NOT NULL,
  employment_date timestamp with time zone,
  manager_id INT,
  pto_accrual interval,
  FOREIGN KEY (manager_id)
      REFERENCES test_sample.employee (employee_id)
      ON DELETE CASCADE
);
INSERT INTO test_sample.employee (
    employee_id,
    first_name,
    last_name,
    employment_date,
    manager_id,
    pto_accrual 
)
VALUES
(1, 'Windy', 'Hays', '1999-01-08 04:05:06.100 +1:00', NULL, '22h'),
(2, 'Ava', 'Christensen', '1999-01-08 04:05:06 +1:00', 1, NULL),
(3, 'Hassan', 'Conner', '1999-01-08 04:05:06 +1:00', 1, '5h'),
(4, 'Anna', 'Reeves', '1999-01-08 04:05:06 +1:00', 2, '3h42m'),
(5, 'Sau', 'Norman', '1999-01-08 04:05:06 +1:00', 2, '42days'),
(6, 'Kelsie', 'Hays', '1999-01-08 04:05:06 +1:00', 3, '1h'),
(7, 'Tory', 'Goff', '1999-01-08 04:05:06 +1:00', 3, '36m'),
(8, 'Salley', 'Lester', '1999-01-08 04:05:06 +1:00', 3, NULL);


-- Person table ------------------
CREATE TABLE test_sample.person(
    person_id uuid NOT NULL PRIMARY KEY,
    first_name varchar(100),
    last_name varchar(100),
    "Mood" test_sample.mood
);

INSERT INTO test_sample.person(person_id, first_name, last_name, "Mood") VALUES
     ('b68dbff4-a87d-11e9-a7f2-98ded00c39c6', 'Sad', 'John', 'sad'),
     ('b68dbff5-a87d-11e9-a7f2-98ded00c39c7', 'Ok', 'John', 'ok'),
     ('b68dbff6-a87d-11e9-a7f2-98ded00c39c8', 'Ok', 'John', 'ok');

CREATE TABLE test_sample.person_phone(
    phone_id uuid NOT NULL PRIMARY KEY,
    phone_number VARCHAR(255),
    person_id uuid NOT NULL,
    FOREIGN KEY (person_id) REFERENCES test_sample.person(person_id)
);

INSERT INTO test_sample.person_phone(phone_id, phone_number, person_id) VALUES
    ('02b61cc4-d500-4847-bd36-111eccbc7a51', '212-555-1211', 'b68dbff4-a87d-11e9-a7f2-98ded00c39c6'),
    ('02b61cc4-d500-4847-bd36-111eccbc7a52', '212-555-1212', 'b68dbff6-a87d-11e9-a7f2-98ded00c39c8'),
    ('02b61cc4-d500-4847-bd36-111eccbc7a53', '212-555-1213', 'b68dbff6-a87d-11e9-a7f2-98ded00c39c8');

-- WEIRD TABLE NAMES --------------
CREATE TABLE test_sample."WEIRD NAMES TABLE"(
    "weird_column_name1" varchar(100) NOT NULL,
    "Weird_Column_Name2" varchar(100) NOT NULL,
    "wEiRd_cOluMn_nAmE3" varchar(100) NOT NULL,
    "WeIrd_CoLuMN_Name4" varchar(100) NOT NULL,
    "WEIRD_COLUMN_NAME5" varchar(100) NOT NULL,

    "WeirdColumnName6" varchar(100) NOT NULL,
    "weirdColumnName7" varchar(100) NOT NULL,
    "weirdcolumnname8" varchar(100),

    "weird col name9" varchar(100) NOT NULL,
    "wEiRd cOlu nAmE10" varchar(100) NOT NULL,
    "WEIRD COLU NAME11" varchar(100) NOT NULL,
    "Weird Colu Name12" varchar(100) NOT NULL,

    "weird-col-name13" varchar(100) NOT NULL,
    "wEiRd-cOlu-nAmE14" varchar(100) NOT NULL,
    "WEIRD-COLU-NAME15" varchar(100) NOT NULL,
    "Weird-Colu-Name16" varchar(100) NOT NULL
);

INSERT INTO test_sample."WEIRD NAMES TABLE"
VALUES ('Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe','Doe', 'Doe', 'Doe', 'Doe');

CREATE OR REPLACE VIEW test_sample.all_types_view AS
SELECT all_types.small_int_ptr AS "small_int_ptr",
       all_types.small_int AS "small_int",
       all_types.integer_ptr AS "integer_ptr",
       all_types.integer AS "integer",
       all_types.big_int_ptr AS "big_int_ptr",
       all_types.big_int AS "big_int",
       all_types.decimal_ptr AS "decimal_ptr",
       all_types.decimal AS "decimal",
       all_types.numeric_ptr AS "numeric_ptr",
       all_types.numeric AS "numeric",
       all_types.real_ptr AS "real_ptr",
       all_types.real AS "real",
       all_types.double_precision_ptr AS "double_precision_ptr",
       all_types.double_precision AS "double_precision",
       all_types.smallserial AS "smallserial",
       all_types.serial AS "serial",
       all_types.bigserial AS "bigserial",
       all_types.var_char_ptr AS "var_char_ptr",
       all_types.var_char AS "var_char",
       all_types.char_ptr AS "char_ptr",
       all_types.char AS "char",
       all_types.text_ptr AS "text_ptr",
       all_types.text AS "text",
       all_types.bytea_ptr AS "bytea_ptr",
       all_types.bytea AS "bytea",
       all_types.timestampz_ptr AS "timestampz_ptr",
       all_types.timestampz AS "timestampz",
       all_types.timestamp_ptr AS "timestamp_ptr",
       all_types.timestamp AS "timestamp",
       all_types.date_ptr AS "date_ptr",
       all_types.date AS "date",
       all_types.timez_ptr AS "timez_ptr",
       all_types.timez AS "timez",
       all_types.time_ptr AS "time_ptr",
       all_types.time AS "time",
       all_types.interval_ptr AS "interval_ptr",
       all_types.interval AS "interval",
       all_types.boolean_ptr AS "boolean_ptr",
       all_types.boolean AS "boolean",
       all_types.point_ptr AS "point_ptr",
       all_types.bit_ptr AS "bit_ptr",
       all_types.bit AS "bit",
       all_types.bit_varying_ptr AS "bit_varying_ptr",
       all_types.bit_varying AS "bit_varying",
       all_types.tsvector_ptr AS "tsvector_ptr",
       all_types.tsvector AS "tsvector",
       all_types.uuid_ptr AS "uuid_ptr",
       all_types.uuid AS "uuid",
       all_types.xml_ptr AS "xml_ptr",
       all_types.xml AS "xml",
       all_types.json_ptr AS "json_ptr",
       all_types.json AS "json",
       all_types.jsonb_ptr AS "jsonb_ptr",
       all_types.jsonb AS "jsonb",
       all_types.integer_array_ptr AS "integer_array_ptr",
       all_types.integer_array AS "integer_array",
       all_types.text_array_ptr AS "text_array_ptr",
       all_types.text_array AS "text_array",
       all_types.jsonb_array AS "jsonb_array",
       all_types.text_multi_dim_array_ptr AS "text_multi_dim_array_ptr",
       all_types.text_multi_dim_array AS "text_multi_dim_array",
       all_types.mood_ptr AS "mood_ptr",
       all_types.mood AS "mood"
FROM test_sample.all_types;

-- Materialized view
CREATE MATERIALIZED VIEW test_sample.all_types_materialized_view AS
SELECT *
FROM test_sample.all_types;

REFRESH MATERIALIZED VIEW test_sample.all_types_materialized_view;

-- Level enum
CREATE TYPE test_sample.Level AS ENUM ('1', '2', '3', '4', '5');

COMMENT ON TYPE test_sample.Level IS 'Level enum';

-- Reserved words for table and column names
CREATE TABLE test_sample."User"(
        id bigserial PRIMARY KEY,
        "column" varchar(100) NOT NULL,
        "check" varchar(100) NOT NULL,
        "ceil" varchar(100) NOT NULL,
        "commit" varchar(100) NOT NULL,
        "create" varchar(100) NOT NULL,
        "default" varchar(100) NOT NULL,
        "desc" varchar(100) NOT NULL,
        "empty" varchar(100) NOT NULL,
        "float" varchar(100) NOT NULL,
        "join" varchar(100) NOT NULL,
        "like" varchar(100) NOT NULL,
        "max" varchar(100) NOT NULL,
        "rank" varchar(100) NOT NULL
);

INSERT INTO test_sample."User"
VALUES(0, 'Column', 'CHECK', 'CEIL', 'COMMIT', 'CREATE', 'DEFAULT', 'DESC', 'EMPTY', 'FLOAT', 'JOIN', 'LIKE', 'MAX', 'RANK');

CREATE TABLE test_sample.floats
(
    id bigserial PRIMARY KEY,
    decimal_ptr decimal(30, 20),
    decimal decimal(30, 20) NOT NULL DEFAULT 0,
    numeric_ptr numeric(30, 20),
    numeric numeric(30, 20) NOT NULL DEFAULT 0,
    real_ptr    real,
    real        real NOT NULL DEFAULT 0,
    double_ptr double precision,
    double double precision NOT NULL DEFAULT 0
);

INSERT INTO test_sample.floats
VALUES(0, NULL, '1.11111111111111111111', NULL, '2.22222222222222222222', NULL, '3.333333333333333333', NULL, '4.44444444444444444444');

-- Generated column
CREATE TABLE test_sample.people
(
    people_id        serial primary key,
    people_name      varchar(15) NOT NULL,
    people_height_cm numeric,
    people_height_in numeric GENERATED ALWAYS AS ((people_height_cm / 2.54)) STORED
);

INSERT INTO test_sample.people (people_name, people_height_cm) VALUES
    ('Alfredo', 170),
    ('Bob', null),
    ('Carla', 155);


--
CREATE TABLE test_sample.components (
    id text primary key,
    parent_id text,
    FOREIGN KEY (parent_id) REFERENCES test_sample.components (id)
);

INSERT INTO test_sample.components VALUES
    ('component_00', null), ('component_01', 'component_00'), ('component_02', 'component_00');

CREATE TABLE test_sample.vulnerabilities (
    id text primary key,
    components_id text,
    FOREIGN KEY (components_id) REFERENCES test_sample.components(id)
);

INSERT INTO test_sample.vulnerabilities VALUES
    ('vulnerability_00', 'component_00'),('vulnerability_01', 'component_00'),('vulnerability_02', 'component_00'),('vulnerability_03', 'component_00'),
    ('vulnerability_11', 'component_01'),('vulnerability_12', 'component_01'),
    ('vulnerability_21', 'component_02');

--- Range fields table; contains all range types that currently supported
CREATE TABLE test_sample.sample_ranges (
      date_range daterange NOT NULL DEFAULT daterange('2024-01-01', '2024-01-10'),
      timestamp_range tsrange NOT NULL DEFAULT tsrange('2024-01-01 00:00:00', '2024-01-10 00:00:00'),
      timestampz_range tstzrange NOT NULL DEFAULT tstzrange('2024-01-01 00:00:00 +02', '2024-01-10 00:00:00 +02'),
      int4_range int4range NOT NULL DEFAULT int4range(0, 10),
      int8_range int8range NOT NULL DEFAULT int8range(0, 10),
      num_range numrange NOT NULL DEFAULT numrange(0, 10)
);

INSERT INTO test_sample.sample_ranges (date_range, timestamp_range, timestampz_range, int4_range, int8_range, num_range)
    VALUES ('[2023-09-25, 2024-02-10)','[2020-01-01 00:00:00, 2021-01-01 15:00:00]','[2024-05-07 17:00:00 +02,2024-10-11 16:00:00 +02)','[11,20)','[200,2450)','[2000,5000)');


--- Array fields table; contains all the array types that are currently supported
CREATE TABLE test_sample.sample_arrays (
    id              serial PRIMARY KEY,

    bool_array      bool[],

    int2_array_ptr  int2[] NULL,
    int4_array      int4[] NOT NULL DEFAULT array[]::int4[],
    int8_array      int8[] NOT NULL DEFAULT array[]::int8[],

    numeric_array   numeric[] NOT NULL,
    decimal_array   decimal[] NOT NULL,
    real_array      real[] NOT NULL,
    double_array    double precision[] NOT NULL,

    text_array      text[] NOT NULL DEFAULT array[]::text[],
    varchar_array   varchar[] NOT NULL,
    char_array      char[] NOT NULL,
    bytea_array     bytea[] NOT NULL,

    date_array          date[] NOT NULL,
    timestamp_array     timestamp[],
    timestamptz_array   timestamptz[] NOT NULL,
    time_array          time[] NOT NULL,
    timetz_array        timetz[] NOT NULL,
    interval_array      interval[] NOT NULL,

    uuid_array          uuid[] NOT NULL,
    mood_enum_array     test_sample.mood[] NOT NULL
);

INSERT INTO test_sample.sample_arrays
VALUES (
    1,
    '{true, false, true}',
    '{1, 2, 3, 4}',
    '{10, 20, 30, 40}',
    '{100, 200, 300, 400}',
    '{1.8881, 2.8882, 3.8883, 4.8884}',
    '{1.0001, 2.0002, 3.0003, 4.0004}',
    '{1.01, 2.02, 3.03, 4.04}',
    '{11.11, 22.22, 33.33}',
    '{"alpha", "beta", "gama"}',
    '{"hello", "world"}',
    '{a, b, c}',
    ARRAY[E'\\x01020304'::bytea, E'\\x11223344'::bytea],

    '{2024-11-01,2025-02-28}',
    '{2025-01-01 10:00,2025-02-01 10:00}',
    '{2025-01-01 10:00+01,2025-02-01 10:00+01}',
    '{12:00,13:00}',
    '{12:00+01,13:00+02}',
    '{1 day, 2 hours}',

    '{550e8400-e29b-41d4-a716-446655440000}',
    '{happy,ok}'
);