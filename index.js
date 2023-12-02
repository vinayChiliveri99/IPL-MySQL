// file to convert CSV Data and to insert them into SQL Tables.

const fs = require('fs');
const mysql = require('mysql2');
const fastCSV = require('fast-csv');

let matchesStream = fs.createReadStream('data/matches.csv');
let deliveriesStream = fs.createReadStream('data/deliveries.csv');

let matchesData = [];
let deliveriesData = [];

function parseCSV(stream, data) {
  return new Promise((resolve, reject) => {
    let csvStream = fastCSV
      .parse({ headers: true })
      .on('data', (rowData) => data.push(rowData))
      .on('end', () => resolve(data))
      .on('error', reject);

    stream.pipe(csvStream);
  });
}

function connectToDB(tableName, data, columns) {
  return new Promise((resolve, reject) => {
    const connection = mysql.createPool({
      host: 'localhost',
      user: 'root',
      password: 'india@123',
      database: 'dummy',
      connectionLimit: 10,
    });

    connection.getConnection((error) => {
      if (error) {
        reject(new Error('error while connecting to server'));
      } else {
        const values = data.map((obj) =>
          columns.map((col) => obj[col])
        );

        let query = `INSERT INTO ${tableName} (${columns.join(
          ', '
        )}) VALUES ?`;

        connection.query(query, [values], (err, res) => {
          if (err) {
            reject(err);
          } else {
            resolve(res);
          }
        });
      }
    });
  });
}

const matches_cols = [
  'id',
  'season',
  'city',
  'date',
  'team1',
  'team2',
  'toss_winner',
  'toss_decision',
  'result',
  'dl_applied',
  'winner',
  'win_by_runs',
  'win_by_wickets',
  'player_of_match',
  'venue',
  'umpire1',
  'umpire2',
  'umpire3',
];
const deliveries_cols = [
  'match_id',
  'inning',
  'batting_team',
  'bowling_team',
  'overs',
  'ball',
  'batsman',
  'non_striker',
  'bowler',
  'is_super_over',
  'wide_runs',
  'bye_runs',
  'legbye_runs',
  'noball_runs',
  'penalty_runs',
  'batsman_runs',
  'extra_runs',
  'total_runs',
  'player_dismissed',
  'dismissal_kind',
  'fielder',
];

Promise.all([
  parseCSV(matchesStream, matchesData),
  parseCSV(deliveriesStream, deliveriesData),
])
  .then(([matchesData, deliveriesData]) => {
    return Promise.all([
      connectToDB('matchesTable', matchesData, matches_cols),
      connectToDB('deliveriesTable', deliveriesData, deliveries_cols),
    ]);
  })
  .then(([matchesResult, deliveriesResult]) => {
    console.log('Matches Result:', matchesResult);
    console.log('Deliveries Result:', deliveriesResult);
  })
  .catch((error) => console.error(error));
