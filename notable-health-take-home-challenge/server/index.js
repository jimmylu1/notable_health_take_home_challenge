const express = require("express");

const db = require("../db/config.js");

const app = express();
const PORT = 3001;

app.use(express.json());

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));



