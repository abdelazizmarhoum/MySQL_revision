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


ALTER TABLE employes ADD COLUMN lieu_naissance VARCHAR(50);

UPDATE employes SET lieu_naissance = 'Tunis' WHERE id = 1;
UPDATE employes SET lieu_naissance = 'Ariana' WHERE id = 2;
UPDATE employes SET lieu_naissance = 'Tunis' WHERE id = 3;


SELECT count(*) , lieu_naissance FROM employes;

SELECT count(*) , lieu_naissance FROM employes GROUP BY lieu_naissance;

--Exerice
--Ajouter le champ 'service' a la table 'employes' , ce champ doit contenir des valeur comme RH , IT , Comptabilité , Marketing.

ALTER table employes ADD COLUMN service VARCHAR(50);

UPDATE employes SET service = 'RH' WHERE id = 1;
update employes set service = 'IT' where id = 2;
UPDATE employes SET service = 'IT' WHERE id = 3;


SELECT AVG(salaire),service FROM employes GROUP BY service;


--Tester le moyenne renvoyé si elle est superieur a 10000 , afficher 'elevé' sinon 'normal'
SELECT AVG(salaire),service IF(AVG(salaire)>3000,'elevé','normal') as Test FROM employes GROUP BY service;

DESCRIBE employes;



INSERT INTO employes (nom, date_naissance, date_entree, salaire, lieu_naissance, service) VALUES
('Ahmed Karim', '1990-05-12', '2020-03-01', 7500, 'Rabat', 'Informatique'),
('Sara El Amrani', '1995-08-22', '2021-01-15', 6800, 'Casablanca', 'Comptabilité'),
('Youssef Bakkali', '1988-11-03', '2019-09-10', 8200, 'Fès', 'Marketing'),
('Noura Idrissi', '1992-02-17', '2022-06-05', 7000, 'Marrakech', 'Ressources Humaines'),
('Omar Chraibi', '1985-09-25', '2018-02-20', 9000, 'Agadir', 'Informatique'),
('Hanae Benali', '1998-01-30', '2023-03-12', 6400, 'Tanger', 'Ventes'),
('Walid Essalhi', '1991-04-09', '2020-11-01', 7600, 'Rabat', 'Logistique'),
('Imane Berrada', '1996-10-14', '2021-04-18', 6700, 'Oujda', 'Comptabilité'),
('Mehdi Lahlou', '1987-07-02', '2017-12-01', 8800, 'Casablanca', 'Direction'),
('Salma Fikri', '1993-03-19', '2020-07-20', 7200, 'Kénitra', 'Marketing'),
('Reda Mouline', '1989-12-11', '2019-05-11', 8100, 'Mohammedia', 'Informatique'),
('Chaimae Raji', '1997-06-27', '2022-10-28', 6600, 'Tétouan', 'Ventes'),
('Idriss El Ghozzi', '1986-01-05', '2018-04-07', 8900, 'Fès', 'Logistique'),
('Lina Sabiri', '1994-09-16', '2021-02-17', 7100, 'Rabat', 'Ressources Humaines'),
('Zakaria Mansouri', '1990-12-29', '2020-06-12', 7800, 'Casablanca', 'Comptabilité'),
('Asmae El Fassi', '1999-03-04', '2023-01-09', 6300, 'Marrakech', 'Marketing'),
('Khalid Benchekroun', '1984-08-08', '2017-03-03', 9200, 'Agadir', 'Direction'),
('Rania Touimi', '1996-12-02', '2021-09-15', 6900, 'Tanger', 'Informatique'),
('Hamza Ziani', '1992-05-25', '2022-02-20', 7400, 'Casablanca', 'Ventes'),
('Yasmine Maâninou', '1995-11-07', '2020-10-10', 7000, 'Rabat', 'Logistique');
INSERT INTO employes (nom, date_naissance, date_entree, salaire, lieu_naissance, service) VALUES
('Mohamed Slaoui', '1987-03-21', '2018-05-10', 8300, 'Casablanca', 'Informatique'),
('Karima Othmani', '1994-11-12', '2021-08-03', 6900, 'Rabat', 'Comptabilité'),
('Hicham Rmili', '1989-07-18', '2019-04-20', 7700, 'Agadir', 'Marketing'),
('Soukaina Hariri', '1996-09-02', '2022-09-12', 6500, 'Marrakech', 'Ventes'),
('Abderrahim Madi', '1985-02-14', '2017-11-01', 9100, 'Tanger', 'Direction'),
('Fatima Zahra Barakat', '1993-06-30', '2020-01-28', 7200, 'Fès', 'Ressources Humaines'),
('Anas Lahmidi', '1991-04-25', '2020-06-19', 7800, 'Oujda', 'Logistique'),
('Samira Benomar', '1997-12-09', '2023-02-03', 6400, 'Casablanca', 'Ventes'),
('Mustapha Sefiani', '1988-10-15', '2019-03-11', 8050, 'Kénitra', 'Informatique'),
('Ilham El Kholti', '1995-04-03', '2021-07-22', 6800, 'Rabat', 'Marketing'),
('Ayoub Errami', '1993-08-17', '2020-09-14', 7400, 'Fès', 'Comptabilité'),
('Chaimae Jdaini', '1998-02-20', '2022-12-08', 6600, 'Meknès', 'Ressources Humaines'),
('Othmane Idrissi', '1986-11-29', '2018-01-15', 8900, 'Casablanca', 'Direction'),
('Siham Tahiri', '1997-01-11', '2023-04-02', 6250, 'Tétouan', 'Logistique'),
('Ismail El Brihi', '1990-03-06', '2020-03-21', 7600, 'Rabat', 'Informatique'),
('Meryem Ait Lhaj', '1994-07-25', '2021-06-30', 7000, 'Agadir', 'Ventes'),
('Nabil Moubarik', '1989-09-13', '2019-10-18', 8200, 'Casablanca', 'Marketing'),
('Rachida Kharrazi', '1993-12-27', '2020-12-14', 7100, 'Marrakech', 'Comptabilité'),
('Hamid Chennoufi', '1985-06-04', '2017-08-10', 9300, 'Tanger', 'Direction'),
('Sarah El Ghazali', '1998-05-09', '2023-03-11', 6300, 'Rabat', 'Ressources Humaines'),
('Adil El Mounir', '1991-10-22', '2020-05-09', 7700, 'Casablanca', 'Logistique'),
('Nadia El Mouti', '1996-06-17', '2022-07-27', 6550, 'Oujda', 'Ventes'),
('Yassine Ghallab', '1988-12-05', '2019-02-03', 8100, 'Fès', 'Marketing'),
('Imane Chami', '1995-09-08', '2021-03-29', 6900, 'Marrakech', 'Comptabilité'),
('Hassan Loukili', '1987-01-30', '2018-10-22', 8800, 'Casablanca', 'Direction'),
('Sofia El Mernissi', '1994-03-15', '2021-05-18', 7200, 'Tanger', 'Informatique'),
('Rayan Chafik', '1992-08-01', '2020-11-25', 7500, 'Rabat', 'Logistique'),
('Yasmina Karmouni', '1997-04-27', '2022-02-12', 6400, 'Agadir', 'Ventes'),
('Omar Azouzi', '1986-05-20', '2017-04-17', 9150, 'Casablanca', 'Direction'),
('Kawtar Elmoudden', '1993-10-03', '2020-02-14', 7100, 'Kénitra', 'Ressources Humaines'),
('Tarik El Gourari', '1990-11-14', '2020-08-10', 7800, 'Fès', 'Informatique'),
('Salma El Maati', '1996-03-12', '2022-04-29', 6700, 'Rabat', 'Marketing'),
('Jamal Nouini', '1989-07-07', '2019-09-30', 8250, 'Casablanca', 'Logistique'),
('Hiba El Yousfi', '1995-01-02', '2021-12-06', 6900, 'Marrakech', 'Comptabilité'),
('Khalil Benyoussef', '1987-02-28', '2018-06-21', 9050, 'Oujda', 'Direction'),
('Naoual El Jamai', '1998-08-11', '2023-01-30', 6300, 'Agadir', 'Ventes'),
('Badr El Mekki', '1992-09-19', '2020-04-02', 7600, 'Casablanca', 'Marketing'),
('Iman Sairi', '1994-05-24', '2021-09-19', 7000, 'Tanger', 'Ressources Humaines'),
('Said Louardi', '1988-04-16', '2019-07-25', 8400, 'Fès', 'Informatique'),
('Nour El Azzouzi', '1996-12-22', '2022-10-08', 6600, 'Marrakech', 'Logistique');




-- where
SELECT COUNT(*),service FROM employes WHERE salaire > 7000 GROUP BY service;

-- Having
SELECT SUM(salaire),service FROM employes GROUP BY service HAVING SUM(salaire) > 5000;



SELECT SUM(salaire),service FROM employes WHERE service IN('Informatique','Comptabilité')  GROUP BY service HAVING SUM(salaire) > 2000 ;





SELECT SUM(salaire),AVG(salaire),service FROM employes 
WHERE salaire IN(SELECT salaire FROM employes where service = 'Comptabilité') 
OR salaire > (SELECT MAX(salaire) FROM employes WHERE service = 'Informatique') 
GROUP BY service HAVING SUM(salaire) > 50000;



