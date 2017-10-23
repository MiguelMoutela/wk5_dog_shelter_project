DROP TABLE dogs;
DROP TABLE patrons;

CREATE TABLE patrons(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  bio VARCHAR(255)
);

CREATE TABLE dogs(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  city VARCHAR(255),
  breed VARCHAR(255),
  admission_date DATE,
  healthy BOOLEAN DEFAULT false,
  trained BOOLEAN DEFAULT false,
  adoptable BOOLEAN DEFAULT false,
  adopted_on DATE,
  adopted_by INT2 REFERENCES patrons (id) ON DELETE CASCADE
);
