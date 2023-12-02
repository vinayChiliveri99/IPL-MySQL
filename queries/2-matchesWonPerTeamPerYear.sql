-- 2. Number of matches won per team per year in IPL. (done).

SELECT 
    season, winner, COUNT(winner) AS MatchesWonPerTeamPerYear
FROM
    matchesTable
WHERE
    winner != ''
GROUP BY season , winner
ORDER BY season;