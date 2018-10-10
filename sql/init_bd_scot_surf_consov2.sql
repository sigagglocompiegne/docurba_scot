-- ####################################################################################################################################################
-- GB 2018-10-10 : initialisation du code pour le suivi des consommations SCOT (méthode ARC)
-- Principe : gérer dans un même fichier les différentes stades de consommation (étalement, densification, renouvellement urbain)
-- tout en conservant la possibilité de générer des taches "d'Espaces à vocation urbaine" par année ou fin de période.


-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

BEGIN;
-- ################################################################# Domaine valeur - lt_scot_destsurf #############################################

-- Table: m_urbanisme_reg.lt_scot_destdomi

-- DROP TABLE m_urbanisme_reg.lt_scot_destdomi;

CREATE TABLE m_urbanisme_reg.lt_scot_destdomi
(
  code character (2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_scot_destdomi_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_scot_destdomi
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_scot_destdomi TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_scot_destdomi TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_scot_destdomi TO edit_sig;

COMMENT ON TABLE m_urbanisme_reg.lt_scot_destdomi
  IS 'Liste des valeurs permettant de décrire la destination dominante de la surface';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_destdomi.code IS 'Code';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_destdomi.valeur IS 'Valeur';

INSERT INTO m_urbanisme_reg.lt_scot_destdomi(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('01','Habitat'),
    ('02','Activité'),
    ('03','Destination mixte habitat/activité'),
    ('04','Loisirs et tourisme'),
    ('05','Equipement'),
-- liste héritée du standard PLUi du CNIG et restreinte aux occurences adaptées pour la conso de surface au SCOT    
    ('99','Autre'),
    ('ZZ','Non concerné');
  
-- ################################################################# Domaine valeur - lt_scot_typeconso #############################################

-- Table: m_urbanisme_reg.lt_scot_typeconso

-- DROP TABLE m_urbanisme_reg.lt_scot_typeconso;

CREATE TABLE m_urbanisme_reg.lt_scot_typeconso
(
  code character (2) NOT NULL,
  valeur character varying(80) NOT NULL,
  definition character varying(254),
  CONSTRAINT lt_scot_typeconso_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_scot_typeconso
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_scot_typeconso TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_scot_typeconso TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_scot_typeconso TO edit_sig;

COMMENT ON TABLE m_urbanisme_reg.lt_scot_typeconso
  IS 'Liste des valeurs permettant de décrire le type de consommation de la surface';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_typeconso.code IS 'Code';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_typeconso.valeur IS 'Valeur';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_typeconso.definition IS 'Définition';

INSERT INTO m_urbanisme_reg.lt_scot_typeconso(
            code, valeur, definition)
    VALUES
    ('00','Non renseigné',''),
    ('01','Etalement','Consommation de surface par extension de l''urbanisation en zone AU'),
    ('02','Densification','Consommation de surface de type "dent creuse" en zone U'),
    ('03','Renouvellement urbain','Surface précédemment consommée et faisant l''objet d''une opération de renouvellement urbain, en zone U ou AU'),
    ('99','Autre','');  




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                CLASSE D'OBJET                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- #################################################################### SUIVI SURF CONSO ##############################################################


-- ###################
-- ##      ARC      ##
-- ################### 

-- Sequence: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq TO edit_sig;


-- Table: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
(
  gid bigint NOT NULL DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq'::regclass),
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  date_sai timestamp without time zone DEFAULT now(),  
  date_maj timestamp without time zone,
  op_sai character varying(50),
  destdomi character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  a_conso_d integer,
  a_conso_f integer NOT NULL,
  typeconso character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  a_dru_d integer ,
  a_dru_f integer,
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date integer NOT NULL,
  sup_ha double precision,
  ope_amgt character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  observ character varying(254),
  geom geometry(MultiPolygon,2154),
  CONSTRAINT geo_scot_surf_suivi_conso_arcba_pkey PRIMARY KEY (gid)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  IS 'Table géographique du suivi de la consommation des surfaces sur l''ARCBA';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.gid IS 'Identifiant interne';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.op_sai IS 'Opérateur de saisies ou de mises à jour des données';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.destdomi IS 'Destination d''usage dominant de la surface consommée';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.a_conso_d IS 'Année de début de période de consommation de la surface en étalement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.a_conso_f IS 'Année de fin de période de consommation de la surface en étalement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.typeconso IS 'Type de consommation de surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.a_dru_d IS 'Année de début de période de consommation de la surface dans le cas d''une densification ou d''un renouvellement urbain';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.a_dru_f IS 'Année de fin de période de consommation de la surface dans le cas d''une densification ou d''un renouvellement urbain';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.ope_amgt IS 'Nom de l''opération d''aménagement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.geom IS 'Géométrie de l''objet';


-- index spatial

-- Index: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_geom_gist;

CREATE INDEX geo_scot_surf_suivi_conso_arcba_geom_gist
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  USING gist
  (geom);
  
  
    
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        VUES                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################
  

-- View: m_urbanisme_reg.geo_v_scot_surf_conso_arcba

-- DROP VIEW m_urbanisme_reg.geo_v_scot_surf_conso_arcba;

CREATE OR REPLACE VIEW m_urbanisme_reg.geo_v_tacheespurb_2012 AS
SELECT
row_number() over() as gid,
st_union(geom) as geom
FROM m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
WHERE a_conso_f >= 2012;

ALTER TABLE m_urbanisme_reg.geo_v_tacheespurb_2012
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_v_tacheespurb_2012 TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_v_tacheespurb_2012 TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_v_tacheespurb_2012 TO edit_sig;
								       
COMMENT ON VIEW m_urbanisme_reg.geo_v_tacheespurb_2012
  IS 'Vue reconstruisant la taches "d''Espaces à vocation urbaine" en 2012';  



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                           FKEY (clé étrangère)                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################

       
  
-- Table: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
ADD CONSTRAINT lt_scot_destdomi_fkey FOREIGN KEY (destdomi)
      REFERENCES m_urbanisme_reg.lt_scot_destdomi (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_ces_voca_fkey FOREIGN KEY (ope_amgt)
      REFERENCES m_foncier.lt_ces_voca (l_voca) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_typeconso_fkey FOREIGN KEY (typeconso)
      REFERENCES m_urbanisme_reg.lt_scot_typeconso (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
         
      
      
      
      
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                     TRIGGER                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################



-- ####################################################### TRIGGER - suivi_conso #############################################################

-- *** calcul_sup_ha

-- Trigger: t_t1_geo_scot_surf_suivi_conso_arcba_sup_ha on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_t1_geo_scot_surf_suivi_conso_arcba_sup_ha on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_t1_geo_scot_surf_suivi_conso_arcba_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();

  
-- *** date_sai

-- Trigger: t_t2_geo_scot_surf_suivi_conso_arcba_date_sai on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_t2_geo_scot_surf_suivi_conso_arcba_date_sai ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_t2_geo_scot_surf_suivi_conso_arcba_date_sai
  BEFORE INSERT
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_sai();  
  
-- *** date_maj 

-- Trigger: t_t3_geo_scot_surf_suivi_conso_arcba_date_maj on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_t3_geo_scot_surf_suivi_conso_arcba_date_maj ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_t3_geo_scot_surf_suivi_conso_arcba_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();  
  
 -- *** insee et commune

-- Trigger: t_t4_geo_scot_surf_suivi_conso_arcba_insee on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_t4_geo_scot_surf_suivi_conso_arcba_insee ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_t4_geo_scot_surf_suivi_conso_arcba_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_commune_c();  


-- Trigger de contrôle de saisie

 CREATE OR REPLACE FUNCTION m_urbanisme_reg.r_ctrl_suivi_conso_s()
  RETURNS trigger AS
$BODY$BEGIN

-- si typeconso = 'densification ou renouvellement urbain' les champs a_dru_d et a_dru_f doivent être rempli 
IF (new.typeconso='02' or new.typeconso='03') and new.a_dru_f is null THEN
RAISE EXCEPTION 'Vous devez renseigner la date de début (si connu) et de fin de consommation pour le type de consommation DENSIFICATION ou RENOUVELLEMENT URBAIN';
END IF;

-- si typeconso = 'étalement' les champs a_dru_d et a_dru_f ne doivent pas être rempli 
IF new.typeconso='01' and (new.a_dru_f > 0 or new.a_dru_d > 0)  THEN
RAISE EXCEPTION 'Vous ne pouvez pas saisir d''année de consommation en densification ou renouvellement urbain si le type de consommation est ETALEMENT';
END IF;
			   
-- si date de conso fin obligatoire 
IF new.a_conso_f is null THEN
RAISE EXCEPTION 'Vous devez obligatoirement saisir une date de fin de consommation';
END IF;

RETURN NEW;
END;$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION m_urbanisme_reg.r_sup_ha_maj()
  OWNER TO sig_create;
GRANT EXECUTE ON FUNCTION m_urbanisme_reg.r_ctrl_suivi_conso_s() TO public;
GRANT EXECUTE ON FUNCTION m_urbanisme_reg.r_ctrl_suivi_conso_s() TO sig_create;
GRANT EXECUTE ON FUNCTION m_urbanisme_reg.r_ctrl_suivi_conso_s() TO create_sig;
COMMENT ON FUNCTION m_urbanisme_reg.r_sup_ha_maj() IS 'Fonction dont l''objet est de contrôler la saisie et de remonter des messages d''erreurs à QGIS';

-- Trigger: t_t5_geo_scot_surf_suivi_conso_arcba_ctrl on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_t5_geo_scot_surf_suivi_conso_arcba_ctrl ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_t5_geo_scot_surf_suivi_conso_arcba_ctrl
  BEFORE INSERT OR UPDATE
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE m_urbanisme_reg.r_ctrl_suivi_conso_s(); 


COMMIT;