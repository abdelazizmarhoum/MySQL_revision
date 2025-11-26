-- Partie 1: Création de Base de Données et Tables

-- 1.1 Crée une base de données appelée `gestion_ecole`
CREATE DATABASE gestion_ecole;

-- 1.2 Utilise la base de données `gestion_ecole`
USE gestion_ecole;

-- 1.3 Crée une table `eleves`
CREATE TABLE eleves (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    age INT,
    date_naissance DATE,
    date_inscription DATETIME
);

-- 1.4 Crée une table `cours`
CREATE TABLE cours (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom_cours VARCHAR(100) UNIQUE,
    prix DECIMAL(10,2),
    duree_heures INT
);

-- Partie 2: Insertion de Données

-- 2.1 Insère 5 élèves dans la table `eleves`
INSERT INTO eleves (nom, prenom, age, date_naissance, date_inscription) VALUES 
('Dupont', 'Jean', 20, '2003-05-15', NOW()),
('Martin', 'Marie', 22, '2001-08-20', NOW()),
('Bernard', 'Pierre', 19, '2004-02-10', NOW()),
('Dubois', 'Sophie', 17, '2006-11-30', NOW()),
('Moreau', 'Luc', 16, '2007-03-25', NOW());

-- 2.2 Insère 3 cours dans la table `cours` sans spécifier les colonnes
INSERT INTO cours VALUES 
(1, 'Mathématiques', 150.00, 30),
(2, 'Français', 120.00, 25),
(3, 'Histoire', 100.00, 20);

-- 2.3 Insère plusieurs cours en une seule requête
INSERT INTO cours (nom_cours, prix, duree_heures) VALUES 
('Physique', 180.00, 35),
('Chimie', 160.00, 32);

-- Partie 3: Sélection de Données

-- 3.1 Sélectionne tous les élèves
SELECT * FROM eleves;

-- 3.2 Sélectionne seulement les noms et prénoms des élèves
SELECT nom, prenom FROM eleves;

-- 3.3 Sélectionne les élèves âgés de plus de 18 ans
SELECT * FROM eleves WHERE age > 18;

-- 3.4 Sélectionne les élèves dont le nom commence par 'D'
SELECT * FROM eleves WHERE nom LIKE 'D%';

-- 3.5 Sélectionne les cours par ordre décroissant de prix
SELECT * FROM cours ORDER BY prix DESC;

-- 3.6 Limite les résultats à 3 élèves
SELECT * FROM eleves LIMIT 3;

-- 3.7 Sélectionne les noms distincts des élèves
SELECT DISTINCT nom FROM eleves;

-- Partie 4: Fonctions sur Chaînes de Caractères

-- 4.1 Affiche les noms en majuscules
SELECT UPPER(nom) FROM eleves;

-- 4.2 Affiche les prénoms en minuscules
SELECT LOWER(prenom) FROM eleves;

-- 4.3 Concatène le nom et le prénom dans une colonne "nom_complet"
SELECT CONCAT(nom, ' ', prenom) AS nom_complet FROM eleves;

-- 4.4 Remplace tous les 'a' par 'o' dans les noms
SELECT REPLACE(nom, 'a', 'o') FROM eleves;

-- 4.5 Affiche les 3 premiers caractères des prénoms
SELECT LEFT(prenom, 3) FROM eleves;

-- Partie 5: Fonctions sur Dates

-- 5.1 Affiche la date et heure actuelles
SELECT NOW();

-- 5.2 Affiche seulement la date actuelle
SELECT CURDATE();

-- 5.3 Affiche seulement l'heure actuelle
SELECT CURTIME();

-- 5.4 Extrait l'année de naissance de chaque élève
SELECT YEAR(date_naissance) FROM eleves;

-- 5.5 Extrait le mois de naissance de chaque élève
SELECT MONTH(date_naissance) FROM eleves;

-- 5.6 Affiche le nom du jour de la semaine pour chaque date de naissance
SELECT DAYNAME(date_naissance) FROM eleves;

-- 5.7 Ajoute 1 an à la date d'inscription de chaque élève
SELECT DATE_ADD(date_inscription, INTERVAL 1 YEAR) FROM eleves;

-- 5.8 Calcule l'âge de chaque élève en utilisant sa date de naissance
SELECT TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age_calcule FROM eleves;

-- Partie 6: Fonctions Numériques

-- 6.1 Trouve le prix maximum des cours
SELECT MAX(prix) FROM cours;

-- 6.2 Trouve le prix minimum des cours
SELECT MIN(prix) FROM cours;

-- 6.3 Calcule la moyenne des prix des cours
SELECT AVG(prix) FROM cours;

-- 6.4 Calcule la somme totale des prix des cours
SELECT SUM(prix) FROM cours;

-- 6.5 Compte le nombre total d'élèves
SELECT COUNT(*) FROM eleves;

-- 6.6 Compte le nombre de cours
SELECT COUNT(*) FROM cours;

-- Partie 7: Modification et Suppression

-- 7.1 Modifie l'âge d'un élève spécifique
UPDATE eleves SET age = 21 WHERE nom = 'Dupont';

-- 7.2 Augmente tous les prix des cours de 10%
UPDATE cours SET prix = prix * 1.10;

-- 7.3 Supprime un élève spécifique
DELETE FROM eleves WHERE nom = 'Moreau';

-- 7.4 Supprime tous les élèves de moins de 16 ans
DELETE FROM eleves WHERE age < 16;

-- Partie 8: Manipulation de Tables

-- 8.1 Ajoute une colonne `email` à la table `eleves`
ALTER TABLE eleves ADD email VARCHAR(100);


-- 8.3 Renomme la colonne `nom_cours` en `titre_cours`
ALTER TABLE cours CHANGE nom_cours titre_cours VARCHAR(100);

-- 8.4 Supprime la colonne `email` de la table `eleves`
ALTER TABLE eleves DROP email;

-- 8.5 Crée une nouvelle table `cours_backup` avec la même structure que `cours`
CREATE TABLE cours_backup LIKE cours;

-- 8.6 Copie toutes les données de `cours` vers `cours_backup`
INSERT INTO cours_backup SELECT * FROM cours;

-- Partie 9: Combinaison de Concepts

-- 9.1 Sélectionne les 2 cours les plus chers
SELECT * FROM cours ORDER BY prix DESC LIMIT 2;

-- 9.2 Affiche le nom complet des élèves (nom + prénom) par ordre alphabétique
SELECT CONCAT(nom, ' ', prenom) AS nom_complet FROM eleves ORDER BY nom_complet;

-- 9.3 Calcule la différence en jours entre la date d'inscription et aujourd'hui
SELECT DATEDIFF(CURDATE(), date_inscription) FROM eleves;

-- 9.4 Trouve les élèves nés en janvier
SELECT * FROM eleves WHERE MONTH(date_naissance) = 1;

-- 9.5 Formate les dates de naissance au format "JJ/MM/AAAA"
SELECT DATE_FORMAT(date_naissance, '%d/%m/%Y') FROM eleves;

-- 9.6 Affiche les cours dont le prix est entre 50 et 200 euros, triés par durée
SELECT * FROM cours WHERE prix BETWEEN 50 AND 200 ORDER BY duree_heures;