CREATE TABLE etudiants (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50),
    prenom VARCHAR(50)
);

INSERT INTO etudiants (nom, prenom) VALUES ('aziz' , 'marhoum');
INSERT INTO etudiants (nom , prenom) VALUES ('ayoub' , 'amin')

SELECT CONCAT(SUBSTRING(prenom, 1,1) ,'.', nom , '@estem.ma')  FROM etudiants;

ALTER Table etudiants ADD COLUMN email VARCHAR(50);

UPDATE etudiants SET email = CONCAT(SUBSTRING(prenom, 1 ,1) ,'.', nom , '@estem.ma');




SELECT nom, INSERT(nom,1,1,'etudiant') as test FROM etudiants;


SELECT nom, REPLACE(nom,'a','AAAA') as test FROM etudiants;


SELECT  email ,REPLACE(email,'estem','EstemMaroc') as test FROM etudiants;


UPDATE etudiants SET email = REPLACE(email,'estem','EstemMaroc');


ALTER Table etudiants ADD birth_date DATE NULL;


UPDATE etudiants SET birth_date = '2025-11-15' WHERE id = 1;

INSERT INTO etudiants (nom,prenom,email,birth_date) VALUES ('ahmed','ali','ali.ahmed@estem.maroc','2025-11-15');

UPDATE etudiants SET birth_date = '2025-13-15' WHERE id = 2;

SELECT CONCAT('the date and time now is ', NOW()) as test1;
SELECT CONCAT(' the current date is ' , CURDATE()) as test2;
select CONCAT(' the current time is ' , CURTIME()) as test3;


SELECT DAYNAME(CURDATE()) as test1;
SELECT day(CURDATE()) as test2;

SELECT MONTH(CURDATE()) as test3;
SELECT MONTHNAME(CURDATE()) as test4;

SELECT YEAR(CURDATE()) as test5;


SELECT CONCAT(DAYNAME(DATE('2004-11-18')),' ',DAY(DATE('2004-11-18')),' ',MONTHNAME(DATE('2004-11-18')),' ',YEAR(DATE('2004-11-18'))) as birth_day;

SELECT nom , DATE_FORMAT(birth_date,'%W , %M %e ,%Y') as test FROM etudiants;



SELECT DATE('2025-11-15') - DATE('2022-07-03');

SELECT DATEDIFF(CURDATE(),'2022-07-03')





-- TIMESTAMPDIFF
SELECT TIMESTAMPDIFF(day,now(),'2005-11-21');
SELECT TIMESTAMPDIFF(WEEK,now(),'2005-11-21');
SELECT TIMESTAMPDIFF(MONTH,now(),'2005-11-21');
SELECT TIMESTAMPDIFF(YEAR,now(),'2005-11-21');

-- DATEDIFF
SELECT DATEDIFF(day,'2004-11-21','2005-11-21');
SELECT DATEDIFF(WEEK,now(),'2005-11-21');
SELECT DATEDIFF(MONTH,now(),'2005-11-21');
SELECT DATEDIFF(YEAR,now(),'2005-11-21');




SELECT DATE_ADD(now(),INTERVAL 3 DAY);

SELECT DATE_SUB(now(),INTERVAL 3 DAY);

SELECT CONCAT('le nom du joure de mon aniveraire dans 5 ans est : ' , DAYNAME(DATE_ADD('2025-11-18',INTERVAL 5 YEAR))) as test;
SELECT CONCAT('le nom du joure de mon aniveraire dans 10 ans est : ' , DAYNAME(DATE_ADD('2025-11-18',INTERVAL 10 YEAR))) as test;
SELECT CONCAT('le nom du joure de mon aniveraire dans 10 ans est : ' , DAYNAME(DATE_ADD('2025-11-18',INTERVAL 20 YEAR))) as test;

SELECT CONCAT("le nom du joure de mon aniveraire d'il y'a 5 ans est : " , DAYNAME(DATE_SUB('2025-11-18',INTERVAL 5 YEAR))) as test;
SELECT CONCAT("le nom du joure de mon aniveraire d'il y'a 10 ans est : " , DAYNAME(DATE_SUB('2025-11-18',INTERVAL 10 YEAR))) as test;
SELECT CONCAT("le nom du joure de mon aniveraire d'il y'a 20 ans est : " , DAYNAME(DATE_SUB('2025-11-18',INTERVAL 20 YEAR))) as test;

