-- 9. Find the bowler with the best economy in super overs

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
        is_super_over = 1
    GROUP BY bowler) AS subquery
ORDER BY economy
limit 1;
