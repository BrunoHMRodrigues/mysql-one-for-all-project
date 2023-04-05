SELECT
    al.album AS album,
    COUNT(fs.song_id) AS favoritadas
FROM songs AS s
INNER JOIN albums AS al ON s.album_id = al.album_id
INNER JOIN favorite_songs AS fs ON s.song_id = fs.song_id
GROUP BY al.album
ORDER BY favoritadas DESC
LIMIT 3