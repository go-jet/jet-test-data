DROP TABLE IF EXISTS `all_types`;

CREATE TABLE `all_types` (
-- boolean
                             `boolean` BOOLEAN NOT NULL DEFAULT FALSE,
                             `boolean_ptr` BOOLEAN,
-- ints
                             `tiny_int` TINYINT NOT NULL DEFAULT 0,
                             `tiny_int_ptr` TINYINT,
                             `small_int` SMALLINT NOT NULL DEFAULT 0,
                             `small_int_ptr` SMALLINT,
                             `medium_int` MEDIUMINT NOT NULL DEFAULT 0,
                             `medium_int_ptr` MEDIUMINT,
                             `integer` INT NOT NULL DEFAULT 0,
                             `integer_ptr` INT,
                             `big_int` bigint(20) NOT NULL DEFAULT 0,
                             `big_int_ptr` bigint(20),
-- floats
                             `decimal` decimal(5, 2) NOT NULL DEFAULT 0,
                             `decimal_ptr` decimal(5,2),
                             `numeric` numeric(5,2) NOT NULL DEFAULT 0,
                             `numeric_ptr` numeric(5, 2),
                             `float` float NOT NULL DEFAULT 0,
                             `float_ptr` float,
                             `double` double NOT NULL DEFAULT 0,
                             `double_ptr` double,
                             `real` real NOT NULL DEFAULT 0,
                             `real_ptr` real,
-- date and time
                             `time` time NOT NULL DEFAULT '00:00:00',
                             `time_ptr` time,
                             `date` date NOT NULL DEFAULT '2000-01-01',
                             `date_ptr` date,
                             `date_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00',
                             `date_time_ptr` datetime,
                             `timestamp` timestamp NOT NULL DEFAULT '2000-01-01 00:00:00',
                             `timestamp_ptr` timestamp,
-- strings
                             `char` char(20) NOT NULL DEFAULT 0,
                             `char_ptr` char(20),
                             `var_char` varchar(20) NOT NULL DEFAULT 0,
                             `var_char_ptr` varchar(20),
                             `text` text NOT NULL,
                             `text_ptr` text,
                             `blob` blob NOT NULL,
                             `blob_ptr` blob
);

INSERT INTO `all_types` VALUES
(false, 1,
 -3,3,14,14,-150,150,-1600,1600,5000,50000,
 1.11,1.01,2.22,2.02,3.33,3.03,4.44,4.04,5.55,5.05,
 '10:11:12.33', '10:11:12.123456', '2008-07-04','2008-07-04','2011-12-18 13:17:17','2011-12-18 13:17:17','2007-12-31 23:00:01','2007-12-31 23:00:01',
 'char1','char-ptr','varchar','varchar-ptr',
 'text','text-ptr', 'blob1','blob-ptr'),
(false, NULL,
 -3,NULL,14,NULL,-150,NULL,-1600,NULL,5000,NULL,
 1.11,NULL,2.22,NULL,3.33,NULL,4.44,NULL,5.55,NULL,
 '10:11:12.33', NULL, '2008-07-04',NULL,'2011-12-18 13:17:17',NULL,'2007-12-31 23:00:01',NULL,
 'char2',NULL,'varchar',NULL,'text',NULL,'blob2',NULL);

-- all types view

DROP VIEW IF EXISTS  all_types_view;

CREATE VIEW all_types_view AS
SELECT *
FROM all_types
LIMIT 2;

-- link

DROP TABLE IF EXISTS  link;

CREATE TABLE link (
                      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
                      url VARCHAR (255) NOT NULL DEFAULT 'www.',
                      name VARCHAR (255) NOT NULL DEFAULT '_',
                      description VARCHAR (255) DEFAULT NULL
);

INSERT INTO link (id, url, name)
VALUES (20, 'http://www.postgresqltutorial.com', 'PostgreSQL Tutorial'),
       (21, 'http://www.ask.com', 'Ask'),
       (22, 'http://www.ask.com', 'Ask'),
       (23, 'http://www.yahoo.com', 'Yahoo'),
       (24, 'http://www.bing.com', 'Bing');




DROP TABLE IF EXISTS `ReservedWords`;
CREATE TABLE `ReservedWords`(
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

INSERT INTO `ReservedWords`
VALUES('Column', 'CHECK', 'CEIL', 'COMMIT', 'CREATE', 'DEFAULT', 'DESC', 'EMPTY', 'FLOAT', 'JOIN', 'LIKE', 'MAX', 'RANK');

DROP TABLE IF EXISTS exact_decimals;
CREATE TABLE exact_decimals (
                                `decimal` TEXT NOT NULL DEFAULT 0,
                                `decimal_ptr` TEXT,
                                `numeric` TEXT NOT NULL DEFAULT 0,
                                `numeric_ptr` TEXT
);

INSERT INTO exact_decimals
VALUES('1.11111111111111111111', NULL, '2.22222222222222222222', NULL);



DROP TABLE IF EXISTS people;
CREATE TABLE people
(
    people_id           INTEGER primary key AUTOINCREMENT NOT NULL,
    people_name         TEXT NOT NULL,
    people_height_cm    DOUBLE,
    people_height_inch  REAL GENERATED ALWAYS AS ((people_height_cm / 2.54)) STORED,
    people_height_feet  REAL GENERATED ALWAYS AS ((people_height_cm *0.032808399)) VIRTUAL
);

INSERT INTO people (people_id, people_name, people_height_cm) VALUES
    (1, 'Alfredo', 170),
    (2, 'Bob', null),
    (3, 'Carla', 155);
