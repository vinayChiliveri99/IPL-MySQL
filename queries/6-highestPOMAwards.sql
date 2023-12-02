-- 6. Find a player who has won the highest number of Player of the Match awards for each season

SELECT season, player, countPlayerOfMatch 
from (SELECT 
	 season, 
     player, 
     countPlayerOfMatch, 
     RANK() OVER (PARTITION BY season ORDER BY countplayerOfMatch DESC) AS rnk 
from(SELECT 
    season,
    player_of_match AS player,
    COUNT(player_of_match) AS countplayerOfMatch
FROM
    matchesTable
WHERE
    player_of_match != ''
GROUP BY 
	player_of_match , season
ORDER BY 
	season , countplayerOfMatch DESC) AS subquery) AS subquery2 
WHERE 
	rnk = 1 ;