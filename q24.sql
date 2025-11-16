CREATE TABLE DIM_CLIENTS ( 
	CLIENT_KEY           INTEGER   NOT NULL,
	CLIENTID_SOURCE      VARCHAR2(100)   ,
	NOM_COMPLET          VARCHAR2(255)   ,
	EMAIL                VARCHAR2(255)   ,
	TELEPHONE            VARCHAR2(50)   ,
	DATE_INSCRIPTION     DATE   ,
	STATUT_COMPTE        VARCHAR2(100)   ,
	PAYS_RESIDENCE       VARCHAR2(100)   ,
	VILLE_RESIDENCE      VARCHAR2(100)   ,
	AGE                  INTEGER   ,
	GENRE                VARCHAR2(50)   ,
	TYPE_CLIENT          VARCHAR2(100)   ,
	PROFESSION           VARCHAR2(100)   ,
	REVENU_ANNUEL_ESTIME NUMBER   ,
	ANCIENNETE_JOURS     INTEGER   ,
	SEGMENT_COMPORTEMENTAL VARCHAR2(100)   ,
	SCORE_ENGAGEMENT     INTEGER   ,
	CANAL_PREFERE        VARCHAR2(50)   ,
	LANGUE_PREFEREE      VARCHAR2(10)   ,
	NIVEAU_VERIFICATION_KYC VARCHAR2(50)   ,
	DATE_DERNIERE_CONNEXION DATE   ,
	DATENAISSANCE        DATE   ,
	ABONNEMENT           VARCHAR2(100)   ,
	CATEGORIESOCIOPRO    VARCHAR2(100)   ,
	TRANCHEAGE           VARCHAR2(50)   ,
	TRANCHEREVENU        VARCHAR2(100)   ,
	SEGMENTCLIENT        VARCHAR2(100)   ,
	CLASSEANCIENNETE     VARCHAR2(50)   ,
	APRODUITCREDIT       INTEGER   ,
	ACOMPTEINVESTISSEMENT INTEGER   ,
	PRIMARY KEY ( CLIENT_KEY ) 
 );

CREATE TABLE DIM_DATE ( 
	DATE_KEY             INTEGER   NOT NULL,
	DATE_COMPLETE        DATE   ,
	JOUR_SEMAINE         VARCHAR2(20)   ,
	NUMERO_JOUR_SEMAINE  INTEGER   ,
	NOM_MOIS             VARCHAR2(20)   ,
	NUMERO_MOIS          INTEGER   ,
	ANNEE                INTEGER   ,
	TRIMESTRE            INTEGER   ,
	SEMESTRE             INTEGER   ,
	EST_FERIE            INTEGER   ,
	TYPE_JOUR            VARCHAR2(50)   ,
	NUMERO_SEMAINE       INTEGER   ,
	NUMERO_JOUR_ANNEE    INTEGER   ,
	EST_BISSEXTILE       INTEGER   ,
	NOM_JOUR_FERIE       VARCHAR2(100)   ,
	DESCRIPTIONDATECOMPLETE VARCHAR2(100)   ,
	NUMEROJOURMOIS       INTEGER   ,
	ANNEEMOIS            VARCHAR2(7)   ,
	TRIMESTRECALENDIARE  VARCHAR2(7)   ,
	ANNEETRIMESTRECALENDIAIRE VARCHAR2(10)   ,
	SEMESTRECALENDIARE   VARCHAR2(7)   ,
	ESTFINDESEMAINE      INTEGER   ,
	ESTFINDEMOIS         INTEGER   ,
	ESTJOURBOURSIER      INTEGER   ,
	PRIMARY KEY ( DATE_KEY ) 
 );

CREATE TABLE DIM_DEVISES ( 
	DEVISE_KEY           INTEGER   NOT NULL,
	CODE_ISO             VARCHAR2(10)   ,
	NOM_DEVISE           VARCHAR2(100)   ,
	SYMBOLE              VARCHAR2(10)   ,
	TAUX_CHANGE_USD      NUMBER   ,
	TAUX_CHANGE_EUR      NUMBER   ,
	PAYS_PRINCIPAL       VARCHAR2(100)   ,
	REGION_DEVISE        VARCHAR2(100)   ,
	VOLATILITE_MOYENNE_POURCENT NUMBER   ,
	UNITE_FRACTIONNAIRE  VARCHAR2(50)   ,
	NOMBRE_DECIMALES     INTEGER   ,
	DATE_MISE_A_JOUR     DATE   ,
	EST_CRYPTO           INTEGER   ,
	EST_STABLE           INTEGER   ,
	PRIMARY KEY ( DEVISE_KEY ) 
 );

CREATE TABLE DIM_INFO_TRANSACTION ( 
	INFOTRANSACTION_KEY  INTEGER   NOT NULL,
	EST_BLOQUE           INTEGER   ,
	STATUT_TRANSACTION   VARCHAR2(100)   ,
	CODE_ERREUR          VARCHAR2(50)   ,
	TYPETRANSACTION      VARCHAR2(100)   ,
	TYPEBENEFICIAIRE     VARCHAR2(100)   ,
	EST_FRAUDE           INTEGER   ,
	ESTRECURRENT         INTEGER   ,
	SCHEMAPAIEMENT       VARCHAR2(100)   ,
	SOURCEFINANCEMENT    VARCHAR2(100)   ,
	MODELEFRAIS          VARCHAR2(50)   ,
	MODECAPTURE          VARCHAR2(50)   ,
	CODEDEVISE           VARCHAR2(10)   ,
	PRIMARY KEY ( INFOTRANSACTION_KEY ) 
 );

CREATE TABLE DIM_LIEUX ( 
	LIEU_KEY             INTEGER   NOT NULL,
	PAYS                 VARCHAR2(100)   ,
	REGION               VARCHAR2(100)   ,
	VILLE                VARCHAR2(100)   ,
	LATITUDE             NUMBER   ,
	LONGITUDE            NUMBER   ,
	FUSEAU_HORAIRE       VARCHAR2(50)   ,
	CODE_PAYS_ISO        VARCHAR2(10)   ,
	ADRESSE_COMPLETE     VARCHAR2(500)   ,
	CODE_POSTAL          VARCHAR2(20)   ,
	TYPE_ZONE            VARCHAR2(50)   ,
	MODE_VERIFICATION    VARCHAR2(50)   ,
	PRECISION_METRES     INTEGER   ,
	CONTINENT            VARCHAR2(50)   ,
	VPN_DETECTE          INTEGER   ,
	PROXY_DETECTE        INTEGER   ,
	EST_ZONE_RISQUE      INTEGER   ,
	ZONEGEO              VARCHAR2(100)   ,
	ZONETRANSFRONTALIERE INTEGER   ,
	NIVEAURISQUEPAYS     VARCHAR2(50)   ,
	ESTSANCTIONNE        INTEGER   ,
	DEVISE               VARCHAR2(50)   ,
	PRIMARY KEY ( LIEU_KEY ) 
 );

CREATE TABLE DIM_MARCHANDS ( 
	MARCHAND_KEY         INTEGER   NOT NULL,
	NOM_MARCHAND         VARCHAR2(255)   ,
	CODE_MCC             VARCHAR2(10)   ,
	CATEGORIE_MARCHAND   VARCHAR2(100)   ,
	PAYS_MARCHAND        VARCHAR2(100)   ,
	EST_EN_LIGNE         INTEGER   ,
	NIVEAU_CONFIANCE     VARCHAR2(50)   ,
	ACCEPTE_CRYPTO       INTEGER   ,
	EST_PARTENAIRE       INTEGER   ,
	TAUX_CASHBACK_POURCENT NUMBER   ,
	SOUSCATEGORIEMARCHAND VARCHAR2(100)   ,
	REGIONMARCHAND       VARCHAR2(100)   ,
	VILLEMARCHAND        VARCHAR2(100)   ,
	CANALPRINCIPAL       VARCHAR2(50)   ,
	TAILLEMARCHAND       VARCHAR2(50)   ,
	NIVEAURISQUEMARCHAND VARCHAR2(50)   ,
	PRIMARY KEY ( MARCHAND_KEY ) 
 );

CREATE TABLE DIM_MODES_OPERATION ( 
	MODES_OPERATION_KEY  INTEGER   NOT NULL,
	CANAL                VARCHAR2(100)   ,
	TYPE_DISPOSITIF      VARCHAR2(100)   ,
	SYSTEME_EXPLOITATION VARCHAR2(100)   ,
	METHODE_AUTHENTIFICATION VARCHAR2(100)   ,
	VERSION_APPLICATION  VARCHAR2(50)   ,
	NIVEAU_SECURISATION  VARCHAR2(50)   ,
	ADRESSE_IP           VARCHAR2(45)   ,
	LOCALISATION_IP      VARCHAR2(100)   ,
	FOURNISSEUR_INTERNET VARCHAR2(100)   ,
	VERSION_OS           VARCHAR2(50)   ,
	NAVIGATEUR           VARCHAR2(50)   ,
	LIBELLE_OPERATION    VARCHAR2(255)   ,
	CATEGORIE_OPERATION  VARCHAR2(100)   ,
	MOYEN_PAIEMENT       VARCHAR2(100)   ,
	ORIGINE_FONDS        VARCHAR2(100)   ,
	DESTINATION_FONDS    VARCHAR2(100)   ,
	TYPE_RECURRENCE      VARCHAR2(50)   ,
	MODE_EXECUTION       VARCHAR2(50)   ,
	NIVEAU_RISQUE        VARCHAR2(50)   ,
	DELAI_TRAITEMENT_PREV_SEC INTEGER   ,
	VPN_DETECTE          INTEGER   ,
	TOR_DETECTE          INTEGER   ,
	EMPREINTE_DISPOSITIF VARCHAR2(255)   ,
	MODE_CANAL           VARCHAR2(100)   ,
	TYPERESEAU           VARCHAR2(50)   ,
	POINTENTREE          VARCHAR2(100)   ,
	CARTEPRESENTE        INTEGER   ,
	CARTETOKENISEE       INTEGER   ,
	SANSCONTACT          INTEGER   ,
	PRIMARY KEY ( MODES_OPERATION_KEY ) 
 );

CREATE TABLE DIM_PLANS ( 
	PLAN_KEY             INTEGER   NOT NULL,
	NOM_PLAN             VARCHAR2(100)   ,
	CODE_PLAN            VARCHAR2(50)   ,
	TARIF_MENSUEL        NUMBER   ,
	TARIF_ANNUEL         NUMBER   ,
	TYPE_FACTURATION     VARCHAR2(50)   ,
	REDUCTION_POURCENT   NUMBER   ,
	A_BENEFICIE_REDUCTION INTEGER   ,
	DATE_DEBUT_PLAN      DATE   ,
	DATE_FIN_PLAN        DATE   ,
	NIVEAU_PLAN          INTEGER   ,
	LIMITE_RETRAITS_GRATUITS INTEGER   ,
	FRAIS_CHANGE_DEVISE_POURCENT NUMBER   ,
	ASSURANCE_INCLUSE    INTEGER   ,
	CASHBACK_POURCENT    NUMBER   ,
	PRIMARY KEY ( PLAN_KEY ) 
 );

CREATE TABLE DIM_TEMPS ( 
	TEMPS_KEY            INTEGER   NOT NULL,
	HEURE                INTEGER   ,
	MINUTE               INTEGER   ,
	HEURE_COMPLETE       VARCHAR2(8)   ,
	PERIODE_JOURNEE      VARCHAR2(50)   ,
	TRANCHE_HORAIRE      VARCHAR2(50)   ,
	EST_HEURE_POINTE     INTEGER   ,
	EST_HEURE_OUVRABLE   INTEGER   ,
	PRIMARY KEY ( TEMPS_KEY ) 
 );

CREATE TABLE FAIT_TRANSACTIONS_DETAILLE ( 
	DATE_ID              INTEGER   NOT NULL,
	HEURE_ID             INTEGER   NOT NULL,
	CLIENT_ID            INTEGER   NOT NULL,
	PLAN_ID              INTEGER   NOT NULL,
	LIEU_ID              INTEGER   NOT NULL,
	DEVISE_ID            INTEGER   NOT NULL,
	MODE_OPERATION_ID    INTEGER   NOT NULL,
	MARCHAND_ID          INTEGER   NOT NULL,
	INFO_TRANSACTION_ID  INTEGER   NOT NULL,
	MONTANT              NUMBER   ,
	FRAIS                NUMBER   ,
	MONTANT_TOTAL        NUMBER   ,
	CASHBACK_GAGNE       NUMBER   ,
	SCORE_FRAUDE         INTEGER   ,
	HORODATAGE_TRANSACTION INTEGER   ,
	DUREE_TRAITEMENT_MS  INTEGER   ,
	NOMBRE_TENTATIVES    INTEGER   ,
	PRIMARY KEY ( DATE_ID, HEURE_ID, CLIENT_ID, PLAN_ID, LIEU_ID, DEVISE_ID, MODE_OPERATION_ID, MARCHAND_ID, INFO_TRANSACTION_ID ) ,
	FOREIGN KEY ( MODE_OPERATION_ID ) REFERENCES DIM_MODES_OPERATION( MODES_OPERATION_KEY )    ,
	FOREIGN KEY ( CLIENT_ID ) REFERENCES DIM_CLIENTS( CLIENT_KEY )    ,
	FOREIGN KEY ( DATE_ID ) REFERENCES DIM_DATE( DATE_KEY )    ,
	FOREIGN KEY ( DEVISE_ID ) REFERENCES DIM_DEVISES( DEVISE_KEY )    ,
	FOREIGN KEY ( INFO_TRANSACTION_ID ) REFERENCES DIM_INFO_TRANSACTION( INFOTRANSACTION_KEY )    ,
	FOREIGN KEY ( LIEU_ID ) REFERENCES DIM_LIEUX( LIEU_KEY )    ,
	FOREIGN KEY ( MARCHAND_ID ) REFERENCES DIM_MARCHANDS( MARCHAND_KEY )    ,
	FOREIGN KEY ( PLAN_ID ) REFERENCES DIM_PLANS( PLAN_KEY )    ,
	FOREIGN KEY ( HEURE_ID ) REFERENCES DIM_TEMPS( TEMPS_KEY )    
 );

CREATE VIEW VUE_CLIENTS_DETAILLE AS SELECT 
    Client_Key AS client_id,
    nom_complet,
    email,
    telephone,
    date_inscription,
    statut_compte,
    pays_residence,
    ville_residence,
    age,
    genre,
    type_client,
    profession,
    revenu_annuel_estime,
    anciennete_jours,
    segment_comportemental,
    score_engagement,
    canal_prefere,
    langue_preferee,
    niveau_verification_kyc,
    date_derniere_connexion
FROM 
    DIM_CLIENTS;

CREATE VIEW VUE_DATE_DETAILLE AS SELECT 
    Date_Key AS date_id,
    date_complete,
    jour_semaine,
    numero_jour_semaine,
    nom_mois,
    numero_mois,
    annee,
    trimestre,
    semestre,
    est_ferie,
    type_jour,
    numero_semaine,
    numero_jour_annee,
    est_bissextile,
    nom_jour_ferie
FROM 
    DIM_DATE;

CREATE VIEW VUE_DEVISES_DETAILLE AS SELECT 
    Devise_Key AS devise_id,
    code_iso,
    nom_devise,
    symbole,
    taux_change_usd,
    taux_change_eur,
    pays_principal,
    region_devise,
    volatilite_moyenne_pourcent,
    unite_fractionnaire,
    nombre_decimales,
    date_mise_a_jour,
    est_crypto,
    est_stable
FROM 
    DIM_DEVISES;

CREATE VIEW VUE_INFO_TRANSACTION_DETAILLE AS SELECT 
    InfoTransaction_Key AS info_transaction_id,
    est_fraude AS est_frauduleux,
    est_bloque,
    statut_transaction,
    code_erreur
FROM 
    DIM_INFO_TRANSACTION;

CREATE VIEW VUE_LIEUX_DETAILLE AS SELECT 
    Lieu_Key AS lieu_id,
    pays,
    code_pays_iso,
    region,
    ville,
    adresse_complete,
    code_postal,
    latitude,
    longitude,
    type_zone,
    mode_verification,
    precision_metres,
    continent,
    vpn_detecte,
    proxy_detecte,
    fuseau_horaire,
    est_zone_risque
FROM 
    DIM_LIEUX;

CREATE VIEW VUE_MARCHANDS_DETAILLE AS SELECT 
    Marchand_Key AS marchand_id,
    nom_marchand,
    code_mcc,
    categorie_marchand,
    pays_marchand,
    est_en_ligne,
    niveau_confiance,
    accepte_crypto,
    est_partenaire,
    taux_cashback_pourcent
FROM 
    DIM_MARCHANDS;

CREATE VIEW VUE_MODES_OPERATION_DETAILLE AS SELECT 
    Modes_Operation_Key AS mode_operation_id,
    canal AS type_canal,
    type_dispositif,
    version_application,
    niveau_securisation,
    methode_authentification AS mode_verification,
    adresse_ip,
    localisation_ip,
    fournisseur_internet,
    systeme_exploitation,
    version_os,
    navigateur,
    libelle_operation,
    categorie_operation,
    moyen_paiement,
    origine_fonds,
    destination_fonds,
    type_recurrence,
    mode_execution,
    niveau_risque,
    delai_traitement_prev_sec,
    vpn_detecte,
    tor_detecte,
    empreinte_dispositif
FROM 
    DIM_MODES_OPERATION;

CREATE VIEW VUE_PLANS_DETAILLE AS SELECT 
    Plan_Key AS plan_id,
    nom_plan,
    code_plan,
    tarif_mensuel,
    tarif_annuel,
    type_facturation,
    reduction_pourcent,
    a_beneficie_reduction,
    date_debut_plan,
    date_fin_plan,
    niveau_plan,
    limite_retraits_gratuits,
    frais_change_devise_pourcent,
    assurance_incluse,
    cashback_pourcent
FROM 
    DIM_PLANS;

CREATE VIEW VUE_TEMPS_DETAILLE AS SELECT 
    Temps_Key AS heure_id,
    heure,
    minute,
    heure_complete,
    periode_journee,
    tranche_horaire,
    est_heure_pointe,
    est_heure_ouvrable
FROM 
    DIM_TEMPS;

