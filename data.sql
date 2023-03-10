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

INSERT INTO specializations (species_id, vets_id) VALUES (1,1);
INSERT INTO specializations (species_id, vets_id) VALUES (3,1);
INSERT INTO specializations (species_id, vets_id) VALUES (1,3);
INSERT INTO specializations (species_id, vets_id) VALUES (2,3);
INSERT INTO specializations (species_id, vets_id) VALUES (2,4);

INSERT INTO vets (age,name, date_of_graduation) VALUES (45, 'William Tatcher' ,'2000-04-23');
INSERT INTO vets (age,name, date_of_graduation) VALUES (26, 'Maisy Smith' ,'2019-01-17');
INSERT INTO vets (age,name, date_of_graduation) VALUES (64, 'Stephanie Mendez' ,'1981-05-04');
INSERT INTO vets (age,name, date_of_graduation) VALUES (38, 'Jack Harkness' ,'2008-06-08');

INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 1, '2020-05-24'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (1, 3, '2020-07-22'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (2, 4, '2021-02-02'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-01-05'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-03-08'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (3, 2, '2020-05-14'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (4, 3, '2021-05-04'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (5, 4, '2021-02-24'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, '2019-12-21'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 1, '2020-08-10'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (6, 2, '2021-04-07'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (7, 3, '2019-09-29'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-10-03'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (8, 4, '2020-11-04'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2019-01-24'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2019-05-15'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2020-02-27'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (9, 2, '2020-08-03'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 3, '2020-05-24'),
INSERT INTO visits (animals_id, vets_id, date_of_visit) VALUES (10, 1, '2021-01-11');


INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';