SELECT 
    CASE 
        WHEN u.age <= 30 THEN 'Até 30 anos'
        WHEN u.age > 30 AND u.age <= 60 THEN 'Entre 31 e 60 anos'
        ELSE 'Maior de 60 anos'
    END AS faixa_etaria,
    COUNT(DISTINCT u.user_id) AS total_pessoas_usuarias,
    COUNT(fs.song_id) AS total_favoritadas
FROM users AS u
LEFT JOIN favorite_songs AS fs ON u.user_id = fs.user_id
WHERE u.age IS NOT NULL
GROUP BY faixa_etaria
ORDER BY 
    FIELD(faixa_etaria, 'Até 30 anos', 'Entre 31 e 60 anos', 'Maior de 60 anos');
