CREATE TABLE IF NOT EXISTS categories
    (
        id_categories          INT(3) auto_increment NOT NULL,
        libelle_categories     VARCHAR(100) NOT NULL,
        description_categories VARCHAR(255),
        PRIMARY KEY (id_categories)
    );

CREATE TABLE IF NOT EXISTS promos
    (
        id_promos               INT(8) auto_increment NOT NULL,
        libelle_promos          VARCHAR(100) NOT NULL,
        description_promos      VARCHAR(255),
        prixpromo_promos        INT(10),
        prix_promos             INT(10),
        date_promos             DATE,
        visuel_promos           VARCHAR(255),
        nbclics_promos          INT(11),
        id_categories           INT(3),
        id_clients              INT(5),
        PRIMARY KEY (id_promos)
    );

CREATE TABLE IF NOT EXISTS clients
    (
        id_clients              INT(5) auto_increment NOT NULL,
        libelle_clients         VARCHAR(100) NOT NULL,
        description_clients     VARCHAR(255),
        logo_clients            VARCHAR(255),
        PRIMARY KEY (id_clients)
    );

CREATE TABLE IF NOT EXISTS utilisateurs
    (
        id_utilisateurs            INT(10) auto_increment NOT NULL,
        email_utilisateurs         VARCHAR(50) NOT NULL,
        password_utilisateurs      VARCHAR(50) NOT NULL,
        nom_utilisateurs           VARCHAR(50) NOT NULL,
        prenom_utilisateurs        VARCHAR(50) NOT NULL,
        parrain_utilisateurs       BOOLEAN,
        id_roles                   INT(3),
        PRIMARY KEY (id_utilisateurs)
    );

CREATE TABLE IF NOT EXISTS roles
    (
        id_roles            INT(3) auto_increment NOT NULL,
        libelle_roles       VARCHAR(100) NOT NULL,
        description_roles   VARCHAR(255),
        PRIMARY KEY (id_roles)
    );

CREATE TABLE IF NOT EXISTS favoris
    (
        id_categories       INT(3) auto_increment NOT NULL,
        id_utilisateurs     INT(10) NOT NULL,
        PRIMARY KEY (id_categories, id_utilisateurs)
    );
             
             
ALTER TABLE promos ADD CONSTRAINT fk_promos_id_categories FOREIGN KEY (id_categories) REFERENCES categories (id_categories);
ALTER TABLE promos ADD CONSTRAINT fk_promos_id_clients FOREIGN KEY (id_clients) REFERENCES clients (id_clients);
ALTER TABLE utilisateurs ADD CONSTRAINT fk_utilisateurs_id_roles FOREIGN KEY (id_roles) REFERENCES roles (id_roles);
ALTER TABLE favoris ADD CONSTRAINT fk_favoris_id_categories FOREIGN KEY (id_categories) REFERENCES categories (id_categories);
ALTER TABLE favoris ADD CONSTRAINT fk_favoris_id_utilisateurs FOREIGN KEY (id_utilisateurs) REFERENCES utilisateurs (id_utilisateurs)