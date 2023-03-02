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