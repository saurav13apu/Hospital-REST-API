const mysql = require("mysql2");

const connection = mysql.createConnection({
  host: "sql12.freesqldatabase.com",
  user: "sql12707653",
  password: "Y7HSL9Gbzl",
  database: "sql12707653",
});

const query = async (queryString, params) => {
  if (!params) params = [];
  return new Promise((resolve, reject) => {
    connection.execute(queryString, params, (err, results) => {
      if (err) reject(err);
      else resolve(results);
    });
  });
};

module.exports = { connection, query };
