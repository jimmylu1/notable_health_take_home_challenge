const { Pool } = require("pg");

const config = new Pool({
  user: "Jimmy",
  host: "localhost",
  database: "",
  password: "",
  post: 5432
});

config
  .connect()
  .then(() => console.log(`Postgres database connected`))
  .catch(err => console.error("Postgres database connection error", err));

module.exports = config;
