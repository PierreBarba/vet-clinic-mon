CREATE DATABASE clinic;

CREATE TABLE patients(id SERIAL NOT NULL PRIMARY KEY, name VARCHAR(100), date_of_birth DATE);

CREATE TABLE medical_histories(id SERIAL NOT NULL PRIMARY KEY,admitted_at TIMESTAMP,patient_id INT REFERENCES patients(id),status VARCHAR(100));

CREATE TABLE treatments(id SERIAL NOT NULL PRIMARY KEY,type vARCHAR(100),name VARCHAR(100));

CREATE TABLE medical_histories_treatments (medical_histories_id INT REFERENCES medical_histories(id),treatments INT REFERENCES treatments(id));
