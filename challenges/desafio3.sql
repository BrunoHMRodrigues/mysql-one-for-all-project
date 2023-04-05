SELECT 
    u.user_name AS pessoa_usuaria,
    COUNT(s.song) AS musicas_ouvidas,
    ROUND(SUM(s.duration/60), 2) AS total_minutos
FROM users AS u
INNER JOIN reproduction_history AS h ON u.user_id = h.user_id
INNER JOIN songs as s ON h.song_id = s.song_id
GROUP BY u.user_id
ORDER BY u.user_name