-- query to create matches table

create table matchesTable(
	id integer primary key,
    season integer,
    city varchar(256),
    `date` date,
    team1 varchar(256),
    team2 varchar(256),
    toss_winner varchar(256),
    toss_decision varchar(256),
    result varchar(256),
    dl_applied integer,
    winner varchar(256),
    win_by_runs integer,
    win_by_wickets integer,
    player_of_match varchar(256),
    venue text,
    umpire1 varchar(256),
    umpire2 varchar(256),
    umpire3 varchar(256)
);
