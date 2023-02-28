/*Queries that provide answers to the questions from all projects.*/

-- Show all animals
select * from animals

-- Find all animals whose name ends in "mon". */
select * from animals where name like '%mon';

-- List the name of all animals born between 2016 and 2019.
select name from animals where date_of_birth > '2015-12-31' and date_of_birth < '2020-01-01' ;

-- List the name of all animals that are neutered and have less than 3 escape attempts.
select name from animals where neutered = true and escape_attempts < 3;

-- List the date of birth of all animals named either "Agumon" or "Pikachu".
select date_of_birth from animals where name = 'Agumon' or name = 'Pikachu';

-- List name and escape attempts of animals that weigh more than 10.5kg
select name, escape_attempts from animals where weight_Kg > 10.5;

-- Find all animals that are neutered.
select * from animals where neutered = true;

-- Find all animals not named Gabumon.
select * from animals where name != 'Gabumon';

-- Find all animals with a weight between 10.4kg and 17.3kg (including the animals with the weights that equals precisely 10.4kg or 17.3kg)
select * from animals where weight_Kg >=10.4 and  weight_Kg <=17.3;

-- Inside a transaction update the animals table by setting the species column to 
-- unspecified. Verify that change was made. Then roll back the change and verify
-- that the species columns went back to the state before the transaction.
begin;
  update animals  SET species = 'unspecified';
  select * from animals;
rollback;
 select * from animals;

-- Inside a transaction:
-- · Update the animals table by setting the species column to digimon for all
--   animals that have a name ending in mon.
-- · Update the animals table by setting the species column to pokemon for all
--   animals that don't have species already set.
-- · Commit the transaction.
-- · Verify that change was made and persists after commit.
begin;
  update animals set species = 'digimon' where name like '%mon';
  update animals set species = 'pokemon' where species is null;
commit;
 select * from animals;

-- Inside a transaction delete all records in the animals table, then roll back
-- the transaction.
-- After the rollback verify if all records in the animals table still exists.
begin;
  delete from animals;
ROLLBACK;
 select * from animals;

-- Inside a transaction:
-- · Delete all animals born after Jan 1st, 2022.
-- · Create a savepoint for the transaction.
-- · Update all animals' weight to be their weight multiplied by -1.
-- · Rollback to the savepoint
-- · Update all animals' weights that are negative to be their weight multiplied by -1.
-- · Commit transaction
BEGIN;
  delete from animals where date_of_birth > '2022-01-01';
  savepoint firstStep;
  update animals set weight_kg = weight_kg * -1;
  rollback to firstStep;
  update animals set weight_kg = weight_kg * -1 where weight_kg < 0;
COMMIT;
select * from animals;

-- Write queries to answer the following questions:
-- · How many animals are there?
select count(*) from animals;

-- · How many animals have never tried to escape?
select count(*) from animals where escape_attempts = 0;

-- · What is the average weight of animals?
select avg(weight_kg) from animals;

-- · Who escapes the most, neutered or not neutered animals? r/ neutered (20 attempts)
vet_clinic=# select sum(escape_attempts) from animals where neutered = true;
vet_clinic=# select sum(escape_attempts) from animals where neutered = false;

-- · What is the minimum and maximum weight of each type of animal?
select min(weight_Kg) from animals where species = 'Pokemon'; --11 kg
select max(weight_Kg) from animals where species = 'Pokemon'; --17 kg

select min(weight_Kg) from animals where species = 'Digimon'; --5.7 Kg
select max(weight_Kg) from animals where species = 'Digimon'; --45 Kg

-- · What is the average number of escape attempts per animal type
--   of those born between 1990 and 2000?
select avg(escape_attempts) from animals where species = 'Pokemon'and date_of_birth > '1989-12-31' and date_of_birth < '2001-01-01'; --3
select avg(escape_attempts) from animals where species = 'Digimon'and date_of_birth > '1989-12-31' and date_of_birth < '2001-01-01'; --0
