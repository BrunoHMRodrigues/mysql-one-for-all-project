DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE SpotifyClone.plan_values(
    plan_value_id INT NOT NULL AUTO_INCREMENT,
    plan_value DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(plan_value_id)
);

CREATE TABLE SpotifyClone.plans(
    plan_id INT NOT NULL AUTO_INCREMENT,
    plan VARCHAR(20) NOT NULL,
    plan_value_id INT NOT NULL,
    PRIMARY KEY(plan_id),
    FOREIGN KEY (plan_value_id) REFERENCES plan_values(plan_value_id)
);

CREATE TABLE SpotifyClone.users(
    user_id INT NOT NULL AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 0),
    PRIMARY KEY(user_id)
);

CREATE TABLE SpotifyClone.users_plans(
    user_plan_id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    plan_id INT NOT NULL,
    plan_date_assign DATE NOT NULL,
    PRIMARY KEY(users_plan_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
);

CREATE TABLE SpotifyClone.artists(
    artist_id INT NOT NULL AUTO_INCREMENT,
    artist VARCHAR(50) NOT NULL,
    PRIMARY KEY(artist_id)
);

CREATE TABLE SpotifyClone.albums(
    album_id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    PRIMARY KEY(album_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

CREATE TABLE SpotifyClone.songs(
    song_id INT NOT NULL AUTO_INCREMENT,
    song VARCHAR(50) NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    duration INT NOT NULL CHECK(duration > 0),
    release_date INT NOT NULL,
    PRIMARY KEY(song_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
);

CREATE TABLE SpotifyClone.reproduction_history(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    reproduction_date DATE NOT NULL,
    CONSTRAINT pk_history PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

CREATE TABLE SpotifyClone.follow_artists(
    user_id INT NOT NULL,
    artist_id INT NOT NULL,
    CONSTRAINT pk_follow_artist PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
	FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO plan_values (plan_value) VALUES (0);
INSERT INTO plan_values (plan_value) VALUES (5.99);
INSERT INTO plan_values (plan_value) VALUES (6.99);
INSERT INTO plan_values (plan_value) VALUES (7.99);

INSERT INTO plans (plan, plan_value_id) VALUES ('gratuito', 1);
INSERT INTO plans (plan, plan_value_id) VALUES ('universitário', 2);
INSERT INTO plans (plan, plan_value_id) VALUES ('pessoal', 3);
INSERT INTO plans (plan, plan_value_id) VALUES ('familiar', 4);

INSERT INTO users (user_name, age) VALUES ('Barbara Liskov', 82);
INSERT INTO users (user_name, age) VALUES ('Robert Cecil Martin', 58);
INSERT INTO users (user_name, age) VALUES ('Ada Lovelace', 37);
INSERT INTO users (user_name, age) VALUES ('Martin Fowler', 46);
INSERT INTO users (user_name, age) VALUES ('Sandi Metz', 58);
INSERT INTO users (user_name, age) VALUES ('Paulo Freire', 19);
INSERT INTO users (user_name, age) VALUES ('Bell Hooks', 26);
INSERT INTO users (user_name, age) VALUES ('Christopher Alexander', 85);
INSERT INTO users (user_name, age) VALUES ('Judith Butler', 45);
INSERT INTO users (user_name, age) VALUES ('Jorge Amado', 58);

INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (1, 1, '2019-10-20');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (2, 1, '2017-01-06');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (3, 4, '2017-12-30');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (4, 4, '2017-01-17');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (5, 4, '2018-04-29');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (6, 2, '2018-02-14');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (7, 2, '2018-01-05');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (8, 3, '2019-06-05');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (9, 3, '2020-05-13');
INSERT INTO users_plans (user_id, plan_id, plan_date_assign) VALUES (10, 3, '2017-02-17');

INSERT INTO artists (artist) VALUES ('Baco Exu do Blues');
INSERT INTO artists (artist) VALUES ('Beyoncé');
INSERT INTO artists (artist) VALUES ('Blind Guardian');
INSERT INTO artists (artist) VALUES ('Elis Regina');
INSERT INTO artists (artist) VALUES ('Nina Simone');
INSERT INTO artists (artist) VALUES ('Queen');

INSERT INTO albums (album, artist_id) VALUES ('Renaissance', 2);
INSERT INTO albums (album, artist_id) VALUES ('Jazz', 6);
INSERT INTO albums (album, artist_id) VALUES ('Hot Space', 6);
INSERT INTO albums (album, artist_id) VALUES ('Falso Brilhante', 4);
INSERT INTO albums (album, artist_id) VALUES ('Vento de Maio', 4);
INSERT INTO albums (album, artist_id) VALUES ('QVVJFA?', 1);
INSERT INTO albums (album, artist_id) VALUES ('Somewhere Far Beyond', 3);
INSERT INTO albums (album, artist_id) VALUES ('I Put A Spell On You', 5);

INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('BREAK MY SOUL', 2, 1, 279, 2022);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('VIRGO''S GROOVE', 2, 1, 369, 2022);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('ALIEN SUPERSTAR', 2, 1, 116, 2022);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('Don''t Stop Me Now', 6, 2, 203, 1978);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('Under Pressure', 6, 3, 152, 1982);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('Como Nossos Pais', 4, 4, 105, 1998);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('O Medo de Amar é o Medo de Ser Livre', 4, 5, 207, 2001);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('Samba em Paris', 1, 6, 267, 2003);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('The Bard''s Song', 3, 7, 244, 2007);
INSERT INTO songs (song, artist_id, album_id, duration, release_date) VALUES ('Feeling Good', 5, 8, 100, 2012);

INSERT INTO history (user_id, song_id, reproduction_date) VALUES (1, 8, '2022-02-28 10:45:55');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (1, 2, '2020-05-02 05:30:35');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (1, 10, '2020-03-06 11:22:33');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (2, 10, '2022-08-05 08:05:17');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (2, 7, '2020-01-02 07:40:33');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (3, 10, '2020-11-13 16:55:13');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (3, 2, '2020-12-05 18:38:30');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (4, 8, '2021-08-15 17:10:10');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (5, 8, '2022-01-09 01:44:33');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (5, 5, '2020-08-06 15:23:43');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (6, 7, '2017-01-24 00:31:17');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (6, 1, '2017-10-12 12:35:20');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (7, 4, '2011-12-15 22:30:49');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (8, 4, '2012-03-17 14:56:41');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (9, 9, '2022-02-24 21:14:22');
INSERT INTO history (user_id, song_id, reproduction_date) VALUES (10, 3, '2015-12-13 08:30:22');

INSERT INTO follow_artists (user_id, artist_id) VALUES (1, 2);
INSERT INTO follow_artists (user_id, artist_id) VALUES (1, 6);
INSERT INTO follow_artists (user_id, artist_id) VALUES (1, 4);
INSERT INTO follow_artists (user_id, artist_id) VALUES (2, 2);
INSERT INTO follow_artists (user_id, artist_id) VALUES (2, 4);
INSERT INTO follow_artists (user_id, artist_id) VALUES (3, 6);
INSERT INTO follow_artists (user_id, artist_id) VALUES (4, 1);
INSERT INTO follow_artists (user_id, artist_id) VALUES (5, 3);
INSERT INTO follow_artists (user_id, artist_id) VALUES (5, 5);
INSERT INTO follow_artists (user_id, artist_id) VALUES (6, 5);
INSERT INTO follow_artists (user_id, artist_id) VALUES (6, 2);
INSERT INTO follow_artists (user_id, artist_id) VALUES (7, 5);
INSERT INTO follow_artists (user_id, artist_id) VALUES (9, 4);
INSERT INTO follow_artists (user_id, artist_id) VALUES (10, 6);
