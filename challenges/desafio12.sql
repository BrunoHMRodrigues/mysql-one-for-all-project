SELECT 
    at.artist AS artista,
    CASE 
        WHEN COUNT(fs.song_id) >= 5 THEN 'A'
        WHEN COUNT(fs.song_id) >= 3 THEN 'B'
        WHEN COUNT(fs.song_id) >= 1 THEN 'C'
        ELSE '-'
    END AS ranking
FROM artists AS at
LEFT JOIN songs AS s ON at.artist_id = s.artist_id
LEFT JOIN favorite_songs AS fs ON s.song_id = fs.song_id
GROUP BY at.artist
ORDER BY  FIELD(ranking, 'A', 'B', 'C', '-') ASC;