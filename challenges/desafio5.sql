SELECT 
    s.song AS cancao,
    COUNT(r.song_id) AS reproducoes
FROM songs AS s
INNER JOIN reproduction_history AS r ON s.song_id = r.song_id
GROUP BY r.song_id
ORDER BY reproducoes DESC, s.song
LIMIT 2;