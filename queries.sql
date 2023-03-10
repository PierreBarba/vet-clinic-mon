/*Queries that provide answers to the questions from all projects.*/

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
select neutered, sum(escape_attempts) from animals group by neutered;
 neutered | sum 
----------+-----
 f        |   4
 t        |  20
(2 rows)


-- · What is the minimum and maximum weight of each type of animal?
select species,  min(weight_kg), max(weight_kg) from animals group by species;
 species | min | max 
---------+-----+-----
 Digimon | 5.7 |  45
 Pokemon |  11 |  17

-- · What is the average number of escape attempts per animal type
--   of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where extract(year from  date_of_birth) between 1900 and 2000 group by species;
 species |        avg         
---------+--------------------
 Pokemon | 3.0000000000000000

-- What animals belong to Melody Pond?
SELECT name FROM animals inner join owners ON animals.owner_id = owners.id WHERE owners.full_name = 'Melody Pond';

-- List of all animals that are pokemon (their type is Pokemon).
SELECT animals.name FROM animals join species ON species.id = animals.species_id WHERE species.name='Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal.
SELECT owners.full_name AS owner, animals.name FROM animals right join owners ON owners.id = animals.owner_id;

-- How many animals are there per species?
SELECT species.name AS specie, count(animals.name) FROM animals inner join species ON species.id= animals.species_id group by species.name;

-- List all Digimon owned by Jennifer Orwell.
SELECT owners.full_name AS owner, animals.name AS animal FROM animals inner join owners ON owners.id= animals.owner_id 
        inner join species ON species.id=animals.species_id WHERE owners.full_name='Jennifer Orwell' and species.name='Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape.
SELECT animals.name FROM animals inner join owners ON owners.id=animals.owner_id WHERE owners.full_

-- Who owns the most animals? --Melody Pond

SELECT owners.full_name AS owner, COUNT(*) AS animal_QTY FROM animals inner join owners ON owners.id=animals.owner_id group BY owners.full_name;

-- Who was the last animal seen by William Tatcher?
SELECT animals.*, visits.date_of_visit FROM animals LEFT JOIN visits ON animals.id = visits.animals_id LEFT JOIN vets ON visits.vets_id =vets.id WHERE vets.id = 
(SELECT id FROM vets WHERE vets.name = 'William Tatcher') ORDER BY date_of_visit DESC LIMIT 1;

-- How many different animals did Stephanie Mendez see
SELECT vets.name, COUNT(animals.*) FROM animals LEFT JOIN visits ON animals.id = visits.animals_id LEFT JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 
(SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez') GROUP BY vets.name;


-- List all vets and their specialties, including vets with no specialties.
SELECT vets.name, species.name FROM vets FULL JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species ON specializations.species_id = species.id;

-- List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
SELECT animals.*, visits.date_of_visit FROM animals LEFT JOIN visits ON animals.id = visits.animals_id LEFT JOIN vets ON visits.vets_id = vets.id WHERE vets.id =
 (SELECT id FROM vets WHERE vets.name = 'Stephanie Mendez') AND visits.date_of_visit BETWEEN '04-01-2020' AND '08-30-2020' ORDER BY date_of_visit DESC;


-- What animal has the most visits to vets?
SELECT animals.name, COUNT (animals.id) FROM animals LEFT JOIN visits ON animals.id = visits.animals_id GROUP BY animals.id ORDER BY COUNT (animals.id) DESC LIMIT 1;

-- Who was Maisy Smith's first visit?
SELECT animals.*, visits.date_of_visit FROM animals FULL JOIN visits ON animals.id = visits.animals_id FULL JOIN vets ON visits.vets_id = vets.id WHERE vets.id = 
(SELECT id FROM vets WHERE vets.name = 'Maisy Smith') ORDER BY date_of_visit ASC LIMIT 1;

-- Details for most recent visit: animal information, vet information, and date of visit.
SELECT animals.* ,  vets.*, visits.date_of_visit FROM animals LEFT JOIN visits ON animals.id = visits.animals_id LEFT JOIN vets ON visits.vets_id = vets.id ORDER BY date_of_visit DESC LIMIT 1;

-- How many visits were with a vet that did not specialize in that animal's species?
SELECT COUNT(*) FROM visits INNER JOIN animals ON visits.animals_id = animals.id LEFT JOIN specializations ON specializations.species_id = animals.species_id AND visits.vets_id = 
specializations.vets_id WHERE specializations.species_id IS NULL AND specializations.vets_id  IS NULL;



-- What specialty should Maisy Smith consider getting? Look for the species she gets the most. --Digimon
SELECT species.name, COUNT(animals.*) FROM animals LEFT JOIN visits ON animals.id = visits.animals_id LEFT JOIN vets ON visits.vets_id = vets.id LEFT JOIN species ON animals.species_id = species.id WHERE vets.id = 
(SELECT id FROM vets WHERE vets.name = 'Maisy Smith')GROUP BY species.name ORDER BY COUNT(animals.*) DESC LIMIT 1;
