BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "BelongsToGenre" (
	"Movie_Id"	INTEGER NOT NULL,
	"Genre_Id"	INTEGER NOT NULL,
	PRIMARY KEY("Movie_Id","Genre_Id"),
	FOREIGN KEY("Movie_Id") REFERENCES "Movies"("ID"),
	FOREIGN KEY("Genre_Id") REFERENCES "Genre"("ID")
);
CREATE TABLE IF NOT EXISTS "Movies" (
	"ID"	INTEGER NOT NULL,
	"TItle"	TEXT NOT NULL UNIQUE,
	"Year"	INTEGER,
	"Length"	INTEGER NOT NULL,
	"Rating"	TEXT,
	"Production_Id"	INTEGER,
	"Director_Id"	INTEGER,
	PRIMARY KEY("ID"),
	FOREIGN KEY("Production_Id") REFERENCES "ProductionCompany"("ID") ON DELETE NO ACTION ON UPDATE NO ACTION,
	FOREIGN KEY("Director_Id") REFERENCES "Directors"("Id")
);
CREATE TABLE IF NOT EXISTS "Directors" (
	"Id"	INTEGER UNIQUE,
	"FirstName"	TEXT,
	"LastName"	TEXT,
	PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "ActsIn" (
	"Movie_Id"	INTEGER,
	"Actor_Id"	INTEGER,
	FOREIGN KEY("Actor_Id") REFERENCES "Actors"("ID"),
	PRIMARY KEY("Movie_Id","Actor_Id"),
	FOREIGN KEY("Movie_Id") REFERENCES "Movies"("ID")
);
CREATE TABLE IF NOT EXISTS "ProductionCompany" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT NOT NULL UNIQUE,
	"City"	TEXT,
	"State"	TEXT,
	"Country"	TEXT,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "Genre" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Name"	TEXT,
	PRIMARY KEY("ID")
);
CREATE TABLE IF NOT EXISTS "Actors" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"Gender"	TEXT NOT NULL,
	"FirstName"	TEXT NOT NULL,
	"LastName"	TEXT NOT NULL,
	"Birthdate"	INTEGER,
	PRIMARY KEY("ID")
);
INSERT INTO "BelongsToGenre" VALUES (1,6);
INSERT INTO "BelongsToGenre" VALUES (1,8);
INSERT INTO "BelongsToGenre" VALUES (2,8);
INSERT INTO "BelongsToGenre" VALUES (3,8);
INSERT INTO "BelongsToGenre" VALUES (3,9);
INSERT INTO "BelongsToGenre" VALUES (3,10);
INSERT INTO "BelongsToGenre" VALUES (4,1);
INSERT INTO "BelongsToGenre" VALUES (4,4);
INSERT INTO "BelongsToGenre" VALUES (4,11);
INSERT INTO "BelongsToGenre" VALUES (5,1);
INSERT INTO "BelongsToGenre" VALUES (5,4);
INSERT INTO "BelongsToGenre" VALUES (5,11);
INSERT INTO "BelongsToGenre" VALUES (6,1);
INSERT INTO "BelongsToGenre" VALUES (6,8);
INSERT INTO "BelongsToGenre" VALUES (6,11);
INSERT INTO "BelongsToGenre" VALUES (7,6);
INSERT INTO "BelongsToGenre" VALUES (7,8);
INSERT INTO "BelongsToGenre" VALUES (8,1);
INSERT INTO "BelongsToGenre" VALUES (8,7);
INSERT INTO "BelongsToGenre" VALUES (8,2);
INSERT INTO "BelongsToGenre" VALUES (9,2);
INSERT INTO "BelongsToGenre" VALUES (9,3);
INSERT INTO "BelongsToGenre" VALUES (9,4);
INSERT INTO "BelongsToGenre" VALUES (10,2);
INSERT INTO "BelongsToGenre" VALUES (10,4);
INSERT INTO "BelongsToGenre" VALUES (11,1);
INSERT INTO "BelongsToGenre" VALUES (11,4);
INSERT INTO "BelongsToGenre" VALUES (11,7);
INSERT INTO "BelongsToGenre" VALUES (12,1);
INSERT INTO "BelongsToGenre" VALUES (12,7);
INSERT INTO "BelongsToGenre" VALUES (12,5);
INSERT INTO "BelongsToGenre" VALUES (13,1);
INSERT INTO "BelongsToGenre" VALUES (13,4);
INSERT INTO "BelongsToGenre" VALUES (14,6);
INSERT INTO "BelongsToGenre" VALUES (14,4);
INSERT INTO "BelongsToGenre" VALUES (15,3);
INSERT INTO "BelongsToGenre" VALUES (15,4);
INSERT INTO "BelongsToGenre" VALUES (15,11);
INSERT INTO "BelongsToGenre" VALUES (16,1);
INSERT INTO "BelongsToGenre" VALUES (16,2);
INSERT INTO "BelongsToGenre" VALUES (16,4);
INSERT INTO "BelongsToGenre" VALUES (14,12);
INSERT INTO "Movies" VALUES (1,'The GodFather',1972,178,'9.2',7,1);
INSERT INTO "Movies" VALUES (2,'The Shawshank Redemption',1994,142,'9.3',3,2);
INSERT INTO "Movies" VALUES (3,'Schindler''s List',1993,197,'8.9',1,3);
INSERT INTO "Movies" VALUES (4,'Avatar',2009,162,'7.8',12,4);
INSERT INTO "Movies" VALUES (5,'Star Wars: Episode IV - A New Hope',1977,121,'8.6',9,5);
INSERT INTO "Movies" VALUES (6,'The Lord of the Rings: The Return on the King',2003,201,'8.9',10,6);
INSERT INTO "Movies" VALUES (7,'Pulp Fiction',1994,154,'8.9',11,7);
INSERT INTO "Movies" VALUES (8,'Back to the Future',1985,116,'8.5',1,8);
INSERT INTO "Movies" VALUES (9,'Resident Evil',2002,100,'6.7',2,9);
INSERT INTO "Movies" VALUES (10,'The Matrix',1999,136,'8.7',5,10);
INSERT INTO "Movies" VALUES (11,'Dead Pool',2016,108,'8.0',4,11);
INSERT INTO "Movies" VALUES (12,'Aladdin',1992,91,'8.0',6,12);
INSERT INTO "Movies" VALUES (13,'Indiana Jones and the Raiders of the Lost Ark',1981,115,'8.5',7,3);
INSERT INTO "Movies" VALUES (14,'John wick',2014,201,'7.3',8,14);
INSERT INTO "Movies" VALUES (15,'Constantine',2005,121,'7.0',5,16);
INSERT INTO "Movies" VALUES (16,'The Fifth Element',1997,126,'7.7',3,17);
INSERT INTO "Directors" VALUES (1,'Francis','Coppola');
INSERT INTO "Directors" VALUES (2,'Frank','Darabont');
INSERT INTO "Directors" VALUES (3,'Steven','Spielberg');
INSERT INTO "Directors" VALUES (4,'James','Cameron');
INSERT INTO "Directors" VALUES (5,'Geroge','Lucas');
INSERT INTO "Directors" VALUES (6,'Peter','Jackson');
INSERT INTO "Directors" VALUES (7,'Quentin','Tarantino');
INSERT INTO "Directors" VALUES (8,'Robert','Zemeckis');
INSERT INTO "Directors" VALUES (9,'Paul','Anderson');
INSERT INTO "Directors" VALUES (10,'Lana','Wachowski');
INSERT INTO "Directors" VALUES (11,'Tim','Miller');
INSERT INTO "Directors" VALUES (12,'Ron','Clements');
INSERT INTO "Directors" VALUES (13,'John','Musker');
INSERT INTO "Directors" VALUES (14,'Chad','Stahelski');
INSERT INTO "Directors" VALUES (15,'David','Leitch');
INSERT INTO "Directors" VALUES (16,'Francis','Lawrence');
INSERT INTO "Directors" VALUES (17,'Luc','Besson');
INSERT INTO "ActsIn" VALUES (1,13);
INSERT INTO "ActsIn" VALUES (1,15);
INSERT INTO "ActsIn" VALUES (1,16);
INSERT INTO "ActsIn" VALUES (2,12);
INSERT INTO "ActsIn" VALUES (2,17);
INSERT INTO "ActsIn" VALUES (2,18);
INSERT INTO "ActsIn" VALUES (3,11);
INSERT INTO "ActsIn" VALUES (3,19);
INSERT INTO "ActsIn" VALUES (3,20);
INSERT INTO "ActsIn" VALUES (4,10);
INSERT INTO "ActsIn" VALUES (4,21);
INSERT INTO "ActsIn" VALUES (4,22);
INSERT INTO "ActsIn" VALUES (5,9);
INSERT INTO "ActsIn" VALUES (5,1);
INSERT INTO "ActsIn" VALUES (5,23);
INSERT INTO "ActsIn" VALUES (6,8);
INSERT INTO "ActsIn" VALUES (6,24);
INSERT INTO "ActsIn" VALUES (6,25);
INSERT INTO "ActsIn" VALUES (7,7);
INSERT INTO "ActsIn" VALUES (7,26);
INSERT INTO "ActsIn" VALUES (7,27);
INSERT INTO "ActsIn" VALUES (8,5);
INSERT INTO "ActsIn" VALUES (8,28);
INSERT INTO "ActsIn" VALUES (8,29);
INSERT INTO "ActsIn" VALUES (9,6);
INSERT INTO "ActsIn" VALUES (9,30);
INSERT INTO "ActsIn" VALUES (9,31);
INSERT INTO "ActsIn" VALUES (10,2);
INSERT INTO "ActsIn" VALUES (10,32);
INSERT INTO "ActsIn" VALUES (10,33);
INSERT INTO "ActsIn" VALUES (11,4);
INSERT INTO "ActsIn" VALUES (11,34);
INSERT INTO "ActsIn" VALUES (11,35);
INSERT INTO "ActsIn" VALUES (12,3);
INSERT INTO "ActsIn" VALUES (12,36);
INSERT INTO "ActsIn" VALUES (12,37);
INSERT INTO "ActsIn" VALUES (13,1);
INSERT INTO "ActsIn" VALUES (13,38);
INSERT INTO "ActsIn" VALUES (13,39);
INSERT INTO "ActsIn" VALUES (14,2);
INSERT INTO "ActsIn" VALUES (14,40);
INSERT INTO "ActsIn" VALUES (14,41);
INSERT INTO "ActsIn" VALUES (15,2);
INSERT INTO "ActsIn" VALUES (15,42);
INSERT INTO "ActsIn" VALUES (15,43);
INSERT INTO "ActsIn" VALUES (16,14);
INSERT INTO "ActsIn" VALUES (16,6);
INSERT INTO "ActsIn" VALUES (16,44);
INSERT INTO "ProductionCompany" VALUES (1,'Universal Pictures','Universal City','California','USA');
INSERT INTO "ProductionCompany" VALUES (2,'Constantin Film','Munich','','Germany');
INSERT INTO "ProductionCompany" VALUES (3,'Columbia Pictures','Los Angeles','California','USA');
INSERT INTO "ProductionCompany" VALUES (4,'Marvel Entertainment','New York City','New York','USA');
INSERT INTO "ProductionCompany" VALUES (5,'Warner Bros. Entertainment Inc.','Burbank','California','USA');
INSERT INTO "ProductionCompany" VALUES (6,'Walt Disney Pictures','Burbank','California','USA');
INSERT INTO "ProductionCompany" VALUES (7,'Paramount Pictures','Hollywood','California','USA');
INSERT INTO "ProductionCompany" VALUES (8,'Summit Entertainment','Santa Monica','California','USA');
INSERT INTO "ProductionCompany" VALUES (9,'Lucasfilm','San Francisco','California','USA');
INSERT INTO "ProductionCompany" VALUES (10,'New Line Cinema','Burbank','California','USA');
INSERT INTO "ProductionCompany" VALUES (11,'Miramax','Los Angeles','California','USA');
INSERT INTO "ProductionCompany" VALUES (12,'Lightstorm Entertainment','Los Angeles','California','USA');
INSERT INTO "Genre" VALUES (1,'Adventure');
INSERT INTO "Genre" VALUES (2,'Sci-Fi');
INSERT INTO "Genre" VALUES (3,'Horror');
INSERT INTO "Genre" VALUES (4,'Action');
INSERT INTO "Genre" VALUES (5,'Animation');
INSERT INTO "Genre" VALUES (6,'Crime');
INSERT INTO "Genre" VALUES (7,'Comedy');
INSERT INTO "Genre" VALUES (8,'Drama');
INSERT INTO "Genre" VALUES (9,'History');
INSERT INTO "Genre" VALUES (10,'Biography');
INSERT INTO "Genre" VALUES (11,'Fantasy');
INSERT INTO "Genre" VALUES (12,'Thriller');
INSERT INTO "Actors" VALUES (1,'Male','Harrison','Ford','7/13/1942');
INSERT INTO "Actors" VALUES (2,'Male','Keanu','Reeves','9/2/1964');
INSERT INTO "Actors" VALUES (3,'Male','Scott','Weinger','10/5/1975');
INSERT INTO "Actors" VALUES (4,'Male','Ryan','Reynolds','10/23/1976');
INSERT INTO "Actors" VALUES (5,'Male','Michael','J. Fox','6/9/1961');
INSERT INTO "Actors" VALUES (6,'Female','Milla','Jovovich','12/17/1975 ');
INSERT INTO "Actors" VALUES (7,'Male','John','Travolta','2/18/1954');
INSERT INTO "Actors" VALUES (8,'Male','Elijah','Wood','2/28/1981');
INSERT INTO "Actors" VALUES (9,'Male','Mark','Hamill','9/25/1951');
INSERT INTO "Actors" VALUES (10,'Male','Sam','Worthington','8/2/1976');
INSERT INTO "Actors" VALUES (11,'Male','Liam','Neeson','6/7/1952');
INSERT INTO "Actors" VALUES (12,'Male','Tim','Robbins','10/16/1958');
INSERT INTO "Actors" VALUES (13,'Male','Marlon','Brando','4/3/1924');
INSERT INTO "Actors" VALUES (14,'Male','Bruce','Willis','3/19/1955');
INSERT INTO "Actors" VALUES (15,'Male','Al','Pacino','4/25/1940');
INSERT INTO "Actors" VALUES (16,'Male','James','Caan','3/26/1940');
INSERT INTO "Actors" VALUES (17,'Male','Morgan','Freeman','6/1/1937');
INSERT INTO "Actors" VALUES (18,'Male','Bob','Gutan','11/15/1945');
INSERT INTO "Actors" VALUES (19,'Male','Ralph','Fiennes','12/22/1962');
INSERT INTO "Actors" VALUES (20,'Male','Ben','Kingsley','12/31/1943');
INSERT INTO "Actors" VALUES (21,'Female','Zoe','Saldana','6/19/1978');
INSERT INTO "Actors" VALUES (22,'Female','Sigourney','Weaver','10/8/1949');
INSERT INTO "Actors" VALUES (23,'Female','Carrie','Fisher','10/21/1956');
INSERT INTO "Actors" VALUES (24,'Male','Viggo','Mortensen','10/20/1958');
INSERT INTO "Actors" VALUES (25,'Male','Ian','McKellen','5/25/1939');
INSERT INTO "Actors" VALUES (26,'Female','Uma','Thurman','4/29/1970');
INSERT INTO "Actors" VALUES (27,'Male','Samuel','Jackson','12/21/1948');
INSERT INTO "Actors" VALUES (28,'Male','Christopher','Lloyd','12/22/1938');
INSERT INTO "Actors" VALUES (29,'Female','Lea','Thompson','5/31/1961');
INSERT INTO "Actors" VALUES (30,'Female','Michelle','Rodriguez ','6/12/1978');
INSERT INTO "Actors" VALUES (31,'Male','Ryan','McCluskey','6/2/1981');
INSERT INTO "Actors" VALUES (32,'Male','Laurence','Fishburne','7/30/61');
INSERT INTO "Actors" VALUES (33,'Female','Carrie-Anne','Moss','8/21/1967');
INSERT INTO "Actors" VALUES (34,'Female','Morena','Baccarin','6/2/1979');
INSERT INTO "Actors" VALUES (35,'Male','T.J','Miller','6/4/1981');
INSERT INTO "Actors" VALUES (36,'Male','Robin','Willams','7/21/1951');
INSERT INTO "Actors" VALUES (37,'Female','Linda','Larkin','3/20/1970');
INSERT INTO "Actors" VALUES (38,'Female','Karen','Allen','10/5/1951');
INSERT INTO "Actors" VALUES (39,'Male','Paul','Freeman','1/18/1943');
INSERT INTO "Actors" VALUES (40,'Male','Michael','Nyqvist','11/8/1960');
INSERT INTO "Actors" VALUES (41,'Male','Alfie','Allen','9/12/1986');
INSERT INTO "Actors" VALUES (42,'Female','Rachel','Weisz','3/7/1970');
INSERT INTO "Actors" VALUES (43,'Male','Djimon','Hounsou','4/24/1964');
INSERT INTO "Actors" VALUES (44,'Male','Gary','Oldman','3/21/1958');
COMMIT;
