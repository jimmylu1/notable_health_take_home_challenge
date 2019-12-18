const { Pool } = require("pg");

const config = new Pool({
  user: "",
  host: "localhost",
  database: "",
  password: "",
  post: 5432
});

config
  .connect()
  .then(() => console.log(`Postgres database connected`))
  .catch(err => console.error("Postgres unable to connect", err));

module.exports = config;
