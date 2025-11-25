CREATE Table employes (
    id int AUTO_INCREMENT PRIMARY key,
    nom VARCHAR(50),
    date_naissance date null ,
    date_entree date null
);
INSERT INTO employes (nom, date_naissance, date_entree) VALUES ('ahmed', '1990-01-01', '2010-01-01'),('mohamed', '1985-01-01', '2005-01-01'),('ali', '1995-01-01', '2015-01-01');

select concat('le date de retrai est : ' , DATE_ADD(date_naissance, INTERVAL 60 YEAR)) as date_retrait from employes;

UPDATE employes SET date_retrait = DATE_ADD(date_naissance, INTERVAL 60 YEAR) , date_paiment = last_day(CURDATE());

SELECT @@lc_time_names;

SET lc_time_names = 'fr_FR';
SET lc_time_names = 'ar_MA';

SET lc_time_names = 'en_US'

SELECT DAYNAME(NOW()) , MONTHNAME(NOW());


ALTER Table employes add column salaire INT;

UPDATE employes SET salaire = 2000 WHERE id = 1;
UPDATE employes SET salaire = 3000 WHERE id = 2;
UPDATE employes SET salaire = 4000 WHERE id = 3;

SELECT * FROM employes;


SELECT count(*) FROM employes where date_naissance < '1990-01-01';

SELECT SUM(salaire) FROM employes;

SELECT AVG(salaire) FROM employes;

SELECT MAX(salaire) FROM employes;
SELECT MIN(salaire) FROM employes;


SELECT COUNT