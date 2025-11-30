--Veterinary Mangement SQL File
--Creator: Arjay Mendoza
--Date: Nov 29, 2025
--Description: This file contains the sql structure for the veterinary management system
--includes: Owners, Animals, Appointments, Doctors, Invoices, Medical records
--COllaborators:
-- Mendoza, Arjay D.
-- Baman, Zildjian R.

CREATE DATABASE veterinary;
CREATE TABLE owners(
  ownerid INT PRIMARY KEY,
  ofirstname VARCHAR(50),
  olastname VARCHAR(50),
  address VARCHAR(100),
  phone VARCHAR(15),
  email VARCHAR(100),
);

CREATE TABLE animals (
    animalid INT PRIMARY KEY,
    name VARCHAR(50),
    species VARCHAR(50),
    breed VARCHAR(50),
    dateofbirth DATE,
    gender VARCHAR(10),
    color VARCHAR(50),
    ownerid INT,
    FOREIGN KEY (ownerid) REFERENCES owners(ownerid)
);

