-- 5. Find the number of times each team won the toss and also won the match (done).

SELECT 
    winner, COUNT(toss_winner)
FROM
    matchesTable
WHERE
    toss_winner = winner
GROUP BY winner;
