SELECT
    at.artist AS artista,
    al.album AS album
FROM albums AS al
INNER JOIN artists AS at ON al.artist_id = at.artist_id
WHERE at.artist = 'Elis Regina'
ORDER BY al.album