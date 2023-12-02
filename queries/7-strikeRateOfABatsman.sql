-- Find the strike rate of a batsman for each season

SELECT 
    season, batsman, (runs / ballsFaced) * 100.0 AS strikeRate
FROM
    (SELECT 
        batsman,
            season,
            SUM(batsman_runs) AS runs,
            SUM(CASE
                WHEN noball_runs = 0 AND wide_runs = 0 THEN 1
                ELSE 0
            END) AS ballsFaced
    FROM
        deliveriesTable
    INNER JOIN matchesTable ON deliveriesTable.match_id = matchesTable.id
    WHERE
        batsman = 'MS Dhoni'
    GROUP BY season) AS subquery
ORDER BY season;