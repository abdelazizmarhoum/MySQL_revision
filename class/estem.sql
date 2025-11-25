DESCRIBE produit;

RENAME TABLE produit TO produits;

SELECT * FROM produits;

DESCRIBE produits;

ALTER Table produits add qtte INT NULL;

ALTER Table produits add observation VARCHAR(10) NULL;

ALTER TABLE produits MODIFY observation VARCHAR(20) null;

ALTER Table produits CHANGE COLUMN qtte quantite INT NULL;

DESCRIBE produits;

SELECT * FROM produits;

ALTER Table produits DROP COLUMN observation;

DESCRIBE produits;

UPDATE produits SET quantite = 10;

UPDATE produits SET quantite = 30 WHERE id = 1;

UPDATE produits SET quantite = 40 WHERE id = 2;

INSERT INTO produits (quantite) VALUES (20);

DELETE FROM produits WHERE id is NULL;

SELECT * FROM produits;

ALTER Table produits MODIFY id INT NOT NULL UNIQUE;


INSERT INTO produits (id,marque,prix,quantite) VALUES (5,'Dell',1500,10);

INSERT INTO produits (id,marque,prix,quantite) VALUES (null,'HP',1300,15);

INSERT INTO produits (id,marque,prix,quantite) VALUES (100,'Lenovo',1700,20);

INSERT INTO produits (marque,prix,quantite) VALUES ('Asus',1200,25);

INSERT INTO produits (id,marque,prix,quantite) VALUES (90,'Acer',1400,30);

INSERT INTO produits (marque,prix,quantite) VALUES ('Toshiba',1600,35);

DELETE FROM produits WHERE id >= 90;

INSERT INTO produits (marque,prix,quantite) VALUES ('Sony',1800,40);

DELETE FROM produits WHERE id >= 100;

ALTER Table produits AUTO_INCREMENT=7;

INSERT INTO produits (marque,prix,quantite) VALUES ('Apple',2000,45);


DELETE FROM produits;

INSERT INTO produits (marque,prix,quantite) VALUES ('Dell',1500,10);
INSERT INTO produits (marque,prix,quantite) VALUES ('HP',1300,15);
INSERT INTO produits (marque,prix,quantite) VALUES ('Lenovo',1700,20);
SELECT * FROM produits;

TRUNCATE Table produits;

SELECT * FROM produits;



-- 8 Novembre 2025 
-- ************************************************************************************************************************************************************************************************************************************************************
-- ************************************************************************************************************************************************************************************************************************************************************

CREATE Table produit_new as SELECT * FROM produits;

SELECT * FROM produits;

CREATE Table produit_new2 like produits;

SELECT * FROM produit_new2;

DESCRIBE produit_new2;

CREATE Table produit_new3 like produits;
INSERT INTO produit_new3 SELECT * FROM produits;

DESCRIBE produit_new3;
SELECT * FROM produit_new3;


CREATE Table test (
    id INT PRIMARY KEY,
    name VARCHAR(50)
)

INSERT INTO test(id,name) VALUES(1,'test')


SELECT * FROM produits;

ALTER Table produits MODIFY quantite INT NULL;

INSERT INTO produits(marque,prix) VALUES('test',100);


SELECT marque , prix , quantite , prix*quantite FROM produits;


SELECT CONCAT('la quantité est ', quantite, ' pour le produit ', marque, ' coûte ') as test FROM produits;

SELECT marque , prix , quantite , prix + IFNULL(quantite,0) as somme FROM produits;


select marque , prix , quantite , prix * IFNULL(quantite,1) as total FROM produits;

SELECT CONCAT('la quantité est de produit ', marque , ' est ' , IFNULL(quantite,'repture')) as quantite FROM produits;

-- this is not working
-- SELECT * FROM produits WHERE quantite = null;
SELECT * FROM produits WHERE quantite is NULL;

SELECT * FROM produits ORDER BY marque LIMIT 2;
SELECT * FROM produits ORDER BY marque DESC;

SELECT * FROM produits ORDER BY marque , prix;
SELECT * FROM produits ORDER BY marque , prix ASC;

SELECT CONCAT('LE produit : ' , marque , ' vaut ' , prix ) as prix FROM produits

SELECT CONCAT_WS ('@ ' , marque , prix , quantite) as produit FROM produits

SELECT UPPER(marque) FROM produits;
SELECT LOWER(marque) FROM produits;

SELECT LPAD(marque,5,'*') , RPAD(marque,5,'*') FROM produits;

SELECT marque , SUBSTRING(marque,1,2) as chaine_de_caractaire FROM produits;

SELECT marque , SUBSTRING(marque FROM 1 FOR 2) as chaine_de_caractaire FROM produits;

SELECT marque , SUBPARTITION