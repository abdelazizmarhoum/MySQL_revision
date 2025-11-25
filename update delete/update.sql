-- UPDATE d'une colonne
UPDATE eleve SET nom = 'aziz' WHERE id = 1;

-- UPDATE de plusieurs colonnes
UPDATE eleve SET age = 20, nom = 'abdelaziz' WHERE id = 1;

-- DELETE avec condition
DELETE FROM eleves WHERE nom = 'Doe';