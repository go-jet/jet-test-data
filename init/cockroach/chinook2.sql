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