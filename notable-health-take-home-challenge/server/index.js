const express = require("express");

const db = require("../db/config.js");

const app = express();
const PORT = 3001;

app.use(express.json());

app.listen(PORT, () => console.log(`Server running on port ${PORT}`));

//get all doctors
app.get("/doctors", (req, res, next) => {
  db.query("SELECT * FROM doctors")
    .then(({ rows }) => res.send(rows).status(200))
    .catch(err => res.send(err).status(404));
});

//get all appointments for one doctor on specific date
app.get("/appointments/:doctorID/:date", (req, res, next) => {
  const { doctorID, date } = req.params;
  db.query("SELECT * FROM appointments WHERE doctorID = $1 AND date = $2", [
    doctorID,
    date
  ])
    .then(({ rows }) => res.send(rows).status(200))
    .catch(err => res.send(err).status(404));
});

// delete appointment for doctor
app.delete("/appointments/:uid", (req, res, next) => {
  const { uid } = req.params;
  db.query("DELETE FROM appointments WHERE id = $1", [uid])
    .then(({ rows }) =>
      rows.length < 0
        ? res.status(404).send("no appointment to delete")
        : res.send(rows).status(200)
    )
    .catch(err => res.send(err).status(404));
});

// post new appointment to doctor's calendar, only start at 15min interval, no more than 3 can be given
app.post("/appointments/:doctorID/:date", (req, res, next) => {
  const {
    params: { doctorID, date },
    body: { time, kind, patientID }
  } = req;
  const validMinutes = ["00", "15", "30", "45"];
  const validTime = validMinutes.includes(time.split(":")[1].slice(0, 2));

  if (!validTime) {
    res.status(400);
    return "Please choose a different time for an appointment.";
  }

  db.query(
    "INSERT INTO appointments(doctorID, patientID, date, time, kind) SELECT $1, $2, $3, $4, $5 WHERE (SELECT COUNT(*) FROM appointments WHERE doctorID = $1 AND date = $3 AND time = $4) < 3 ",
    [doctorID, date, time, kind, patientID]
  )
    .then(({ rows }) =>
      rows.length < 0
        ? res
            .status(400)
            .send("Please schedule appointment at a different time")
        : res.status(200).send(rows)
    )
    .catch(err => res.status(200).send(err));
});
