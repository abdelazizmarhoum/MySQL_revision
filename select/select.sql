-- Sélectionner toutes les colonnes
SELECT * FROM nom_table;

-- Sélectionner certaines colonnes
SELECT colonnes1, colonnes2 FROM nom_table;

-- Sélectionner avec condition WHERE
SELECT colonnes1, colonnes2 FROM nom_table WHERE condition;

-- Opérateurs de comparaison
SELECT * FROM eleves WHERE nom = 'Doe';
SELECT * FROM eleves WHERE age > 18;
SELECT * FROM eleves WHERE age < 18;
SELECT * FROM eleves WHERE age >= 18;
SELECT * FROM eleves WHERE age <= 18;

-- LIKE, IS, BETWEEN
SELECT * FROM eleves WHERE nom LIKE 'Doe';
SELECT * FROM eleves WHERE nom IS NULL;
SELECT * FROM eleves WHERE age BETWEEN 18 AND 25;

-- Tri avec ORDER BY
SELECT * FROM eleves ORDER BY age DESC;
SELECT * FROM eleves ORDER BY age ASC;

-- Limiter les résultats avec LIMIT
SELECT * FROM eleves LIMIT 10;

-- Combiner WHERE, ORDER BY, LIMIT
SELECT * FROM eleves WHERE age > 18 ORDER BY age DESC LIMIT 10;

-- Sélectionner sans doublons avec DISTINCT
SELECT DISTINCT nom FROM eleves;

-- Concatenation avec CONCAT
SELECT CONCAT('le nom : ', nom, ' le prenom : ', prenom) AS nom_complet FROM eleves;

-- IFNULL pour gérer les valeurs nulles
SELECT IFNULL(nom, 'non renseigne') FROM eleves;

-- UPPER pour majuscules
SELECT UPPER(nom) FROM eleves;

-- LOWER pour minuscules
SELECT LOWER(nom) FROM eleves;

-- LPAD pour ajouter des caractères à gauche
SELECT LPAD(nom, 10, '0') FROM eleves;

-- RPAD pour ajouter des caractères à droite
SELECT RPAD(nom, 10, '0') FROM eleves;

-- SUBSTRING pour extraire une partie de chaîne
SELECT SUBSTRING(nom, 1, 5) FROM eleves;

-- LEFT pour extraire depuis la gauche
SELECT LEFT(nom, 5) FROM eleves;

-- RIGHT pour extraire depuis la droite
SELECT RIGHT(nom, 5) FROM eleves;

-- REPLACE pour remplacer des caractères
SELECT REPLACE(nom, 'a', 'o') FROM eleves;