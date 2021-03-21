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