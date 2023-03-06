CREATE DATABASE clinic;

CREATE TABLE patients(id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100), date_of_birth DATE);

CREATE TABLE medical_histories(id SERIAL NOT NULL PRIMARY KEY,admitted_at TIMESTAMP,patient_id INT REFERENCES patients(id),status VARCHAR(100));
