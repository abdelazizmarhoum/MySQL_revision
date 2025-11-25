-- INSERT avec colonnes spécifiées
INSERT INTO eleves (nom, prenom, date_naissance) VALUES ('Doe', 'John', '2000-01-01');


-- INSERT sans préciser les colonnes
INSERT INTO eleves VALUES ('Doe', 'John', '2000-01-01');


-- INSERT multiple
INSERT INTO eleves (nom, prenom, date_naissance) VALUES ('Doe', 'John', '2000-01-01'), ('Dupont', 'Jean', '2001-01-01');


-- INSERT partiel
INSERT INTO eleves (nom, prenom) VALUES ('Doe', 'John');