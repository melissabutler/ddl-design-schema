--psql < doctors.sql

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    specialty TEXT  
);

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    birthdate DATE   NOT NULL,
    insurance TEXT   NOT NULL,
    pharmacy TEXT
);

CREATE TABLE diseases (
    id SERIAL PRIMARY KEY,
    name TEXT   NOT NULL,
    description TEXT
);

CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients ON DELETE CASCADE,
    doctor_id INTEGER REFERENCES doctors ON DELETE SET NULL,
    date DATE   NOT NULL
);

CREATE TABLE diagnoses (
    id SERIAL PRIMARY KEY,
    visit_id INTEGER REFERENCES visits ON DELETE SET NULL,
    disease_id INTEGER REFERENCES diseases ON DELETE SET NULL,
    notes TEXT  
);

INSERT INTO doctors (name, specialty)
VALUES ('Bob Doctor','Tummy Aches'), ('Rhonda Fig', 'Allergies');

 INSERT INTO patients (name, birthdate, insurance, pharmacy)
 VALUES ('John Smith', '1990-12-10', 'Anthem', 'CVS pharmacy'), 
 ('Jane Doe', '1320-04-03', 'Medicaid', 'Witches Brew');

 INSERT INTO diseases (name, description)
 VALUES ('Measles', 'Acute respiratory accompanied by rash'),
 ('Coronavirus', 'You do not want this one babes'),
 ('Hysteria', 'Probably not real');

 INSERT INTO visits ( patient_id, doctor_id, date)
 VALUES (1, 2, '2024-1-1'),
 (2,2,'2024-1-20');

 INSERT INTO diagnoses(visit_id, disease_id, notes)
 VALUES (1, 3, 'Patient needs to get over it'),
 (2, 1, 'Patient needs to get some lotion for that rash ew');