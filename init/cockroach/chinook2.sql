/*******************************************************************************
   Chinook Database - Version 1.4
   Script: Chinook_PostgreSql.sql
   Description: Creates and populates the Chinook database.
   DB Server: PostgreSql
   Author: Luis Rocha
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/

USE jetdb;

DROP SCHEMA IF EXISTS chinook2 cascade;

CREATE SCHEMA chinook2;


SET search_path TO chinook2;

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TYPE "AlbumType" AS ENUM
    (
    'Studio',
    'Live',
    'Solo'
);

CREATE TABLE "Album"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    "Type" "AlbumType" NOT NULL DEFAULT 'Studio',
    CONSTRAINT "PK_Album" PRIMARY KEY  ("AlbumId")
);

CREATE TABLE "Artist"
(
    "ArtistId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_Artist" PRIMARY KEY  ("ArtistId")
);


INSERT INTO "Artist" ("ArtistId", "Name") VALUES (7, 'Apocalyptica');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (8, 'Audioslave');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (9, 'BackBeat');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (10, 'Billy Cobham');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (11, 'Black Label Society');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (12, 'Black Sabbath');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (13, 'Body Count');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (14, 'Bruce Dickinson');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (15, 'Buddy Guy');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (16, 'Caetano Veloso');


INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (2, 'Balls to the Wall', 2);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (3, 'Restless and Wild', 2);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (4, 'Let There Be Rock', 1);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (5, 'Big Ones', 3);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (6, 'Jagged Little Pill', 4);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (7, 'Facelift', 5);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (8, 'Warner 25 Anos', 6);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (9, 'Plays Metallica By Four Cellos', 7);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (10, 'Audioslave', 8);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (11, 'Out Of Exile', 8);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (12, 'BackBeat Soundtrack', 9);

/* Table prefix multi-tenant */

CREATE TABLE "tenant1.Album"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "prefix_tenant1_PK_Album" PRIMARY KEY  ("AlbumId")
);

CREATE TABLE "tenant2.Album"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "prefix_tenant2_PK_Album" PRIMARY KEY  ("AlbumId")
);

INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (80, 'In Your Honor [Disc 2]', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (81, 'One By One', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (82, 'The Colour And The Shape', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (83, 'My Way: The Best Of Frank Sinatra [Disc 1]', 85);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (84, 'Roda De Funk', 86);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (85, 'As Can��es de Eu Tu Eles', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (86, 'Quanta Gente Veio Ver (Live)', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (87, 'Quanta Gente Veio ver--B�nus De Carnaval', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (88, 'Faceless', 87);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (89, 'American Idiot', 54);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (90, 'Appetite for Destruction', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (91, 'Use Your Illusion I', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (92, 'Use Your Illusion II', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (93, 'Blue Moods', 89);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (94, 'A Matter of Life and Death', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (95, 'A Real Dead One', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (96, 'A Real Live One', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (97, 'Brave New World', 90);

INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (152, 'Master Of Puppets', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (153, 'ReLoad', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (154, 'Ride The Lightning', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (155, 'St. Anger', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (156, '...And Justice For All', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (157, 'Miles Ahead', 68);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (158, 'Milton Nascimento Ao Vivo', 42);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (159, 'Minas', 42);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (160, 'Ace Of Spades', 106);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (161, 'Demorou...', 108);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (162, 'Motley Crue Greatest Hits', 109);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (163, 'From The Muddy Banks Of The Wishkah [Live]', 110);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (164, 'Nevermind', 110);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (165, 'Compositores', 111);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (166, 'Olodum', 112);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (167, 'Ac�stico MTV', 113);


/* Table postfix multi-tenant */

CREATE TABLE "Album.tenant1"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "postfix_tenant1_PK_Album" PRIMARY KEY  ("AlbumId")
);

CREATE TABLE "Album.tenant2"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "postfix_tenant2_PK_Album" PRIMARY KEY  ("AlbumId")
);

INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (80, 'In Your Honor [Disc 2]', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (81, 'One By One', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (82, 'The Colour And The Shape', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (83, 'My Way: The Best Of Frank Sinatra [Disc 1]', 85);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (84, 'Roda De Funk', 86);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (85, 'As Can��es de Eu Tu Eles', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (86, 'Quanta Gente Veio Ver (Live)', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (87, 'Quanta Gente Veio ver--B�nus De Carnaval', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (88, 'Faceless', 87);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (89, 'American Idiot', 54);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (90, 'Appetite for Destruction', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (91, 'Use Your Illusion I', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (92, 'Use Your Illusion II', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (93, 'Blue Moods', 89);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (94, 'A Matter of Life and Death', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (95, 'A Real Dead One', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (96, 'A Real Live One', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (97, 'Brave New World', 90);

INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (152, 'Master Of Puppets', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (153, 'ReLoad', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (154, 'Ride The Lightning', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (155, 'St. Anger', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (156, '...And Justice For All', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (157, 'Miles Ahead', 68);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (158, 'Milton Nascimento Ao Vivo', 42);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (159, 'Minas', 42);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (160, 'Ace Of Spades', 106);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (161, 'Demorou...', 108);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (162, 'Motley Crue Greatest Hits', 109);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (163, 'From The Muddy Banks Of The Wishkah [Live]', 110);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (164, 'Nevermind', 110);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (165, 'Compositores', 111);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (166, 'Olodum', 112);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (167, 'Ac�stico MTV', 113);