CREATE TABLE favorite_songs(
    user_id INT NOT NULL,
    song_id INT NOT NULL,
    CONSTRAINT PRIMARY KEY(user_id, song_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO favorite_songs (user_id, song_id) VALUES (1, 3);
INSERT INTO favorite_songs (user_id, song_id) VALUES (1, 6);
INSERT INTO favorite_songs (user_id, song_id) VALUES (1, 10);
INSERT INTO favorite_songs (user_id, song_id) VALUES (2, 4);
INSERT INTO favorite_songs (user_id, song_id) VALUES (3, 1);
INSERT INTO favorite_songs (user_id, song_id) VALUES (3, 3);
INSERT INTO favorite_songs (user_id, song_id) VALUES (4, 7);
INSERT INTO favorite_songs (user_id, song_id) VALUES (4, 4);
INSERT INTO favorite_songs (user_id, song_id) VALUES (5, 10);
INSERT INTO favorite_songs (user_id, song_id) VALUES (5, 2);
INSERT INTO favorite_songs (user_id, song_id) VALUES (8, 2);
INSERT INTO favorite_songs (user_id, song_id) VALUES (9, 7);
INSERT INTO favorite_songs (user_id, song_id) VALUES (10, 3);