CREATE TABLE CLIENT(
  id_client INT  PRIMARY KEY,
  nom VARCHAR(30),
  prenom VARCHAR(30),
  age INT CHECK(age>=18),
  email VARCHAR(256),
  numero INT,
  fonction VARCHAR(12),
  naissance DATE
  );

 CREATE TABLE LIVREUR(
    id_livreur  INT PRIMARY KEY,
    prenom VARCHAR(30),
    nom VARCHAR(30),
    age INT CHECK(60>age),
    numero INT,
    zone VARCHAR(30)
    );

 CREATE TABLE ADRESSE(
    id_adresse INT PRIMARY KEY,
    rue varchar(30),
    postal INT NOT NULL,
    numero INT CHECK(numero>0),
    ville VARCHAR(30) NOT NULL,
    bis CHAR(1),
    client INT REFERENCES  client(id_client)
    );


CREATE TABLE RESTAURANT(
    id_restaurant INT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    description VARCHAR(500) NOT NULL,
    type VARCHAR(30)
    );

CREATE TABLE PLAT(
    id_plat INT PRIMARY KEY,
    nom VARCHAR(30) NOT NULL,
    description VARCHAR(100),
    prix INT CHECK(prix>0)
    );


CREATE TABLE IMAGE(
    id_image INT PRIMARY KEY,
    nom VARCHAR(30),
    description VARCHAR(150)
    );


CREATE TABLE IMAGERP(
    restaurant INT REFERENCES restaurant(id_restaurant),
    plat INT REFERENCES plat(id_plat),
    image INT REFERENCES image(id_image),
    PRIMARY KEY(restaurant, plat, image)
    );


CREATE TABLE FORMULE(
    id_formule INT PRIMARY kEY,
    nom VARCHAR(30),
    prix INT CHECK(prix>0),
    date_debut DATE,
    date_fin DATE,
    restaurant INT REFERENCES restaurant(id_restaurant)
    );

CREATE TABLE INGREDIENT(
    id_ingredient INT PRIMARY KEY,
    ingredient VARCHAR(30),
    allergene CHAR(1)
    );

CREATE TABLE NOMBREI(
    ingredient INT REFERENCES ingredient(id_ingredient),
    plat INT REFERENCES plat(id_plat),
    PRIMARY KEY(ingredient, plat)
    );


CREATE TABLE PLATF(
    plat INT REFERENCES plat(id_plat),
    formule INT REFERENCES formule(id_formule),
    PRIMARY KEY(plat , formule)
    );


CREATE TABLE INCIDENT(
    numero INT PRIMARY KEY,
    type VARCHAR(60),
    lieu VARCHAR(100),
    date_debut DATE,
    date_fin DATE,
    signature VARCHAR(30),
    categorie VARCHAR(30),
  livreur INT REFERENCES livreur(id_livreur)
    );

CREATE TABLE PARRAINAGE(
    id_parrainage INT PRIMARY KEY,
    pourcentage INT CHECK(pourcentage<100),
    valide CHAR(1)
    );

CREATE TABLE COMMANDE(
    id_transaction  INT PRIMARY KEY,
    programmation DATE,
    anniversaire CHAR(1),
    adresse INT REFERENCES adresse(id_adresse),
    livreur INT  REFERENCES livreur(id_livreur),
    km INT
    );

CREATE TABLE ADMINISTRER(
    restaurant INT REFERENCES restaurant(id_restaurant),
    client INT REFERENCES client(id_client),
    note INT CHECK(note<=5),
    PRIMARY KEY(restaurant, client)
    );

CREATE TABLE PANIER(
    formule INT REFERENCES formule(id_formule),
    commande INT REFERENCES  commande(id_transaction),
    plat INT REFERENCES plat(id_plat),
    note INT CHECK(note<=5),
    PRIMARY KEY(formule,commande, plat)
    );

CREATE TABLE ADMINISTRATION(
    plat INT REFERENCES plat(id_plat),
    restaurant INT REFERENCES restaurant(id_restaurant),
    PRIMARY KEY(plat, restaurant)
    );

CREATE TABLE PARRAINAGEC(
    client INT REFERENCES client(id_client),
    parrainage INT REFERENCES parrainage(id_parrainage),
    PRIMARY KEY(client,parrainage)
    );

CREATE TABLE FACTURE(
    id_facture INT PRIMARY KEY,
    reussi CHAR(1),
    façon VARCHAR(30),
    commande INT REFERENCES commande(ID_TRANSACTION)
    );

CREATE TABLE HISTORIQUE(
    client INT REFERENCES client(id_client),
    facture INT  REFERENCES facture(id_facture),
    commande INT  REFERENCES commande(id_transaction),
    PRIMARY KEY(client, facture, commande)
    );

CREATE TABLE AVOIR(
    code INT PRIMARY KEY,
    montant INT,
    valide CHAR(1),
    facture INT REFERENCES facture(id_facture),
    client INT REFERENCES client(id_client)
    );

CREATE TABLE VISITE(
    id_incident INT PRIMARY KEY,
    type VARCHAR(30),
    date_visite DATE,
    lieux VARCHAR(60),
    descriptif VARCHAR(50),
    livreur  INT REFERENCES livreur(id_livreur)
    );


CREATE TABLE PERMIS(
    id_permis INT PRIMARY KEY,
    categorie CHAR(2),
    date_obtention DATE,
    livreur INT REFERENCES livreur(id_livreur)
    );
    
        -- INSERT --
    
    
    -- CLIENT --
    
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('007','MACRON','Emmanuel','58','lepetimanu@gmail.com','0674868358','restaurateur',TO_DATE('08-01-1962','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('008','PLAGE','Sable','18','mouvant@gmail.com','0674868314','client',TO_DATE('12-11-2001','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('009','EUROS','Candy','19','shop@gmail.com','0674868315','client',TO_DATE('24-10-2002','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('010','SAN','Orel','20','basique@gmail.com','0674868316','client',TO_DATE('08-01-2000','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('011','VALD','Vald','20','boogieman@gmail.com','0674868317','client',TO_DATE('30-03-2000','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('012','COOKIE','Pookie','22','poke@gmail.com','0674868318','client',TO_DATE('29-01-1998','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('013','LETTE','Po','28','popopoletletlet@gmail.com','0674868319','client',TO_DATE('06-06-1991','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('014','TRIAL','Findus','32','isation@gmail.com','0674868320','client',TO_DATE('18-02-1988','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('015','MINE','Miaille','18','ouille@gmail.com','0674868321','client',TO_DATE('08-01-2002','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('016','MACAILLE','Lou','24','loulilol@gmail.com','0674868322','client',TO_DATE('10-01-1996','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('017','MARCIO','Clem','25','ahonarriveaubout@gmail.com','0674868323','client',TO_DATE('15-01-1995','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('018','LONG','Treau','27','toujourslong@gmail.com','0674868324','client',TO_DATE('18-01-1993','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('019','AIMARRE','Jean','30','ouiouicestlong@gmail.com','0674868325','client',TO_DATE('21-01-1990','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('020','DJADJA','Oréo','36','hum@gmail.com','0674868326','client',TO_DATE('01-01-1984','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('021','MARCI','Panini','39','miam@gmail.com','0674868327','client',TO_DATE('16-01-1981','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('022','DADI','Bézou','40','quandtunoustienaussi@gmail.com','0674868328','client',TO_DATE('20-01-1980','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('023','POL','Euclide','21','quandtunoustien@gmail.com','0674868329','client',TO_DATE('18-01-1999','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('024','UZURE','Camille','19','zuzu@gmail.com','0674868330','client',TO_DATE('28-02-2001','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('025','TOLKIEN','Gimli','35','filsdolin@gmail.com','0674868331','client',TO_DATE('08-01-1985','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('026','ALIBERT','Einstein','34','levraisaussi@gmail.com','0674868332','client',TO_DATE('13-01-1986','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('027','LEPETIT','Nicolas','42','nicolasSARKOZY@gmail.com','0674868333','client',TO_DATE('03-01-1978','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('028','SARTE','Jean-Paul','47','jajasart@gmail.com','0674868334','client',TO_DATE('04-01-1973','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('029','BRIAND','Aristide','49','briandcomme@gmail.com','0674868335','client',TO_DATE('01-01-1971','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('030','NANATSU','Meliodas','50','melio@gmail.com','0674868336','client',TO_DATE('04-02-1970','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('031','REP','Julien','41','julienrep@gmail.com','0674868337','client',TO_DATE('12-08-1979','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('032','HALLIDAY','Alexis','63','allumey@gmail.com','0674868338','client',TO_DATE('24-12-1957','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('033','LIA','Alexa','55','bonjour@gmail.com','0674868339','client',TO_DATE('15-04-1965','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('034','RENAULT','Mégane','50','officialrpz@gmail.com','0674868340','client',TO_DATE('02-10-1970','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('035','OBLIGER','Alouette','38','petit@gmail.com','0674868341','client',TO_DATE('19-07-1982','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('036','DE','Shiro','28','levoyage@gmail.com','0674868342','client',TO_DATE('22-09-1992','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('037','DOMINOS','Pizza','54','domdompourvous@gmail.com','0674868343','client',TO_DATE('06-06-1966','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('038','POKEMON','Pikachu','44','levrais@gmail.com','0674868344','client',TO_DATE('09-09-1976','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('039','EVES','Adam','32','adameteveoffocial@gmail.com','0674868345','client',TO_DATE('01-05-1988','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('040','LALALA','Eva','58','evalalalala@gmail.com','0674868346','client',TO_DATE('05-03-1962','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('041','OH','Josette','25','Ohjojo@gmail.com','0674868347','client',TO_DATE('19-08-1994','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('042','RICARD','DO','26','ricard@gmail.com','0674868348','client',TO_DATE('02-02-1994','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('043','DISNEY','Anastasia','22','lepetimanu@gmail.com','0674868349','client',TO_DATE('03-03-1998','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('044','PASCAL','Rose','27','pascalrose@gmail.com','0674868350','client',TO_DATE('24-01-1993','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('045','GORDON','Jeanine','72','gordonjeanineramsay@gmail.com','0674868351','client',TO_DATE('04-04-1948','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('046','ECHEBEST','Aimé','19','echebestthebest@gmail.com','0674868352','client',TO_DATE('27-01-2001','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('047','DAMIDO','Valerie','28','damodivaloch@gmail.com','0674868353','client',TO_DATE('04-12-1992','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('048','LEGRIS','Gandalf','31','gandalflegris@gmail.com','0674868354','client',TO_DATE('08-01-1989','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('049','LEBLANC','Gandlaf','27','gandalfleblanc@gmail.com','0674868355','client',TO_DATE('08-01-1993','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('050','FLAM','Doudoune','22','flamdoudoune@gmail.com','0674868356','client',TO_DATE('08-01-1998','DD-MM-YYYY'));
    INSERT INTO CLIENT (id_client,nom,prenom,age,email,numero,fonction,naissance) VALUES ('051','MINAS','Tirit','20','minastirit@gmail.com','0674868357','client',TO_DATE('08-01-2000','DD-MM-YYYY'));
    
    
    -- LIVREUR --
    
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('000','Jean-Marie','LEPEN','22','0685868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('100','Speedy','GONZALES','18','0686868358','Sainte-Geneviève-des-Bois');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('200','Fast','ANDFURIOUS','26','0687868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('300','Light','SPEED','29','0688868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('400','Eric','DJERIK','32','0689868358','Evry');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('500','toto','LESCARGOT','20','0690868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('600','Ramsay','GORDON','21','0691868358','Beauvais');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('700','Jean','NOSTRADAMUS','19','0692868358','Ivry-sur-seine');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('800','Homer','SIMPSON','20','0693868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('900','Cartman','SOUTHPARK','18','0694868358','Juvisy');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('110','Kenny','WHOKILL','31','0695868358','Viry-Chatillon');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('220','Freddy','KRUGER','27','0696868358','Draveil');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('330','Dieu','DONNER','24','0697868358','Paris');
    INSERT INTO LIVREUR (id_livreur,prenom,nom,age,numero,zone) VALUES ('440','Clover','TOTALYSPIES','20','0698868358','Meudon');
    
    -- ADRESSE --
    
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('700','faubourg saint antoine','75011','58','paris','n','007');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('701','rue de picpus','75011','4','paris','n','008');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('702','rue oberkampf','75012','58','paris','y','009');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('703','place vendome','75015','16','paris','n','010');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('704','avenue de la république','75011','26','paris','y','011');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('705','boulevard malesherbes','75008','32','paris','y','012');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('706','impasse reille','75014','45','paris','n','013');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('707','rue pernetty','75014','01','paris','n','014');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('708','paul belmondo','75012','18','paris','n','015');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('709','rue de lyon','75012','104','paris','y','016');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('710','rue barrault','75013','98','paris','y','017');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('711','rue pelleporte','75020','72','paris','y','018');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('712','rue abbevile','75010','85','paris','n','019');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('713','avenue generale leclerc','75014','22','paris','n','020');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('714','farue de dantzig','75015','24','paris','y','021');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('715','avenue de Versaille','75016','05','paris','y','022');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('716','avenue de bretigny','91700','89','SGDB','y','023');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('717','avenue de glitch','91100','92','evry','y','024');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('718','saint honoré','91100','75','evry','y','025');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('719','rue arbre robuste','60000','74','beauvais','n','026');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('720','rue feuille de mente','91210','20','juvisy','n','027');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('721','papi russe','91210','21','juvisy','n','028');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('722','chien chaud','91211','45','draveil','n','029');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('723','quand le chat nest pas la','91211','145','draveil','n','030');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('724','ville fantomme','92100','216','meudon','n','031');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('725','nuketown','92100','18','meudon','n','032');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('726','goulag','91600','69','viry-chatillon','n','033');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('727','super store','91600','78','viry-chatillon','n','034');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('728','bone yard','78100','11','ivry-sur-seine','y','035');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('729','aéroport de ivry','78100','12','ivry-sur-seine','y','036');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('730','rue lu lu','60000','66','beauvais','y','037');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('731','rue la la','60000','33','beauvais','y','038');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('732','kennedy','91100','22','evry','y','039');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('733','briand','91100','11','evry','y','040');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('734','de la lampe allumé','91100','55','evry','n','041');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('735','de la baleine','91210','44','juvisy','n','042');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('736','de la bourgeoisie','75011','33','paris','n','043');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('737','rue rue','75011','88','paris','y','044');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('738','rue des arts','75011','77','paris','y','045');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('739','rue des grand arts','75011','99','paris','y','046');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('740','rue de la guitare','75011','100','paris','y','047');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('741','piano ville','75011','47','paris','n','048');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('742','souri ville','75011','25','paris','n','049');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('743','patron','75011','46','paris','n','050');
    INSERT INTO ADRESSE (id_adresse,rue,postal,numero,ville,bis,client) VALUES ('744','jim carrey','75011','98','paris','n','051');
    
    -- RESTAURANT --
    
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('800','CHEZ MIREILLE','Restaurant gastronomique picard','Picard');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('801','Macdou','Restation rapide américaine','Hamburger');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('802','Takayale','Restaurant Japonais a volonté','Japonais');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('803','Chinashimi','Restaurant Chinois a volonté','Chinois');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('804','Geppeto','Restaurant gastronomique Italien','Italien');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('805','Tandouri','Restaurant orientale','Indien');
    INSERT INTO RESTAURANT (id_restaurant,nom,description,type) VALUES ('806','Speed Rabbat','Restauration rapide italienne','Pizzeria');

    
    -- PLAT --
    
             -- CHEZ MIREILLE --  
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1234','Le PizTapPis','Pizza avec tapenade de Pissenlit sur son lit de pruno','10');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1734','Steack','Bon vieux steack haché Charal acheté 1 euros piece !','8');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1434','Gourmandine','Glace a la vanille avec chocolat fondue avec miel avec sucre, chantilly, confétti, bougie','12');
            
             -- Macdou --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1235','MicMac','Hambourgeois non copié sur la concurence','20');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1236','FishAuFilet','Hamburger fraichement péché','25');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1237','Wrapinou','Wrap très mignon ce qui justifie son prix','40');
            
             -- Takayale --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1239','La Batmobile','Sushi oui vous ne rêvez pas ! ceci est bien une batmobile avec plein de suhsi dedans !!!','58');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('2234','Le rentable','Traditionnelle brochette de boeuf au fromage recette transmise de père en fils','12');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('7234','Rouleau','Rouleau des pré roulé avec des pissenlit marguerite pétunia','20');
            
             -- Chinashimi --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1134','Miamiam','Dessert goutu a ce quil parait','16');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1634','Crocroc','Pattes crue ! Sa croustile !','8');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('9234','???','Plat au pif le chef jette des aliments et la casserole choisie','16');
            
             -- Geppeto --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('6234','Lit','Pates au saumon qui sont sur un lit de béttrave','20');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1238','Lapastaga','Salade de pate fait maison sans sauce rien','41');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1534','Solstice','Sole haché avec couli framboise','10');
            
             -- Tandouri --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('3234','Larnake','Poulet aux fausses épices oui cest la crise','13');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('4234','la 4Riz','Mélanges de riz aux épices riz aux oignons riz au lait risotto risotti et ristretto','17');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1231','Calabria','Pizza avec sauce tomate','12');

            -- Speed Rabbat --
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1232','SenFort','Pizza avec un nombre incalculable de fromages dessus','15');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('1233','Babar','Une simple magarita qui est simplement chere','18');
            INSERT INTO PLAT (id_plat,nom,description,prix) VALUES ('5234','WTF','Supplément pizza cuite (seulement si vous la voulez cuite)','16');
    
    -- IMAGE --
    
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('987987','PizTapPisimg','Pizza avec tapenade de Pissenlit sur son lit de pruno');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('654654','Calabriaimg','Pizza avec sauce tomate');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('321321','SenFortimg','Pizza avec un nombre incalculable de fromages dessus');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('123123','Babarimg','Une simple magarita qui est simplement chere');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('456456','MicMacimg','Hambourgeois non copié sur la concurence');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('789789','FishAuFiletimg','Hamburger fraichement péché');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('159159','Wrapinouimg','Wrap très mignon ce qui justifie son prix');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('753753','Lapastagaimg','Salade de pate fait maison sans sauce rien');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('951951','La Batmobileimg','Sushi oui vous ne rêvez pas ! ceci est bien une batmobile avec plein de suhsi dedans !!!');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('357357','Le rentableimg','Traditionnelle brochette de boeuf au fromage recette transmise de père en fils');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('2626','Larnakeimg','Poulet aux fausses épices oui cest la crise');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('2323','la 4Rizimg','Mélanges de riz aux épices riz aux oignons riz au lait risotto risotti et ristretto');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('2222','WTFimg','Supplément pizza cuite (seulement si vous la voulez cuite)');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('2525','Litimg','Pates au saumon qui sont sur un lit de béttrave');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('9999','Rouleauimg','Rouleau des pré roulé avec des pissenlit marguerite pétunia');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('9898','???img','Plat au pif le chef jette des aliments et la casserole choisie');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('7878','Miamiamimg','Dessert goutu a ce quil parait');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('8787','Gourmandineimg','Glace a la vanille avec chocolat fondue avec miel avec sucre, chantilly,');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('5454','Solsticeimg','Sole haché avec couli framboise');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('4545','Crocrocimg','Pattes crue ! Sa croustile !');
    INSERT INTO IMAGE (id_image,nom,description) VALUES ('1414','Steackimg','Bon vieux steack haché Charal');
    
    -- IMAGERP --
    
             -- CHEZ MIREILLE --  
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('800','1234','987987');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('800','1734','1414');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('800','1434','8787');
            
             -- Macdou --
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('801','1235','456456');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('801','1237','159159');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('801','1236','789789');
            
             -- Takayale --
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('802','1239','951951');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('802','2234','357357');
            INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('802','7234','9999');
            
             -- Chinashimi --
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('803','1134','7878');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('803','1634','4545');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('803','9234','9898');
            
             -- Geppeto --
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('804','6234','2525');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('804','1238','753753');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('804','1534','5454');
            
             -- Tandouri --
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('805','3234','2626');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('805','4234','2323');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('805','1231','654654');

            -- Speed Rabbat --
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('806','1232','321321');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('806','1233','123123');
         INSERT INTO IMAGERP (restaurant,plat,image) VALUES ('806','5234','2222');

    
    -- FORMULE --
    
            -- Chez mireille formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('401','Midi','15',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'800');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('402','Soir','12',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'800');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('403','Happy Hours','16',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'800');
            -- Macdou formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('404','Maxi','18',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'801');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('405','Normal','22',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'801');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('406','Enfants','24',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'801');
            -- Takayale formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('407','Midi','26',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'802');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('408','Soir','28',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'802');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('409','A volonté','42',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'802');
            -- Chinashimi formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('410','Midi','10',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'803');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('411','Soir','12',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'803');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('412','A volonté','25',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'803');
            -- Geppeto formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('413','Midi','25',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'804');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('414','Soir','32',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'804');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('415','Happy hours','5',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'804');
            -- Tandouri formules --
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('416','Midi','25',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'805');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('417','Soir','21',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'805');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('418','4 Personnes','17',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'805');
        -- Speed Rabbat formules -- 
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('419','4 Pizza','25',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'806');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('420','2 Pizza','30',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'806');
            INSERT INTO FORMULE (id_formule,nom,prix,date_debut,date_fin,restaurant) VALUES ('421','2 Mega Pizza','10',TO_DATE('01-01-2020','DD-MM-YYYY'),TO_DATE('01-01-2021','DD-MM-YYYY'),'806');
    
    -- INGREDIENT --
    
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('601','Oeuf','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('602','Lait','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('603','Fromages','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('604','Cacahouètes','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('605','Noix','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('606','Lupins','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('607','Gambas','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('608','Langouste','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('609','Huitre','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('610','Morue','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('611','Palourdes','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('612','Clovisse','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('613','Calamar','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('614','Crabe','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('615','Colin','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('616','Moutarde','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('617','Anis','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('618','Cumin','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('619','Paprika','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('620','lentilles','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('621','Pois chiche','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('622','Petit pois','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('623','Blé','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('624','Orge','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('625','Avoine','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('626','Glutten','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('627','maïs','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('628','Cerise','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('629','Pruno','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('630','Fraises','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('631','Pommes','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('632','Poires','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('633','Abricot','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('634','Pêches','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('635','Pavot','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('636','Lin','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('637','Sésame','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('638','Additif','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('639','Camomille','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('640','Pates','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('641','Tomates','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('642','Asperge','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('643','Pissenlit','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('644','Bettrave','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('645','Farine','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('646','Chapelure','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('647','Framboise','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('648','Ananas','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('649','Kiwi','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('650','Aubergine','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('651','Saumon','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('652','Sole','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('653','Boeuf','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('654','Cheval','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('655','Bison','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('656','Mamouth','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('657','Emmentale','y');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('658','Riz','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('659','Poulet','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('660','Glace vanille','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('661','Glace framboise','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('662','Jambon','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('663','Olives','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('664','Marguerite','n');
    INSERT INTO INGREDIENT (id_ingredient,ingredient,allergene) VALUES ('665','Pétunia','n');
    
    -- NOMBREI --
            -- Pizza avec tapenade de Pissenlit sur son lit de pruno --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('643','1234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('641','1234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('601','1234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','1234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('626','1234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('663','1234');
              -- Calabria --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('641','1231');

              -- SenFort --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('603','1232');
                   
            -- Babar --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('641','1233');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('646','1233');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('663','1233');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','1233');
                    
              -- MicMac --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('616','1235');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('641','1235');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','1235');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('603','1235');
                    
              -- FishAuFilet --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('610','1236');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('611','1236');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('641','1236');
                     
              -- Wrapinou --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('643','1237');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('644','1237');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('637','1237');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('657','1237');

              -- Lapastaga --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('640','1238');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('627','1238');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','1238');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('650','1238');
              -- La Batmobile --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('651','1239');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','1239');
                    
              -- Le rentable --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('657','2234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('653','2234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','2234');

              -- Larnake --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('659','3234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('618','3234');

              -- la 4Riz --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('623','4234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('638','4234');
                    
            -- WTF --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('665','5234');

              -- Lit --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('651','6234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('640','6234');

              -- Rouleau --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('664','7234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('665','7234');
                      
              -- ??? --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('601','9234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('602','9234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('603','9234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('604','9234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('605','9234');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('606','9234');
              -- Miamiam --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('648','1134');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('649','1134');

              -- Gourmandine --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('660','1434');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('661','1434');
                   
              -- Solstice --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('652','1534');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('661','1534');
               
            -- Crocroc --
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('640','1634');

              -- Steack --   
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('654','1734');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('655','1734');
                    INSERT INTO NOMBREI (ingredient,plat) VALUES ('656','1734');

              
    -- PLATF --
             -- CHEZ MIREILLE --  
            INSERT INTO PLATF (plat,formule) VALUES ('1234','401');
            INSERT INTO PLATF (plat,formule) VALUES ('1734','402');
            INSERT INTO PLATF (plat,formule) VALUES ('1434','403');
            
             -- Macdou --
            INSERT INTO PLATF (plat,formule) VALUES ('1235','404');
            INSERT INTO PLATF (plat,formule) VALUES ('1237','405');
            INSERT INTO PLATF (plat,formule) VALUES ('1236','406');
            
             -- Takayale --
            INSERT INTO PLATF (plat,formule) VALUES ('1239','407');
            INSERT INTO PLATF (plat,formule) VALUES ('2234','408');
            INSERT INTO PLATF (plat,formule) VALUES ('7234','409');
            
             -- Chinashimi --
            INSERT INTO PLATF (plat,formule) VALUES ('1134','410');
            INSERT INTO PLATF (plat,formule) VALUES ('1634','411');
            INSERT INTO PLATF (plat,formule) VALUES ('9234','412');
            
             -- Geppeto --
            INSERT INTO PLATF (plat,formule) VALUES ('6234','413');
            INSERT INTO PLATF (plat,formule) VALUES ('1238','414');
            INSERT INTO PLATF (plat,formule) VALUES ('1534','415');
            
             -- Tandouri --
            INSERT INTO PLATF (plat,formule) VALUES ('3234','416');
            INSERT INTO PLATF (plat,formule) VALUES ('4234','417');
            INSERT INTO PLATF (plat,formule) VALUES ('1231','418');
            
             -- Speed Rabbat --
            INSERT INTO PLATF (plat,formule) VALUES ('1232','419');
            INSERT INTO PLATF (plat,formule) VALUES ('1233','420');
            INSERT INTO PLATF (plat,formule) VALUES ('5234','421');
    
    -- INCIDENT --
            -- Jean-Marie --
                INSERT INTO INCIDENT (numero,type,lieu,date_debut,date_fin,signature,categorie,livreur) VALUES ('201','pneux crevé','2 avenue des champs élysées',TO_DATE('01-01-2020 13:10:11','DD-MM-YYYY HH24:MI:SS'),TO_DATE('01-01-2020 14:01:39','DD-MM-YYYY HH24:MI:SS'),'JM','Problème véhicule','000');
            -- Speedy --
                INSERT INTO INCIDENT (numero,type,lieu,date_debut,date_fin,signature,categorie,livreur) VALUES ('202','Pizza mangé','74 rue arbre robuste',TO_DATE('04-03-2020 14:10:11','DD-MM-YYYY HH24:MI:SS'),TO_DATE('01-01-2020 14:30:39','DD-MM-YYYY HH24:MI:SS'),'JM','Problème avec son appeti','800');
            -- Fast --
            -- Light --
            -- Eric --
            -- Toto --
            -- Ramsay --
            -- Jean --
            -- Homer --
            -- Cartman --
            -- Kenny --
            -- Freddy --
            -- Dieu --
            -- Clover --
            
    -- PARRAINAGE --
    
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('301','5','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('302','10','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('303','20','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('304','30','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('305','15','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('306','5','n');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('307','10','n');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('308','40','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('309','30','y');
    INSERT INTO PARRAINAGE (id_parrainage,pourcentage,valide) VALUES ('310','45','y');
    
    -- COMMANDE --
    
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1001',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'y','700','000','10');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1002',TO_DATE('01-02-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','719','600','20');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1003',TO_DATE('01-03-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','730','600','50');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1004',TO_DATE('01-04-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','731','600','260');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1005',TO_DATE('01-05-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','701','300','5');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1006',TO_DATE('01-06-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','702','800','12');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1007',TO_DATE('01-07-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','703','000','2');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1008',TO_DATE('01-08-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','704','300','5');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1009',TO_DATE('01-09-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','705','800','10');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1010',TO_DATE('01-10-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','706','330','16');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1011',TO_DATE('01-11-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','707','200','12');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1012',TO_DATE('01-12-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','708','200','18');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1013',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','709','300','11');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1014',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','711','800','14');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1015',TO_DATE('01-02-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','711','330','7');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1016',TO_DATE('01-03-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','712','200','6');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1017',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','713','800','5');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1018',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','714','300','2');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1019',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','715','330','9');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1020',TO_DATE('01-01-2019 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','716','000','8');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1021',TO_DATE('01-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','717','000','10');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1022',TO_DATE('02-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','718','800','1');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1023',TO_DATE('03-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','719','000','6');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1024',TO_DATE('04-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','720','330','7');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1025',TO_DATE('05-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','721','000','7');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1026',TO_DATE('06-01-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','722','800','5');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1027',TO_DATE('07-02-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','723','000','21');
    INSERT INTO COMMANDE (id_transaction,programmation,anniversaire,adresse,livreur,km) VALUES ('1028',TO_DATE('08-02-2020 13:00:11','DD-MM-YYYY HH24:MI:SS'),'n','724','000','22');
    
    
    -- ADMINISTRER --
    
            -- CHEZ MIREILLE --  
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('800','007','5');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('800','010','3');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('800','009','5');
            
             -- Macdou --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('801','032','5');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('801','038','5');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('801','043','1');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('801','044','1');
            
            
             -- Takayale --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('802','045','1');
         
            
             -- Chinashimi --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('803','048','5');

                        
             -- Geppeto --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('804','051','5');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('804','050','5');

            
             -- Tandouri --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('805','033','1');

            
            
             -- Speed Rabbat --
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('806','047','3');
            INSERT INTO ADMINISTRER (restaurant,client,note) VALUES ('806','040','2');

            
    
    -- PANIER --
    
            -- CHEZ MIREILLE --  
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('401','1001','1234','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('402','1002','1734','4');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('403','1003','1734','3');
            
             -- Macdou --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('404','1004','1235','1');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('405','1005','1236','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('406','1006','1237','5');
            
            
             -- Takayale --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('407','1007','1239','2');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('408','1008','2234','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('409','1009','7234','1');
            
            
             -- Chinashimi --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('410','1010','1134','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('411','1011','1634','4');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('412','1012','9234','5');
            
            
             -- Geppeto --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('413','1013','6234','3');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('414','1014','1238','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('415','1015','1534','5');
            
            
             -- Tandouri --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('416','1016','3234','4');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('417','1017','4234','1');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('418','1018','1231','1');
            
            
             -- Speed Rabbat --
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('419','1019','1232','1');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('420','1020','1233','5');
            INSERT INTO PANIER (formule,commande,plat,note) VALUES ('421','1021','5234','5');
    
    
    -- ADMINISTRATION --
    
            -- CHEZ MIREILLE --  
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1234','800');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1734','800');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1434','800');
            
             -- Macdou --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1235','801');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1236','801');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1237','801');
            
            
             -- Takayale --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1239','802');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('2234','802');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('7234','802');
            
            
             -- Chinashimi --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1134','803');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1634','803');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('9234','803');
            
            
             -- Geppeto --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('6234','804');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1238','804');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1534','804');
            
            
             -- Tandouri --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('3234','805');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('4234','805');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1231','805');
            
            
             -- Speed Rabbat --
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1232','806');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('1233','806');
            INSERT INTO ADMINISTRATION (plat,restaurant) VALUES ('5234','806');

    
    -- PARRAINAGEC --
    
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('049','301');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('048','302');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('034','303');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('046','304');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('045','305');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('027','306');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('026','307');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('019','308');
    INSERT INTO PARRAINAGEC (client,parrainage) VALUES ('038','309');
    
    -- FACTURE --
    
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1201','y','carte bleue','1001');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1202','y','espèces','1002');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1203','y','carte bleue','1003');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1204','y','espèces','1004');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1205','y','carte bleue','1005');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1206','y','chèque','1006');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1207','y','carte bleue','1007');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1208','y','carte bleue','1008');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1209','y','espèces','1009');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1210','y','carte bleue','1010');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1211','y','carte bleue','1011');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1212','y','espèces','1012');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1213','y','carte bleue','1013');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1214','y','carte bleue','1014');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1215','y','carte bleue','1015');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1216','y','carte bleue','1016');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1217','y','espèces','1017');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1218','y','carte bleue','1018');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1219','y','carte bleue','1019');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1220','y','chèque','1020');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1221','y','carte bleue','1021');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1222','y','carte bleue','1022');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1223','y','espèces','1023');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1224','y','carte bleue','1024');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1225','y','carte bleue','1025');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1226','y','espèces','1026');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1227','y','carte bleue','1027');
    INSERT INTO FACTURE (id_facture,reussi,façon,commande) VALUES ('1228','y','carte bleue','1028');
    
    -- HISTORIQUE --
    
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('018','1201','1001');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('012','1202','1002');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('019','1203','1003');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('025','1204','1004');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('032','1205','1005');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('028','1206','1006');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('022','1207','1007');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('011','1208','1008');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('009','1209','1009');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('033','1210','1010');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('034','1211','1011');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('035','1212','1012');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('031','1213','1013');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('030','1214','1014');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('051','1215','1015');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('050','1216','1016');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('049','1217','1017');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('048','1218','1018');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('047','1219','1019');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('046','1220','1020');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('045','1221','1021');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('044','1222','1022');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('043','1223','1023');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('042','1224','1024');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('041','1225','1025');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('040','1226','1026');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('039','1227','1027');
    INSERT INTO HISTORIQUE (client,facture,commande) VALUES ('038','1228','1028');
    
    
    -- AVOIR --
    INSERT INTO AVOIR (code,montant,valide,facture,client) VALUES ('3001','10','y','1201','008');
    INSERT INTO AVOIR (code,montant,valide,facture,client) VALUES ('3002','5','y','1202','009');
    INSERT INTO AVOIR (code,montant,valide,facture,client) VALUES ('3003','15','y','1202','010');
    INSERT INTO AVOIR (code,montant,valide,facture,client) VALUES ('3004','20','y','1202','011');
    
    -- VISITE --
    
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4001','livraison',TO_DATE('04-06-2019 12:01:11','DD-MM-YYYY HH24:MI:SS'),'rue lulu','livraison','600');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4002','livraison',TO_DATE('05-06-2019 12:15:11','DD-MM-YYYY HH24:MI:SS'),'rue lala','livraison','600');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4003','livraison',TO_DATE('06-06-2019 12:30:11','DD-MM-YYYY HH24:MI:SS'),'rue arbre robuste','livraison','600');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4004','livraison',TO_DATE('07-06-2019 13:01:11','DD-MM-YYYY HH24:MI:SS'),'faubourg saint antoine','livraison','000');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4005','livraison',TO_DATE('08-06-2019 21:01:11','DD-MM-YYYY HH24:MI:SS'),'rue de picpus','livraison','200');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4006','livraison',TO_DATE('09-06-2019 22:01:11','DD-MM-YYYY HH24:MI:SS'),'rue oberkampf','livraison','300');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4007','livraison',TO_DATE('10-06-2019 20:01:11','DD-MM-YYYY HH24:MI:SS'),'place vendome','livraison','000');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4008','livraison',TO_DATE('11-06-2019 19:01:11','DD-MM-YYYY HH24:MI:SS'),'avenue de la république','livraison','500');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4009','livraison',TO_DATE('12-06-2019 13:01:11','DD-MM-YYYY HH24:MI:SS'),'boulevard malesherbes','livraison','800');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4010','livraison',TO_DATE('01-06-2020 11:30:11','DD-MM-YYYY HH24:MI:SS'),'impasse reille','livraison','200');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4011','livraison',TO_DATE('02-06-2020 1:45:11','DD-MM-YYYY HH24:MI:SS'),'rue pernetty','livraison','400');
    INSERT INTO VISITE (id_incident,type,date_visite,lieux,descriptif,livreur) VALUES ('4012','livraison',TO_DATE('03-06-2020 12:40:11','DD-MM-YYYY HH24:MI:SS'),'kennedy','livraison','330');

    
    -- PERMIS --
    
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5001','B',TO_DATE('01-01-2018','DD-MM-YYYY'),'000');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5002','B',TO_DATE('01-01-2020','DD-MM-YYYY'),'100');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5003','B',TO_DATE('01-01-2012','DD-MM-YYYY'),'200');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5004','B',TO_DATE('01-01-2010','DD-MM-YYYY'),'300');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5005','B',TO_DATE('01-01-2010','DD-MM-YYYY'),'400');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5006','B',TO_DATE('01-01-2018','DD-MM-YYYY'),'500');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5007','B',TO_DATE('01-01-2018','DD-MM-YYYY'),'600');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5008','B',TO_DATE('01-01-2019','DD-MM-YYYY'),'700');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5009','B',TO_DATE('01-01-2018','DD-MM-YYYY'),'800');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5010','B',TO_DATE('01-01-2020','DD-MM-YYYY'),'900');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5011','B',TO_DATE('01-01-2010','DD-MM-YYYY'),'110');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5012','B',TO_DATE('01-01-2014','DD-MM-YYYY'),'220');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5013','B',TO_DATE('01-01-2017','DD-MM-YYYY'),'330');
    INSERT INTO PERMIS (id_permis,categorie,date_obtention,livreur) VALUES ('5014','B',TO_DATE('01-01-2018','DD-MM-YYYY'),'440');



        -- DROP EN CAS D'ERREUR --
        
    drop table client;
    drop table livreur;
    drop table ADRESSE;
    drop table RESTAURANT;
    drop table PLAT;
    drop table IMAGE;
    drop table IMAGERP;
    drop table FORMULE;
    drop table INGREDIENT;
    drop table NOMBREI;
    drop table PLATF;
    drop table INCIDENT;
    drop table PARRAINAGE;
    drop table COMMANDE;
    drop table ADMINISTRER;
    drop table PANIER;
    drop table ADMINISTRATION;
    drop table PARRAINAGEC;
    drop table FACTURE;
    drop table HISTORIQUE;
    drop table AVOIR;
    drop table VISITE;
    drop table PERMIS;
    
        -- COMMANDES DEMANDEES --

-- Quel est le plat le plus consommé en été ? (du 20 juin au 22 septembre) ? --
SELECT plat.nom FROM panier INNER JOIN COMMANDE ON commande.id_transaction = panier.commande INNER JOIN FACTURE ON facture.commande=panier.commande
INNER JOIN plat ON plat.id_plat=panier.plat INNER JOIN PLATF ON plat.id_plat = platf.plat 
INNER JOIN formule ON formule.id_formule=platf.formule
WHERE facture.reussi='y' AND  '09/20'<=TO_CHAR(programmation, 'mm/dd') AND '20/06'>=TO_CHAR(programmation, 'dd/mm') ORDER BY plat.nom  ;


-- Quel est le mode de règlement préféré des clients ayant entre 18 et 22 ans et habitant sur Paris (tousarrondissements confondus) ? --
SELECT MAX(facture.façon)  FROM client INNER JOIN adresse ON adresse.client=client.id_client INNER JOIN historique ON historique.client= client.id_client
INNER JOIN facture ON historique.facture = facture.id_facture
WHERE  client.age BETWEEN '18' AND '22'  AND adresse.postal BETWEEN '75000' AND '75999' ORDER BY facture.façon DESC;



-- Quelle ville a donné lieu à le plus grand nombre de commandes ? --
SELECT ville, COUNT(*) FROM commande INNER join adresse ON adresse.id_adresse=commande.adresse GROUP BY adresse.ville ORDER BY COUNT(*) DESC ;



-- Quel restaurant possède la meilleure note moyenne ? --
SELECT restaurant.nom, AVG( administrer.note) OVER ( PARTITION BY restaurant.nom  ) AS MOYENNE FROM restaurant INNER JOIN administrer ON restaurant.id_restaurant=administrer.restaurant 
INNER JOIN client ON client.id_client=administrer.client WHERE client.fonction='client' AND ROWNUM=1 ORDER BY MOYENNE DESC ;


-- Quel est l'âge moyen des clients de la ville de Beauvais ? --
SELECT  AVG(client.age) AS agemoyenne FROM client INNER JOIN adresse ON client.id_client = adresse.client WHERE adresse.postal='60000' ;


-- Connaitre le nombre de livraisons effectuées par un livreur sur le mois de février 2020 ? --
SELECT  COUNT(commande.programmation)  FROM  COMMANDE INNER JOIN livreur ON commande.livreur =livreur.id_livreur  WHERE livreur ='0' AND '02-2020'=TO_CHAR(commande.programmation, 'MM-YYYY') ;


-- Connaitre le nombre de km parcourus par un livreur sur l'année 2019 ? --
SELECT SUM(commande.km) AS totalkm, livreur.nom FROM livreur RIGHT JOIN COMMANDE ON livreur.id_livreur=commande.livreur WHERE livreur.nom='ANDFURIOUS' GROUP BY livreur.nom  ;


-- Quelle est la moyenne d'âge des clients ayant effectué au moins une commande au cours de l'année 2020 ? --
SELECT  AVG(client.age) AS moyenneage FROM client INNER JOIN historique ON historique.client=client.id_client INNER JOIN commande ON commande.id_transaction=historique.commande WHERE '2020'=to_char(commande.programmation,'yyyy');


-- Quel est le nom et le prénom du client ayant effectué le plus grand nombre de commandes au cours del'année 2019 ? --
SELECT client.prenom, client.nom, COUNT(*) plus FROM client INNER JOIN historique ON client.id_client= historique.client 
INNER JOIN commande ON historique.commande = commande.id_transaction 
WHERE '2020'=TO_CHAR(commande.programmation, 'yyyy') 
GROUP BY client.prenom, client.nom ORDER BY plus DESC ;




-- Quel client a dépensé la plus grande somme sur la plateforme en payant avec des avoirs ? --
SELECT client.nom, MAX(avoir.montant) AS montantMAX FROM client INNER JOIN avoir ON client.id_client=avoir.client WHERE ROWNUM=1  GROUP BY client.nom;


-- Quel est le pourcentage de clients n'ayant pas été parainnés par rapport à l'ensemble des clients de la plateforme ? --
SELECT (SELECT COUNT(client.nom)*100 FROM client INNER JOIN parrainagec ON client.id_client = parrainagec.client ) /COUNT(*)  AS moyenne  FROM client GROUP BY SYS.client_ip_address;