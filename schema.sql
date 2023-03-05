/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(id bigserial not null primary key, name varchar(20), date_of_birth date, escape_attempts integer, neutered boolean, weight_Kg decimal);
ALTER TABLE animals add column species varchar(30);

CREATE TABLE owners (id int generated always as identity, full_name varchar(50), age integer, primary key(id));
CREATE TABLE species(id int generated always as identity, name varchar(50), primary key(id));

ALTER TABLE animals DROP column species;
ALTER TABLE animals ADD column species_id integer;
ALTER TABLE animals ADD constraint fk_constraint foreign key(species_id) references species(id);
ALTER TABLE animals ADD column owner_id integer;
ALTER TABLE animals ADD constraint fk_constraint2 foreign key(owner_id) references owners(id);

CREATE TABLE vets (id int generated always as identity, name varchar(50), age integer,date_of_graduation date, primary key(id));
CREATE TABLE visits (animals_id int references animals(id),vets_id int references vets(id),date_of_visit date);
CREATE TABLE specializations (species_id int references species(id),vets_id int references vets(id), PRIMARY KEY(species_id,vets_id));

ALTER TABLE owners ADD COLUMN email VARCHAR(120);
INSERT INTO visits (animals_id, vets_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
INSERT INTO owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animals_id = 4;