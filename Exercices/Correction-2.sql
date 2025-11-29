-- =================================================================
-- Fichier de solution pour l'exercice pratique : Gestion d'une Base de Données Scolaire
-- Ce script se base STRICTEMENT sur le contenu du fichier de révision fourni.
-- AUCUN JOIN n'est utilisé.
-- =================================================================


-- -----------------------------------------------------------------
-- PARTIE 1 : Installation et Démarrage (Réponses conceptuelles)
-- -----------------------------------------------------------------

-- 1.1. Quel logiciel permet de mettre en place rapidement un serveur web local avec MySQL et Apache ?
-- Réponse : Xampp

-- 1.2. Comment démarrer MySQL en ligne de commande (cmd) avec un accès root sans mot de passe ?
-- Réponse : mysql -u root

-- 1.3. Quelle commande permet de quitter le client MySQL ?
-- Réponse : exit


-- -----------------------------------------------------------------
-- PARTIE 2 : Création de la Base de Données
-- -----------------------------------------------------------------

-- 2.1. Créez une base de données nommée `ecole_centrale`.
DROP DATABASE IF EXISTS ecole_centrale;
CREATE DATABASE ecole_centrale;

-- 2.2. Connectez-vous à cette base de données.
USE ecole_centrale;

-- 2.3. Quelle commande permet d'afficher le nom de la base de données actuelle ?
SELECT DATABASE();


-- -----------------------------------------------------------------
-- PARTIE 3 : Création des Tables
-- -----------------------------------------------------------------

-- 3.1. Créez une table `eleves`
CREATE TABLE eleves (
    id_eleve INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    date_naissance DATE,
    ville VARCHAR(100) NULL
);

-- 3.2. Créez une table `matieres`
CREATE TABLE matieres (
    id_matiere INT AUTO_INCREMENT PRIMARY KEY,
    nom_matiere VARCHAR(100) UNIQUE NOT NULL
);

-- 3.3. Créez une table `professeurs`
CREATE TABLE professeurs (
    id_professeur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    prenom VARCHAR(100),
    salaire INT,
    specialite VARCHAR(100)
);

-- 3.4. Créez une table `cours`
CREATE TABLE cours (
    id_cours INT AUTO_INCREMENT PRIMARY KEY,
    id_professeur INT,
    id_matiere INT
);

-- 3.5. Créez une table `notes`
CREATE TABLE notes (
    id_note INT AUTO_INCREMENT PRIMARY KEY,
    id_eleve INT,
    id_cours INT,
    valeur_note INT,
    date_evaluation DATE
);


-- -----------------------------------------------------------------
-- PARTIE 4 : Modification des Tables
-- -----------------------------------------------------------------

-- 4.1. Ajoutez un champ `email` de type chaîne de 255 caractères à la table `professeurs`.
ALTER TABLE professeurs ADD email VARCHAR(255);

-- 4.2. Assurez-vous que ce nouvel email est unique pour chaque professeur.
ALTER TABLE professeurs ADD CONSTRAINT uc_email UNIQUE (email);

-- 4.3. Renommez la table `notes` en `evaluations`.
RENAME TABLE notes TO evaluations;


-- -----------------------------------------------------------------
-- PARTIE 5 : Insertion de Données
-- -----------------------------------------------------------------

-- 5.1. Insérez 3 professeurs
INSERT INTO professeurs (nom, prenom, salaire, specialite, email) VALUES
('Dupont', 'Jean', 3000, 'Mathématiques', 'j.dupont@email.com'),
('Martin', 'Sophie', 3200, 'Histoire', 's.martin@email.com'),
('Durand', 'Paul', 3500, 'Sciences', 'p.durand@email.com');

-- 5.2. Insérez 3 matières
INSERT INTO matieres (nom_matiere) VALUES ('Mathématiques'), ('Histoire'), ('Sciences');

-- 5.3. Insérez 5 élèves
INSERT INTO eleves (nom, prenom, date_naissance, ville) VALUES
('Lefevre', 'Alice', '2005-03-15', 'Paris'),
('Bernard', 'Luc', '2006-07-22', 'Lyon'),
('Petit', 'Manon', '2005-11-05', 'Paris'),
('Rousseau', 'Jules', '2006-01-30', 'Marseille'),
('Morel', 'Chloe', '2005-09-18', 'Lille');

-- 5.4. Insérez 4 cours
INSERT INTO cours (id_professeur, id_matiere) VALUES
(1, 1), (2, 2), (3, 3), (1, 1);

-- 5.5. Insérez 10 évaluations
INSERT INTO evaluations (id_eleve, id_cours, valeur_note, date_evaluation) VALUES
(1, 1, 15, '2023-10-10'), (1, 2, 12, '2023-10-11'),
(2, 1, 18, '2023-10-10'), (2, 4, 17, '2023-10-12'),
(3, 1, 8, '2023-10-10'), (3, 3, 14, '2023-10-13'),
(4, 2, 16, '2023-10-11'), (4, 3, 19, '2023-10-13'),
(5, 1, 11, '2023-10-10'), (5, 2, 13, '2023-10-11');


-- -----------------------------------------------------------------
-- PARTIE 6 : Requêtes SELECT de Base
-- -----------------------------------------------------------------

-- 6.1. Affichez tous les élèves.
SELECT * FROM eleves;

-- 6.2. Affichez le nom et la spécialité de tous les professeurs.
SELECT nom, specialite FROM professeurs;

-- 6.3. Affichez les élèves qui habitent à "Paris".
SELECT * FROM eleves WHERE ville = 'Paris';

-- 6.4. Affichez les professeurs dont le salaire est supérieur ou égal à 3000.
SELECT * FROM professeurs WHERE salaire >= 3000;

-- 6.5. Affichez les cours dont l'`id_matiere` est 1.
SELECT * FROM cours WHERE id_matiere = 1;

-- 6.6. Affichez les élèves dont le nom contient la lettre "a".
SELECT * FROM eleves WHERE nom LIKE '%a%';

-- 6.7. Affichez les élèves triés par date de naissance du plus jeune au plus âgé.
SELECT * FROM eleves ORDER BY date_naissance DESC;

-- 6.8. Affichez les 3 premières évaluations de la table.
SELECT * FROM evaluations LIMIT 3;


-- -----------------------------------------------------------------
-- PARTIE 7 : Fonctions de Chaînes et Conditions
-- -----------------------------------------------------------------

-- 7.1. Affichez le nom complet (`nom` + `prenom`) de chaque élève dans une colonne nommée `nom_complet`.
SELECT CONCAT(nom, ' ', prenom) AS nom_complet FROM eleves;

-- 7.2. Affichez les noms des professeurs en majuscules.
SELECT UPPER(nom) FROM professeurs;

-- 7.3. Affichez les noms des matières en minuscules.
SELECT LOWER(nom_matiere) FROM matieres;

-- 7.4. Affichez les 5 premiers caractères du nom de chaque élève.
SELECT LEFT(nom, 5) FROM eleves;

-- 7.5. Affichez les noms des élèves en remplaçant la lettre "e" par "3".
SELECT REPLACE(nom, 'e', '3') FROM eleves;

-- 7.6. Affichez la liste des élèves, et si leur `ville` est NULL, affichez "Ville non renseignée".
SELECT nom, IFNULL(ville, 'Ville non renseignée') FROM eleves;


-- -----------------------------------------------------------------
-- PARTIE 8 : Fonctions de Date et Heure
-- -----------------------------------------------------------------

-- 8.1. Affichez la date et l'heure actuelles.
SELECT NOW();

-- 8.2. Affichez l'année de naissance de chaque élève.
SELECT nom, YEAR(date_naissance) FROM eleves;

-- 8.3. Affichez le nom du mois de naissance de chaque élève (configurez pour l'afficher en français).
SET lc_time_names = 'fr_FR';
SELECT nom, MONTHNAME(date_naissance) FROM eleves;

-- 8.4. Affichez l'âge de chaque élève en années.
SELECT nom, TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) AS age FROM eleves;

-- 8.5. Affichez les évaluations qui ont eu lieu il y a moins de 60 jours.
SELECT * FROM evaluations WHERE date_evaluation >= DATE_SUB(CURDATE(), INTERVAL 60 DAY);

-- 8.6. Affichez la date d'évaluation de chaque note au format "Jour/Mois/Année".
SELECT valeur_note, DATE_FORMAT(date_evaluation, '%d/%m/%Y') FROM evaluations;


-- -----------------------------------------------------------------
-- PARTIE 9 : Fonctions Numériques et de Regroupement
-- -----------------------------------------------------------------

-- 9.1. Calculez la moyenne, la note minimale et la note maximale de toutes les évaluations.
SELECT AVG(valeur_note) AS moyenne, MIN(valeur_note) AS minimale, MAX(valeur_note) AS maximale FROM evaluations;

-- 9.2. Calculez la somme de tous les salaires des professeurs.
SELECT SUM(salaire) FROM professeurs;

-- 9.3. Comptez le nombre d'élèves par ville.
SELECT ville, COUNT(*) FROM eleves GROUP BY ville;


-- 9.5. Affichez les spécialités et le nombre de professeurs dans chacune.
SELECT specialite, COUNT(*) FROM professeurs GROUP BY specialite;

-- 9.6. Affichez les villes qui ont plus d'un élève.
SELECT ville, COUNT(*) FROM eleves GROUP BY ville HAVING COUNT(*) > 1;


-- -----------------------------------------------------------------
-- PARTIE 10 : Mises à Jour et Suppressions
-- -----------------------------------------------------------------

-- 10.1. Augmentez le salaire de tous les professeurs de 200.
UPDATE professeurs SET salaire = salaire + 200;

-- 10.2. Mettez à jour l'élève avec l'`id_eleve` 3 pour que sa ville devienne "Lyon".
UPDATE eleves SET ville = 'Lyon' WHERE id_eleve = 3;

-- 10.3. Supprimez toutes les évaluations dont la `valeur_note` est inférieure à 10.
DELETE FROM evaluations WHERE valeur_note < 10;


-- -----------------------------------------------------------------
-- PARTIE 11 : Requêtes Complexes avec GROUP BY et Sous-requêtes
-- -----------------------------------------------------------------

-- 11.2. Affichez les `id_professeur` qui donnent plus d'un cours.
SELECT id_professeur FROM cours GROUP BY id_professeur HAVING COUNT(id_cours) > 1;

-- 11.3. En utilisant `IF`, créez une requête qui affiche le nom de chaque élève et une colonne `statut`.
SELECT nom, IF(TIMESTAMPDIFF(YEAR, date_naissance, CURDATE()) >= 18, 'Majeur', 'Mineur') AS statut FROM eleves;

-- 11.4. Affichez les élèves qui n'ont aucune évaluation (utilisez une sous-requête avec NOT IN).
SELECT nom, prenom FROM eleves WHERE id_eleve NOT IN (SELECT DISTINCT id_eleve FROM evaluations);

-- 11.5. Créez une requête qui affiche pour chaque `id_eleve` : sa note minimale, sa note maximale, et le nombre de ses évaluations.
SELECT id_eleve, MIN(valeur_note), MAX(valeur_note), COUNT(id_note)
FROM evaluations
GROUP BY id_eleve
HAVING COUNT(id_note) >= 2;