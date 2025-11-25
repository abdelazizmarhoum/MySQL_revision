-- Démarrage MySQL en cmd
-- mysql -u root
-- mysql -u root -p

-- Commandes principales de MySQL
SHOW DATABASES;
SELECT DATABASE();
DROP DATABASE nom_database;
CREATE DATABASE nom_database;
USE nom_database;
SHOW TABLES;
DESCRIBE nom_table;
SOURCE nom_fichier.sql;

-- Création d'un tableau
CREATE TABLE eleves (
    id INT,
    nom VARCHAR(255),
    prenom VARCHAR(255),
    date_naissance DATE
);

-- Modification d'un tableau
ALTER TABLE eleves ADD age INT;
ALTER TABLE eleves MODIFY age TINYINT;
ALTER TABLE eleves DROP age;
ALTER TABLE eleves CHANGE id id_eleve INT;
ALTER TABLE eleves RENAME TO élèves;
RENAME TABLE eleves TO élèves;

-- Suppression d'un tableau
DROP TABLE élèves;

-- Description d'un tableau
DESCRIBE eleves;
SHOW COLUMNS FROM nom_table;

-- Vider un tableau
TRUNCATE TABLE eleves;

-- Réinitialisation auto_increment
ALTER TABLE nom_table AUTO_INCREMENT = 1;
TRUNCATE TABLE nom_table;
DELETE FROM nom_table;

-- Constraints dans la création d'un tableau
CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) UNIQUE,
    prenom VARCHAR(255) NOT NULL,
    date_naissance DATE NULL
);

-- Constraints sur table existante
ALTER TABLE eleves ADD CONSTRAINT pk_id PRIMARY KEY (id);
ALTER TABLE eleves MODIFY CONSTRAINT pk_id PRIMARY KEY (id);
ALTER TABLE eleves DROP CONSTRAINT pk_id;

-- Copier la structure :
CREATE TABLE table2 LIKE table1;

-- Copier les données + structure :
CREATE TABLE table2 AS SELECT * FROM table1;

-- Coller les données :
INSERT INTO table2 SELECT * FROM table1;