-- MySQL dump 10.13  Distrib 8.0.16, for Linux (x86_64)


--
-- Table structure for table `all_types8`
--

DROP TABLE IF EXISTS `all_types`;

CREATE TABLE `all_types` (
    `boolean` BOOLEAN NOT NULL DEFAULT FALSE,
    `boolean_ptr` BOOLEAN,

    `tiny_int` TINYINT NOT NULL DEFAULT 0,
    `u_tiny_int` TINYINT unsigned NOT NULL DEFAULT 0,

    `small_int` SMALLINT NOT NULL DEFAULT 0,
    `u_small_int` SMALLINT unsigned NOT NULL DEFAULT 0,

    `medium_int` MEDIUMINT NOT NULL DEFAULT 0,
    `u_medium_int` MEDIUMINT unsigned NOT NULL DEFAULT 0,

    `integer` INT NOT NULL DEFAULT 0,
    `u_integer` INT unsigned NOT NULL DEFAULT 0,

    `big_int` bigint(20) NOT NULL DEFAULT 0,
    `u_big_int` bigint(20) unsigned NOT NULL DEFAULT 0,

-- ptr

    `tiny_int_ptr` TINYINT,
    `u_tiny_int_ptr` TINYINT unsigned,

    `small_int_ptr` SMALLINT,
    `u_small_int_ptr` SMALLINT unsigned,

    `medium_int_ptr` MEDIUMINT,
    `u_medium_int_ptr` MEDIUMINT unsigned,

    `integer_ptr` INT,
    `u_integer_ptr` INT unsigned,

    `big_int_ptr` bigint(20),
    `u_big_int_ptr` bigint(20) unsigned,


-- floats
    `decimal` decimal(5, 2) unsigned NOT NULL DEFAULT 0,
    `decimal_ptr` decimal(5,2),

    `numeric` numeric(5,2) NOT NULL DEFAULT 0,
    `numeric_ptr` numeric(5, 2),

    `float` float NOT NULL DEFAULT 0,
    `float_ptr` float,

    `double` double NOT NULL DEFAULT 0,
    `double_ptr` double,

    `real` real NOT NULL DEFAULT 0,
    `real_ptr` real,

-- bit values

    `bit` bit(10) NOT NULL DEFAULT 0,
    `bit_ptr` bit(10),

-- date and time
    `time` time NOT NULL DEFAULT '00:00:00',
    `time_ptr` time,

    `date` date NOT NULL DEFAULT '2000-01-01',
    `date_ptr` date,

    `date_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
    `date_time_ptr` datetime,

    `timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
    `timestamp_ptr` timestamp,

    `year` year NOT NULL DEFAULT 2000,
    `year_ptr` year,

-- strings

    `char` char(20) NOT NULL DEFAULT 0,
    `char_ptr` char(20),

    `var_char` varchar(20) NOT NULL DEFAULT 0,
    `var_char_ptr` varchar(20),

    `binary` binary(20) NOT NULL DEFAULT 0,
    `binary_ptr` binary(20),

    `var_binary` varbinary(20) NOT NULL DEFAULT 0,
    `var_binary_ptr` varbinary(20),

    `blob` blob NOT NULL,
    `blob_ptr` blob,

    `text` text NOT NULL,
    `text_ptr` text,

    `enum` enum('value1', 'value2', 'value3') NOT NULL DEFAULT 'value1',
    `enum_ptr` enum('value1', 'value2', 'value3'),

    `set` set('s1', 's2', 's3') NOT NULL DEFAULT 's1',
    `set_ptr` set('s1', 's2', 's3'),

-- json

    `json` json NOT NULL,
    `json_ptr` json

    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `all_types` VALUES
    (false, true,
    -3,3,14,14,-150,150,-1600,1600,5000,50000,
    -3,3,14,14,-150,150,-1600,1600,50000,50000,
    1.11,1.11,2.22,2.22,3.33,3.33,4.44,4.44,5.55,5.55,
    _binary '\0',_binary '\0',
    '10:11:12.33', '10:11:12.33', '2008-07-04','2008-07-04','2011-12-18 13:17:17','2011-12-18 13:17:17','2007-12-31 23:00:01','2007-12-31 23:00:01',2004,2004,'char','char','varchar','varchar',_binary 'binary\0\0\0\0\0\0\0\0\0\0\0\0\0\0',_binary 'binary\0\0\0\0\0\0\0\0\0\0\0\0\0\0',_binary 'varbinary',_binary 'varbinary',_binary 'blob',_binary 'blob','text','text','value1','value1','s1','s2','{\"key1\": \"value1\", \"key2\": \"value2\"}','{\"key1\": \"value1\", \"key2\": \"value2\"}'),
    (false, NULL,
    -3,3,14,14,-150,150,-1600,1600,5000,50000,
    NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,
    1.11,NULL,2.22,NULL,3.33,NULL,4.44,NULL,5.55,NULL,
    _binary '\0',NULL,
    '10:11:12.33', NULL, '2008-07-04',NULL,'2011-12-18 13:17:17',NULL,'2007-12-31 23:00:01',NULL,2004,NULL,'char',NULL,'varchar',NULL,_binary 'binary\0\0\0\0\0\0\0\0\0\0\0\0\0\0',NULL,_binary 'varbinary',NULL,_binary 'blob',NULL,'text',NULL,'value1',NULL,'s1',NULL,'{\"key1\": \"value1\", \"key2\": \"value2\"}',NULL);



-- Link table --------------------

DROP TABLE IF EXISTS test_sample.link;

CREATE TABLE IF NOT EXISTS test_sample.link (
                                                id int PRIMARY KEY AUTO_INCREMENT,
                                                url VARCHAR (255) NOT NULL,
                                                name VARCHAR (255) NOT NULL,
                                                description VARCHAR (255)
);

INSERT INTO test_sample.link (ID, url, name, description) VALUES
(0, 'http://www.youtube.com', 'Youtube' , '');

-- Link2 table --------------------

DROP TABLE IF EXISTS test_sample.link2;

CREATE TABLE IF NOT EXISTS test_sample.link2 (
                                                 id int PRIMARY KEY AUTO_INCREMENT,
                                                 url VARCHAR (255) NOT NULL,
                                                 name VARCHAR (255) NOT NULL,
                                                 description VARCHAR (255)
);

INSERT INTO test_sample.link2 (ID, url, name, description) VALUES
(0, 'http://www.youtube.com', 'Youtube' , '');

CREATE OR REPLACE VIEW test_sample.all_types_view AS
SELECT all_types.boolean AS "boolean",
       all_types.boolean_ptr AS "boolean_ptr",
       all_types.tiny_int AS "tiny_int",
       all_types.u_tiny_int AS "u_tiny_int",
       all_types.small_int AS "small_int",
       all_types.u_small_int AS "u_small_int",
       all_types.medium_int AS "medium_int",
       all_types.u_medium_int AS "u_medium_int",
       all_types.integer AS "integer",
       all_types.u_integer AS "u_integer",
       all_types.big_int AS "big_int",
       all_types.u_big_int AS "u_big_int",
       all_types.tiny_int_ptr AS "tiny_int_ptr",
       all_types.u_tiny_int_ptr AS "u_tiny_int_ptr",
       all_types.small_int_ptr AS "small_int_ptr",
       all_types.u_small_int_ptr AS "u_small_int_ptr",
       all_types.medium_int_ptr AS "medium_int_ptr",
       all_types.u_medium_int_ptr AS "u_medium_int_ptr",
       all_types.integer_ptr AS "integer_ptr",
       all_types.u_integer_ptr AS "u_integer_ptr",
       all_types.big_int_ptr AS "big_int_ptr",
       all_types.u_big_int_ptr AS "u_big_int_ptr",
       all_types.decimal AS "decimal",
       all_types.decimal_ptr AS "decimal_ptr",
       all_types.numeric AS "numeric",
       all_types.numeric_ptr AS "numeric_ptr",
       all_types.float AS "float",
       all_types.float_ptr AS "float_ptr",
       all_types.double AS "double",
       all_types.double_ptr AS "double_ptr",
       all_types.real AS "real",
       all_types.real_ptr AS "real_ptr",
       all_types.bit AS "bit",
       all_types.bit_ptr AS "bit_ptr",
       all_types.time AS "time",
       all_types.time_ptr AS "time_ptr",
       all_types.date AS "date",
       all_types.date_ptr AS "date_ptr",
       all_types.date_time AS "date_time",
       all_types.date_time_ptr AS "date_time_ptr",
       all_types.timestamp AS "timestamp",
       all_types.timestamp_ptr AS "timestamp_ptr",
       all_types.year AS "year",
       all_types.year_ptr AS "year_ptr",
       all_types.char AS "char",
       all_types.char_ptr AS "char_ptr",
       all_types.var_char AS "var_char",
       all_types.var_char_ptr AS "var_char_ptr",
       all_types.binary AS "binary",
       all_types.binary_ptr AS "binary_ptr",
       all_types.var_binary AS "var_binary",
       all_types.var_binary_ptr AS "var_binary_ptr",
       all_types.blob AS "blob",
       all_types.blob_ptr AS "blob_ptr",
       all_types.text AS "text",
       all_types.text_ptr AS "text_ptr",
       all_types.enum AS "enum",
       all_types.enum_ptr AS "enum_ptr",
       all_types.set AS "set",
       all_types.set_ptr AS "set_ptr",
       all_types.json AS "json",
       all_types.json_ptr AS "json_ptr"
FROM test_sample.all_types
LIMIT 2;

-- Reserved words for table and column names
DROP TABLE IF EXISTS test_sample.user CASCADE;
CREATE TABLE test_sample.user(
    `column` varchar(100) NOT NULL,
    `use` varchar(100) NOT NULL,
    `ceil` varchar(100) NOT NULL,
    `commit` varchar(100) NOT NULL,
    `create` varchar(100) NOT NULL,
    `default` varchar(100) NOT NULL,
    `desc` varchar(100) NOT NULL,
    `empty` varchar(100) NOT NULL,
    `float` varchar(100) NOT NULL,
    `join` varchar(100) NOT NULL,
    `like` varchar(100) NOT NULL,
    `max` varchar(100) NOT NULL,
    `rank` varchar(100) NOT NULL
);

INSERT INTO test_sample.user
VALUES('Column', 'CHECK', 'CEIL', 'COMMIT', 'CREATE', 'DEFAULT', 'DESC', 'EMPTY', 'FLOAT', 'JOIN', 'LIKE', 'MAX', 'RANK');
