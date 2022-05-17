/*******************************************************************************
   Chinook Database - Version 1.4
   Script: Chinook_PostgreSql.sql
   Description: Creates and populates the Chinook database.
   DB Server: PostgreSql
   Author: Luis Rocha
   License: http://www.codeplex.com/ChinookDatabase/license
********************************************************************************/

DROP SCHEMA IF EXISTS chinook2 cascade;

CREATE SCHEMA chinook2;


SET search_path TO chinook2;

/*******************************************************************************
   Create Tables
********************************************************************************/
CREATE TABLE "Album"
(
    "AlbumId" INT NOT NULL,
    "Title" VARCHAR(160) NOT NULL,
    "ArtistId" INT NOT NULL,
    CONSTRAINT "PK_Album" PRIMARY KEY  ("AlbumId")
);

CREATE TABLE "Artist"
(
    "ArtistId" INT NOT NULL,
    "Name" VARCHAR(120),
    CONSTRAINT "PK_Artist" PRIMARY KEY  ("ArtistId")
);


INSERT INTO "Artist" ("ArtistId", "Name") VALUES (7, N'Apocalyptica');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (8, N'Audioslave');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (9, N'BackBeat');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (10, N'Billy Cobham');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (11, N'Black Label Society');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (12, N'Black Sabbath');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (13, N'Body Count');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (14, N'Bruce Dickinson');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (15, N'Buddy Guy');
INSERT INTO "Artist" ("ArtistId", "Name") VALUES (16, N'Caetano Veloso');


INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (2, N'Balls to the Wall', 2);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (3, N'Restless and Wild', 2);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (4, N'Let There Be Rock', 1);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (5, N'Big Ones', 3);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (6, N'Jagged Little Pill', 4);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (7, N'Facelift', 5);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (8, N'Warner 25 Anos', 6);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (9, N'Plays Metallica By Four Cellos', 7);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (10, N'Audioslave', 8);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (11, N'Out Of Exile', 8);
INSERT INTO "Album" ("AlbumId", "Title", "ArtistId") VALUES (12, N'BackBeat Soundtrack', 9);

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

INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (80, N'In Your Honor [Disc 2]', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (81, N'One By One', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (82, N'The Colour And The Shape', 84);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (83, N'My Way: The Best Of Frank Sinatra [Disc 1]', 85);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (84, N'Roda De Funk', 86);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (85, N'As Can��es de Eu Tu Eles', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (86, N'Quanta Gente Veio Ver (Live)', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (87, N'Quanta Gente Veio ver--B�nus De Carnaval', 27);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (88, N'Faceless', 87);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (89, N'American Idiot', 54);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (90, N'Appetite for Destruction', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (91, N'Use Your Illusion I', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (92, N'Use Your Illusion II', 88);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (93, N'Blue Moods', 89);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (94, N'A Matter of Life and Death', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (95, N'A Real Dead One', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (96, N'A Real Live One', 90);
INSERT INTO "tenant1.Album" ("AlbumId", "Title", "ArtistId") VALUES (97, N'Brave New World', 90);

INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (152, N'Master Of Puppets', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (153, N'ReLoad', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (154, N'Ride The Lightning', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (155, N'St. Anger', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (156, N'...And Justice For All', 50);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (157, N'Miles Ahead', 68);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (158, N'Milton Nascimento Ao Vivo', 42);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (159, N'Minas', 42);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (160, N'Ace Of Spades', 106);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (161, N'Demorou...', 108);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (162, N'Motley Crue Greatest Hits', 109);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (163, N'From The Muddy Banks Of The Wishkah [Live]', 110);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (164, N'Nevermind', 110);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (165, N'Compositores', 111);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (166, N'Olodum', 112);
INSERT INTO "tenant2.Album" ("AlbumId", "Title", "ArtistId") VALUES (167, N'Ac�stico MTV', 113);


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

INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (80, N'In Your Honor [Disc 2]', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (81, N'One By One', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (82, N'The Colour And The Shape', 84);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (83, N'My Way: The Best Of Frank Sinatra [Disc 1]', 85);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (84, N'Roda De Funk', 86);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (85, N'As Can��es de Eu Tu Eles', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (86, N'Quanta Gente Veio Ver (Live)', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (87, N'Quanta Gente Veio ver--B�nus De Carnaval', 27);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (88, N'Faceless', 87);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (89, N'American Idiot', 54);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (90, N'Appetite for Destruction', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (91, N'Use Your Illusion I', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (92, N'Use Your Illusion II', 88);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (93, N'Blue Moods', 89);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (94, N'A Matter of Life and Death', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (95, N'A Real Dead One', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (96, N'A Real Live One', 90);
INSERT INTO "Album.tenant1" ("AlbumId", "Title", "ArtistId") VALUES (97, N'Brave New World', 90);

INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (152, N'Master Of Puppets', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (153, N'ReLoad', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (154, N'Ride The Lightning', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (155, N'St. Anger', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (156, N'...And Justice For All', 50);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (157, N'Miles Ahead', 68);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (158, N'Milton Nascimento Ao Vivo', 42);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (159, N'Minas', 42);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (160, N'Ace Of Spades', 106);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (161, N'Demorou...', 108);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (162, N'Motley Crue Greatest Hits', 109);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (163, N'From The Muddy Banks Of The Wishkah [Live]', 110);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (164, N'Nevermind', 110);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (165, N'Compositores', 111);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (166, N'Olodum', 112);
INSERT INTO "Album.tenant2" ("AlbumId", "Title", "ArtistId") VALUES (167, N'Ac�stico MTV', 113);