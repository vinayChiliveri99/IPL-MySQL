-- 1. Number of matches played per year for all the years in IPL. (done)

SELECT 
    season, COUNT(season) AS matchesPerYear
FROM
    matchesTable
GROUP BY season
ORDER BY season;
