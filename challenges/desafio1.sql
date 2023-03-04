DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.plans (
    id INT PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(50) NOT NULL,
    value DOUBLE NOT NULL
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.plans(plan, value)
VALUES
("gratuito", 0.00),
("universitário", 5.99),
("pessoal", 6.99),
("familiar", 7.99);

CREATE TABLE SpotifyClone.user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan INT NOT NULL,
    signature_date DATE NOT NULL,
    FOREIGN KEY (plan)
        REFERENCES SpotifyClone.plans (id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.user(name,age,plan,signature_date)
VALUES
  ('Barbara Liskov',82,1,"2019-10-20"),
  ('Robert Cecil Martin',58,1,"2017-01-06"),
  ('Ada Lovelace',37,4,"2017-12-30"),
  ('Martin Fowler',46,4,"2017-01-17"),
  ('Sandi Metz',58,4,"2018-04-29"),
  ('Paulo Freire',19,2,"2018-02-14"),
  ('Bell Hooks',26,2,"2018-01-05"),
  ('Christopher Alexander',85,3,"2019-06-05"),
  ('Judith Butler',45,3,"2020-05-13"),
  ('Jorge Amado',58,3,"2017-02-17");

CREATE TABLE SpotifyClone.artist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist VARCHAR(200) NOT NULL
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.artist(artist)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');
 
 CREATE TABLE SpotifyClone.album (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist INT NOT NULL,
    album VARCHAR(200) NOT NULL,
    launch_year YEAR NOT NULL,
    FOREIGN KEY (artist)
        REFERENCES SpotifyClone.artist (id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.album (artist,album,launch_year)
VALUES
  (1,"Renaissance","2022"),
  (2,"Jazz","1978"),
  (2,"Hot Space","1982"),
  (3,"Falso Brilhante","1998"),
  (3,"Vento de Maio","2001"),
  (4,"QVVJFA?","2003"),
  (5,"Somewhere Far Beyond","2007"),
  (6,"I Put A Spell On You","2012");
 
CREATE TABLE SpotifyClone.music (
    id INT PRIMARY KEY AUTO_INCREMENT,
    artist INT NOT NULL,
    album INT NOT NULL,
    music VARCHAR(200) NOT NULL,
    duration_seconds INT NOT NULL,
    FOREIGN KEY (artist)
        REFERENCES SpotifyClone.album (id),
    FOREIGN KEY (artist)
        REFERENCES SpotifyClone.artist (id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.music(artist,album,music,duration_seconds)
VALUES
  (1,1,'BREAK MY SOUL',276),
  (1,1,'VIRGOS GROOVE',369),
  (1,1,'ALIEN SUPERSTAR',116),
  (2,2,"Don't Stop Me Now",203),
  (2,3,"Under Pressure",152),
  (3,4,"Como Nossos Pais",105),
  (3,5,"O Medo de Amar é o Medo de Ser Livre",207),
  (4,6,"Samba em Paris",267),
  (5,7,"The Bard's Song",244),
  (6,8,"Feeling Good",100);
  
CREATE TABLE SpotifyClone.historic (
    user INT NOT NULL,
    historic_reproductions INT NOT NULL,
    date_reproductions DATETIME NOT NULL,
    CONSTRAINT PRIMARY KEY (user,historic_reproductions),
    FOREIGN KEY (user)
        REFERENCES SpotifyClone.user (id),
	FOREIGN KEY (historic_reproductions)
        REFERENCES SpotifyClone.music (id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.historic(user,historic_reproductions,date_reproductions)
VALUES
  (1,8,"2022-02-28 10:45:55"),
  (1,2, "2020-05-02 05:30:35"),
  (1,10,"2020-03-06 11:22:33"),
  (2,10,"2022-08-05 08:05:17"),
  (2,7,"2020-01-02 07:40:33"),
  (3,10,"2020-11-13 16:55:13"),
  (3,2,"2020-12-05 18:38:30"),
  (4,8,"2021-08-15 17:10:10"),
  (5,8,"2022-01-09 01:44:33"),
  (5,5,"2020-08-06 15:23:43"),
  (6,7,"2017-01-24 00:31:17"),
  (6,1,"2017-10-12 12:35:20"),
  (7,4,"2011-12-15 22:30:49"),
  (8,4,"2012-03-17 14:56:41"),
  (9,9,"2022-02-24 21:14:22"),
  (10,3,"2015-12-13 08:30:22");
  
  CREATE TABLE SpotifyClone.follow (
    user INT NOT NULL,
    artist INT NOT NULL,
    CONSTRAINT PRIMARY KEY (user,artist),
    FOREIGN KEY (user)
        REFERENCES SpotifyClone.user (id),
	FOREIGN KEY (artist)
        REFERENCES SpotifyClone.artist (id)
)  ENGINE=INNODB;

INSERT INTO SpotifyClone.follow(user,artist)
VALUES
  (1,1),
  (1,2),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (4,4),
  (5,5),
  (5,6),
  (6,6),
  (6,1),
  (7,6),
  (9,3),
  (10,2);