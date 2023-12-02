-- 3. Extra runs conceded per team in the year 2016 (done).
 
SELECT 
    bowling_team, SUM(extra_runs)
FROM
    matchesTable
        INNER JOIN
    deliveriesTable ON matchesTable.id = deliveriesTable.match_id
WHERE
    season LIKE '2016'
GROUP BY bowling_team;