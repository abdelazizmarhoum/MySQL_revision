--Partie (SQL - 20 points)

--1 : 
mysql -u root -p
SHOW DATABASES
USE employee
SHOW TABLES

--2 :
-- c'est pour exécuter les commandes sql a partire d'un fichier .sql

--3 : 
CREATE Table employes (
    NumEmp int AUTO_INCREMENT PRIMARY KEY,
    NomEmp VARCHAR(50),
    SalaireEmp int ,
    DateNaissance DATE,
    DateEmbauche DATE,
    CodeService VARCHAR(50)
)

--4 :



--5 : 
SELECT * FROM employes where SalaireEmp BETWEEN 5000 AND 8000

--6 : 
SELECT * FROM employes WHERE SalaireEmp > (SELECT SalaireEmp FROM employes WHERE NumEmp = 26) LIMIT 100

--7 :

