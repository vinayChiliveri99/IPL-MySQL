-- 4. Top 10 economical bowlers in the year 2015

SELECT 
    bowler, (runsConceaded * 6.0) / totalBalls AS economy
FROM
    (SELECT 
        bowler,
            SUM(batsman_runs + wide_runs + noball_runs) AS runsConceaded,
            SUM(CASE
                WHEN noball_runs = 0 AND wide_runs = 0 THEN 1
                ELSE 0
            END) AS totalBalls
    FROM
        deliveriesTable
    INNER JOIN matchesTable ON deliveriesTable.match_id = matchesTable.id
    WHERE
        season = 2015
    GROUP BY bowler) AS subquery
ORDER BY economy
LIMIT 10;
