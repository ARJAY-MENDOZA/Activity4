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

CREATE TABLE appointments (
    appointid INT PRIMARY KEY,
    animalid INT,
    appointdate DATE,
    reason VARCHAR(255),
    FOREIGN KEY (animalid) REFERENCES animals(animalid)
);

CREATE TABLE doctors (
    doctorid INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    specialization VARCHAR(100),
    phonenumber VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE invoices (
    invoiceid INT PRIMARY KEY,
    appointid INT,
    totalamount DECIMAL(10,2),
    paymentdate TIME,
    FOREIGN KEY (appointid) REFERENCES appointments(appointid)
);

CREATE TABLE medicalrecords (
    recordid INT PRIMARY KEY,
    animalid INT,
    doctorid INT,
    recorddate DATE,
    diagnosis VARCHAR(255),
    treatment TEXT,
    notes TEXT,
    FOREIGN KEY (animalid) REFERENCES animals(animalid),
    FOREIGN KEY (doctorid) REFERENCES doctors(doctorid)
);
INSERT INTO owners (ownerid, ofirstname, olastname, address, phone, email) VALUES
(1, 'Eren', 'Yeager', 'Barangay Kumintang Ibaba, Batangas City, Batangas', '09123456780', 'eren.yeager@example.com'),
(2, 'Mikasa', 'Ackerman', 'Barangay Pallocan West, Batangas City, Batangas', '09123456781', 'mikasa.ackerman@example.com'),
(3, 'Armin', 'Arlert', 'Barangay Libjo, Batangas City, Batangas', '09123456782', 'armin.arlert@example.com'),
(4, 'Levi', 'Ackerman', 'Barangay Alangilan, Batangas City, Batangas', '09123456783', 'levi.ackerman@example.com'),
(5, 'Hange', 'Zoë', 'Barangay Bolbok, Batangas City, Batangas', '09123456784', 'hange.zoe@example.com'),
(6, 'Jean', 'Kirstein', 'Barangay Calicanto, Batangas City, Batangas', '09123456785', 'jean.kirstein@example.com'),
(7, 'Sasha', 'Braus', 'Barangay San Isidro, Batangas City, Batangas', '09123456786', 'sasha.braus@example.com'),
(8, 'Erwin', 'Smith', 'Barangay Sta. Rita Karsada, Batangas City, Batangas', '09123456787', 'erwin.smith@example.com'),
(9, 'Reiner', 'Braun', 'Barangay Balagtas, Batangas City, Batangas', '09123456788', 'reiner.braun@example.com'),
(10, 'Annie', 'Leonhart', 'Barangay Dumantay, Batangas City, Batangas', '09123456789', 'annie.leonhart@example.com');

