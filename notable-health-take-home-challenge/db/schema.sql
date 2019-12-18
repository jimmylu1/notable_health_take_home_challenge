DROP DATABASE notable;

CREATE DATABASE notable;

\c notable;

DROP TABLE IF EXISTS doctors;
		
CREATE TABLE doctors (
  uid           SERIAL PRIMARY KEY,
  firstname     VARCHAR NOT NULL,
  lastname      VARCHAR NOT NULL,
  email         VARCHAR NOT NULL
);

DROP TABLE IF EXISTS patients;
		
CREATE TABLE patients (
  uid           SERIAL PRIMARY KEY,
  firstname     VARCHAR NOT NULL,
  lastname      VARCHAR NOT NULL,
  email         VARCHAR NOT NULL
);

DROP TABLE IF EXISTS appointments;
		
CREATE TABLE appointments (
  uid           SERIAL PRIMARY KEY,
  doctor        INTEGER NOT NULL,
  patient       INTEGER NOT NULL,
  date          VARCHAR NOT NULL,
  time          VARCHAR NOT NULL,
  kind          VARCHAR NOT NULL
);


ALTER TABLE appointments ADD FOREIGN KEY (doctor) REFERENCES doctors (id);
ALTER TABLE appointments ADD FOREIGN KEY (patient) REFERENCES patients (id);

INSERT INTO doctors(firstname, lastname, email) VALUES('Jim', 'Halpert', 'halpert@notablehealth.com');
INSERT INTO doctors(firstname, lastname, email) VALUES('Dwight', 'Schrute', 'schrute@notablehealth.com');
INSERT INTO doctors(firstname, lastname, email) VALUES('Pam', 'Beasely', 'beasely@notablehealth.com');
INSERT INTO doctors(firstname, lastname, email) VALUES('Stanley', 'Hudson', 'hudson@notablehealth.com');
INSERT INTO doctors(firstname, lastname, email) VALUES('Jan', 'Levinson', 'levinson@notablehealth.com');

INSERT INTO patients(firstname, lastname, email) VALUES('Michael', 'Scott', 'scott@office.com');
INSERT INTO patients(firstname, lastname, email) VALUES('Angela', 'Howard', 'howard@office.com');
INSERT INTO patients(firstname, lastname, email) VALUES('Toby', 'Flenderson', 'flenderson@office.com');
INSERT INTO patients(firstname, lastname, email) VALUES('Kevin', 'Malone', 'malone@office.com');
INSERT INTO patients(firstname, lastname, email) VALUES('Phyllis', 'Vance', 'vance@office.com');

INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(2, 2, '2019-12-18', '10:00AM', 'Follow-up');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(5, 2, '2019-12-18', '9:00AM', 'New Patient');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(4, 1, '2019-12-18', '9:30AM', 'New Patient');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(2, 3, '2019-12-19', '11:00AM', 'Follow-up');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(3, 5, '2019-12-18', '12:30PM', 'New Patient');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(1, 4, '2019-12-20', '10:30AM', 'New Patient');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(3, 1, '2019-12-21', '2:30PM', 'Follow-up');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(3, 5, '2019-12-21', '2:30PM', 'Follow-up');
INSERT INTO appointments(doctor, patient, date, time, kind) VALUES(3, 5, '2019-12-21', '2:30PM', 'Follow-up');

