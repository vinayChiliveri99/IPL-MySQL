-- 8. Find the highest number of times one player has been dismissed by another player

SELECT 
    player_dismissed,
    bowler,
    COUNT(player_dismissed) AS dismissals
FROM
    deliveriesTable
WHERE
    dismissal_kind != ''
        AND dismissal_kind != 'run out'
        AND dismissal_kind != 'retired hurt'
        AND player_dismissed != bowler
GROUP BY player_dismissed , bowler
ORDER BY dismissals DESC
LIMIT 1;