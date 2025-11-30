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

INSERT INTO animals (animalid, name, species, breed, dateofbirth, gender, color, ownerid)
VALUES
(1, 'Simba', 'Cat', 'Persian', '2020-05-10', 'Male', 'White', 1),
(2, 'Bella', 'Dog', 'Labrador', '2018-03-22', 'Female', 'Black', 2),
(3, 'Max', 'Dog', 'Bulldog', '2019-07-14', 'Male', 'Brown', 3),
(4, 'Luna', 'Cat', 'Siamese', '2021-01-05', 'Female', 'Cream', 4),
(5, 'Rocky', 'Dog', 'German Shepherd', '2017-09-10', 'Male', 'Tan', 5),
(6, 'Milo', 'Cat', 'British Shorthair', '2020-11-12', 'Male', 'Gray', 6),
(7, 'Chloe', 'Dog', 'Poodle', '2018-12-01', 'Female', 'White', 7),
(8, 'Shadow', 'Cat', 'Bombay', '2019-04-18', 'Male', 'Black', 8),
(9, 'Buddy', 'Dog', 'Beagle', '2021-02-20', 'Male', 'Tricolor', 9),
(10, 'Whiskers', 'Cat', 'Tabby', '2022-06-30', 'Female', 'Brown', 10);

INSERT INTO appointments (appointid, animalid, appointdate, reason) VALUES
(1, 1, '2024-01-05', 'Annual checkup'),
(2, 2, '2024-01-10', 'Vaccination booster'),
(3, 3, '2024-02-02', 'Limping/Injury evaluation'),
(4, 4, '2024-02-15', 'Routine dental cleaning'),
(5, 5, '2024-03-10', 'Skin rash examination'),
(6, 6, '2024-03-10', 'Flea/Tick treatment'),
(7, 7, '2024-04-12', 'Annual vaccination'),
(8, 8, '2024-04-18', 'Spaying consultation'),
(9, 9, '2024-05-02', 'Allergic reaction'),
(10, 10, '2024-05-20', 'Eye infection');

INSERT INTO doctors (doctorid, firstname, lastname, specialization, phonenumber, email)
VALUES
(1, 'Maria', 'Santos', 'General Veterinarian', '987-654-3210', 'maria@example.com'),
(2, 'Antonio', 'Gonzales', 'Feline Specialist', '555-123-4567', 'antonio@example.com'),
(3, 'Felipe', 'Luna', 'Orthopedic Specialist', '111-222-3333', 'felipe@example.com'),
(4, 'Sofia', 'Reyes', 'Dermatology Specialist', '999-888-7777', 'sofia@example.com'),
(5, 'Luis', 'Torres', 'Surgery Specialist', '123-555-7777', 'luis@example.com'),
(6, 'Carmen', 'Fernandez', 'Ophthalmology Specialist', '333-222-1111', 'carmen@example.com'),
(7, 'Marco', 'Dela Cruz', 'Exotic Animal Specialist', '888-444-2222', 'marco@example.com'),
(8, 'Elena', 'Ramos', 'Dental Specialist', '777-123-9000', 'elena@example.com'),
(9, 'Daniel', 'Lopez', 'General Veterinarian', '666-789-2222', 'daniel@example.com'),
(10, 'Paula', 'Garcia', 'Radiology Specialist', '555-222-1111', 'paula@example.com');
