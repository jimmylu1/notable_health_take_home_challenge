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
