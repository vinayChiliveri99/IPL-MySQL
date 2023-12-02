-- query to create deliveries table.

create table deliveriesTable(
    slNo integer auto_increment primary key,
    match_id integer,
    inning integer,
    batting_team varchar(256),
    bowling_team varchar(256),
    overs integer,
    ball integer,
    batsman varchar(256),
    non_striker varchar(256),
    bowler varchar(256),
    is_super_over integer,
    wide_runs integer,
    bye_runs integer,
    legbye_runs integer,
    noball_runs integer,
    penalty_runs integer,
    batsman_runs integer,
    extra_runs integer,
    total_runs integer,
    player_dismissed varchar(256),
    dismissal_kind varchar(256),
    fielder varchar(256)
);
