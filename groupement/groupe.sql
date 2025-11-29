-- 1. Compter le nombre d'employés par département
SELECT COUNT(*),departement as nombre_employes FROM employes GROUP BY departement;

-- 2. Calculer le salaire moyen par poste
SELECT AVG(salaire),poste as salaire_moyen FROM employes GROUP BY poste;

-- 3. Trouver le salaire maximum par département
SELECT MAX(salaire),departement as salaire_max FROM employes GROUP BY departement;

-- 4. Afficher seulement les départements avec plus de 10 employés
SELECT COUNT(*),departement as nombre_employes FROM employes GROUP BY departement HAVING COUNT(*) > 10;

-- 5. Afficher les postes avec un salaire moyen supérieur à 50000
SELECT AVG(salaire),poste as salaire_moyen FROM employes GROUP BY poste HAVING AVG(salaire) > 50000;

-- 6. Utilisation de HAVING et WHERE ensemble
SELECT SUM(salaire),service FROM employes WHERE service IN('Informatique','Comptabilité') GROUP BY service HAVING SUM(salaire) > 2000;

-- 7. Utilisation du IF pour déterminer le statut adulte/mineur
SELECT IF(age>=18,'adulte','mineur') as statut FROM personnes;