SELECT
    at.artist AS artista,
    al.album AS album,
    COUNT(f.artist_id) AS pessoas_seguidoras
FROM follow_artists AS f
INNER JOIN artists AS at ON f.artist_id = at.artist_id
INNER JOIN albums AS al ON f.artist_id = al.artist_id
GROUP BY at.artist, al.album
ORDER BY pessoas_seguidoras DESC, at.artist, al.album