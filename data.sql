/* Populate database with sample data. */

INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (1, 'Agumon', '2020-02-03', 0, true, 10.23);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (2, 'Gabumon', '2018-11-15', 2, true, 8);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (3, 'Pikachu', '2021-01-07', 1, false, 15.04);
INSERT INTO animals(id, name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES (4, 'Devimon', '2017-05-12', 5, true, 11);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (5,'Charmander','2020-02-08',false,0,-11);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (6,'Plantmon','2021-11-15',true,2,-5.7);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (7,'Squirtle','1993-04-02',false,3,-12.13);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (8,'Angemon','2005-06-12',true,1,-45);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (9,'Boarmon','2005-06-07',true,7,20.4);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (10,'Blossom','1998-10-13',true,3,17);
INSERT INTO ANIMALS (id,name, date_of_birth,neutered,escape_attempts,weight_kg) VALUES (11,'Ditto','2022-05-14',true,4,22);

INSERT INTO owners values(default, 'Jennifer Orwell', 19);
INSERT INTO owners values(default, 'Bob', 45);
INSERT INTO owners values(default, 'Melody Pond', 77);
INSERT INTO owners values(default, 'Dean Winchester', 14);
INSERT INTO owners values(default, 'Jodie Whittaker', 38);

INSERT INTO species (name) values ('Pokemon'),('Digimon');
update animals set species_id=2 where name like '%mon';
update animals set species_id=1 where species_id is null;

UPDATE animals SET owner_id=1 WHERE name='Agumon';
UPDATE animals SET owner_id=2 WHERE name='Gabumon' OR name = 'Pikachu';
UPDATE animals SET owner_id=3 WHERE name='Devimon' or name = 'Plantmon';
UPDATE animals SET owner_id=4 WHERE name='Charmander' OR name = 'Squirtle' OR name = 'Blossom';
UPDATE animals SET owner_id=5 WHERE name='Angemon' OR name = 'Boarmon';