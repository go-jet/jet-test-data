-- Sakila Sample Database Schema
-- Version 1.0

-- Copyright (c) 2006, 2015, Oracle and/or its affiliates.
-- All rights reserved.

-- Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

--  * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
--  * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
--  * Neither the name of Oracle nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS dvds2;
CREATE SCHEMA dvds2;
USE dvds2;


CREATE TABLE film (
                      film_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
                      title VARCHAR(255) NOT NULL,
                      description TEXT DEFAULT NULL,
                      release_year YEAR DEFAULT NULL,
                      language_id TINYINT UNSIGNED NOT NULL,
                      original_language_id TINYINT UNSIGNED DEFAULT NULL,
                      rental_duration TINYINT UNSIGNED NOT NULL DEFAULT 3,
                      rental_rate DECIMAL(4,2) NOT NULL DEFAULT 4.99,
                      length SMALLINT UNSIGNED DEFAULT NULL,
                      replacement_cost DECIMAL(5,2) NOT NULL DEFAULT 19.99,
                      rating ENUM('G','PG','PG-13','R','NC-17') DEFAULT 'G',
                      special_features SET('Trailers','Commentaries','Deleted Scenes','Behind the Scenes') DEFAULT NULL,
                      last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                      PRIMARY KEY  (film_id),
                      KEY idx_title (title),
                      KEY idx_fk_language_id (language_id),
                      KEY idx_fk_original_language_id (original_language_id),
                      CONSTRAINT fk_film_language FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE,
                      CONSTRAINT fk_film_language_original FOREIGN KEY (original_language_id) REFERENCES language (language_id) ON DELETE RESTRICT ON UPDATE CASCADE
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE language (
                          language_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
                          name CHAR(20) NOT NULL,
                          last_update TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                          PRIMARY KEY (language_id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO film VALUES (1,'ACADEMY DINOSAUR','A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies',2006,1,NULL,6,'0.99',86,'20.99','PG','Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),
                        (2,'ACE GOLDFINGER','A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China',2006,1,NULL,3,'4.99',48,'12.99','G','Trailers,Deleted Scenes','2006-02-15 05:03:42'),
                        (3,'ADAPTATION HOLES','A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory',2006,1,NULL,7,'2.99',50,'18.99','NC-17','Trailers,Deleted Scenes','2006-02-15 05:03:42'),
                        (4,'AFFAIR PREJUDICE','A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank',2006,1,NULL,5,'2.99',117,'26.99','G','Commentaries,Behind the Scenes','2006-02-15 05:03:42'),
                        (5,'AFRICAN EGG','A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico',2006,1,NULL,6,'2.99',130,'22.99','G','Deleted Scenes','2006-02-15 05:03:42'),
                        (6,'AGENT TRUMAN','A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China',2006,1,NULL,3,'2.99',169,'17.99','PG','Deleted Scenes','2006-02-15 05:03:42'),
                        (7,'AIRPLANE SIERRA','A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat',2006,1,NULL,6,'4.99',62,'28.99','PG-13','Trailers,Deleted Scenes','2006-02-15 05:03:42'),
                        (8,'AIRPORT POLLOCK','A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India',2006,1,NULL,6,'4.99',54,'15.99','R','Trailers','2006-02-15 05:03:42'),
                        (9,'ALABAMA DEVIL','A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat',2006,1,NULL,3,'2.99',114,'21.99','PG-13','Trailers,Deleted Scenes','2006-02-15 05:03:42'),
                        (10,'ALADDIN CALENDAR','A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China',2006,1,NULL,6,'4.99',63,'24.99','NC-17','Trailers,Deleted Scenes','2006-02-15 05:03:42'),
                        (11,'ALAMO VIDEOTAPE','A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention',2006,1,NULL,6,'0.99',126,'16.99','G','Commentaries,Behind the Scenes','2006-02-15 05:03:42'),
                        (12,'ALASKA PHANTOM','A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia',2006,1,NULL,6,'0.99',136,'22.99','PG','Commentaries,Deleted Scenes','2006-02-15 05:03:42'),
                        (13,'ALI FOREVER','A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies',2006,1,NULL,4,'4.99',150,'21.99','PG','Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42'),
                        (14,'ALICE FANTASIA','A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia',2006,1,NULL,6,'0.99',94,'23.99','NC-17','Trailers,Deleted Scenes,Behind the Scenes','2006-02-15 05:03:42');

INSERT INTO language VALUES (1,'English','2006-02-15 05:02:19'),
                            (2,'Italian','2006-02-15 05:02:19'),
                            (3,'Japanese','2006-02-15 05:02:19'),
                            (4,'Mandarin','2006-02-15 05:02:19'),
                            (5,'French','2006-02-15 05:02:19'),
                            (6,'German','2006-02-15 05:02:19');

