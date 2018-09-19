




-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                CLASSE D'OBJET                                                                ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- #################################################################### SURF CONSO ########################################################


-- ###################
-- ##      ARC      ##
-- ################### 

-- Table: m_urbanisme_reg.geo_scot_surf_conso_arc

-- DROP TABLE m_urbanisme_reg.geo_scot_surf_conso_arc;

CREATE TABLE m_urbanisme_reg.geo_scot_surf_conso_arc
(
  id bigint NOT NULL,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),  
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_surf_conso_arc_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_arc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_arc TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_arc TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_arc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_surf_conso_arc TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_arc
  IS 'Surface considérée comme consommée au titre des espaces naturels et agricoles lors de l''approbation du SCOT fin 2012 de l''ARC (15 communes)';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_arc.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_arc ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_conso_arc_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_surf_conso_arc_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_surf_conso_arc_geom_gist;

CREATE INDEX geo_scot_surf_conso_arc_geom_gist
  ON m_urbanisme_reg.geo_scot_surf_conso_arc
  USING gist
  (geom);

-- ###################
-- ###    CCBA      ##
-- ###################

-- Table: m_urbanisme_reg.geo_scot_surf_conso_ccba

-- DROP TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba;

CREATE TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba
(
  id bigint NOT NULL,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),  
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_surf_conso_ccba_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba
  IS 'Surface considérée comme rétrospectivement consommée fin 2012 au titre des espaces naturels et agricoles sur l''ex CCBA selon la méthodologie du SCOT de l''ARC';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_ccba.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_conso_ccba_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_surf_conso_ccba_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_surf_conso_ccba_geom_gist;

CREATE INDEX geo_scot_surf_conso_ccba_geom_gist
  ON m_urbanisme_reg.geo_scot_surf_conso_ccba
  USING gist
  (geom);
  
-- ###################
-- ##    LACHELLE   ##
-- ################### 

 
-- Table: m_urbanisme_reg.geo_scot_surf_conso_lach

-- DROP TABLE m_urbanisme_reg.geo_scot_surf_conso_lach;

CREATE TABLE m_urbanisme_reg.geo_scot_surf_conso_lach
(
  id bigint NOT NULL,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),  
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_surf_conso_lach_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_lach
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_lach TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_surf_conso_lach TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_lach TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_surf_conso_lach TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_surf_conso_lach
  IS 'Surface considérée comme rétrospectivement consommée fin 2012 au titre des espaces naturels et agricoles sur la commune de Lachelle selon la méthodologie du SCOT de l''ARC';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_conso_lach.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_lach ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_conso_lach_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_surf_conso_lach_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_surf_conso_lach_geom_gist;

CREATE INDEX geo_scot_surf_conso_lach_geom_gist
  ON m_urbanisme_reg.geo_scot_surf_conso_lach
  USING gist
  (geom);


-- #################################################################### SURF A CONSO ########################################################


-- ###################
-- ##      ARC      ##
-- ################### 

-- Table: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc

-- DROP TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc;

CREATE TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
(
  id bigint NOT NULL,
  ope_amgt character varying(80),
  destsurf character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  typeconso character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),  
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_hyp_surf_a_conso_arc_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
  IS 'Table géographique des hypothèses de localisation sommaire des surfaces à consommer approuvées au SCOT fin 2012 de l''ARC (15 communes)';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.ope_amgt IS 'Nom de l''opération d''aménagement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.destsurf IS 'Destination d''usage de la surface à consommer';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.typeconso IS 'Type de consommation de surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc_geom_gist;

CREATE INDEX geo_scot_hyp_surf_a_conso_arc_geom_gist
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
  USING gist
  (geom);
  

-- #################################################################### SURF A CONSO AJUSTEMENTS ########################################################


-- ###################
-- ##      ARC      ##
-- ################### 

-- Table: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc

-- DROP TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc;

CREATE TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
(
  id bigint NOT NULL,
  ope_amgt character varying(80),  
  destsurf character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  typeconso character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  typeajust character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),  
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_hyp_surf_a_conso_ajust_arc_pkey PRIMARY KEY (id)  
)
WITH (
  OIDS=TRUE
);
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc TO create_sig;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc TO edit_sig;
COMMENT ON TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  IS 'Table géographique des ajustements des hypothèses de localisation sommaire des surfaces à consommer entre l''arrêt et l''approbation du SCOT de l''ARC (15 communes)';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.ope_amgt IS 'Nom de l''opération d''aménagement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.destsurf IS 'Destination d''usage de la surface à consommer';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.typeconso IS 'Type de consommation de surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.typeajust IS 'Type d''ajustement des surfaces entre l''arrêt et l''approbation du SCOT de l''ARC';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc_geom_gist;

CREATE INDEX geo_scot_hyp_surf_a_conso_ajust_arc_geom_gist
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  USING gist
  (geom);
  


-- #################################################################### SURF SUIVI CONSO ########################################################


-- #####################
-- ##      ARCBA      ##
-- ##################### 

-- Table: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
(
  id bigint NOT NULL,
  ope_amgt character varying(80),
  destsurf character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  typeconso character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  annee_deb character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  annee_fin character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  insee character varying(5) NOT NULL,
  commune character varying(150) NOT NULL,
  sup_ha real,
  observ character varying(254),
  src_geom character varying(2) NOT NULL DEFAULT '00' ::bpchar,
  src_date character varying(4) NOT NULL DEFAULT '0000' ::bpchar,
  date_sai timestamp without time zone NOT NULL DEFAULT now(),  
  date_maj timestamp without time zone,
  geom geometry(MultiPolygon,2154),
  
  CONSTRAINT geo_scot_surf_suivi_conso_arcba_pkey PRIMARY KEY (id)  
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
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.id IS 'Identifiant';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.ope_amgt IS 'Nom de l''opération d''aménagement';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.destsurf IS 'Destination d''usage de la surface consommée';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.typeconso IS 'Type de consommation de surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.annee_deb IS 'Année de début de période de consommation de la surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.annee_fin IS 'Année de fin de période de consommation de la surface';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.insee IS 'Code INSEE';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.commune IS 'Nom de la commune';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.sup_ha IS 'Superficie en ha';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.observ IS 'Observations';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.src_geom IS 'Référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.src_date IS 'Année du millésime du référentiel de saisie';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.date_sai IS 'Horodatage de l''intégration en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.date_maj IS 'Horodatage de la mise à jour en base de l''objet';
COMMENT ON COLUMN m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba.geom IS 'Géométrie de l''objet';

-- Sequence: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq

-- DROP SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq;

CREATE SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq
  INCREMENT 1
  MINVALUE 0
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq
  OWNER TO sig_create;
GRANT ALL ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq TO sig_create;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq TO create_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq TO read_sig;
GRANT SELECT, UPDATE ON SEQUENCE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq TO edit_sig;
ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba ALTER COLUMN id SET DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_id_seq'::regclass);

-- index spatial

-- Index: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_geom_gist

-- DROP INDEX m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_geom_gist;

CREATE INDEX geo_scot_surf_suivi_conso_arcba_geom_gist
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  USING gist
  (geom);
  
  

-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                DOMAINES DE VALEURS                                                           ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- ################################################################# Domaine valeur - lt_scot_destsurf #############################################

-- Table: m_urbanisme_reg.lt_scot_destsurf

-- DROP TABLE m_urbanisme_reg.lt_scot_destsurf;

CREATE TABLE m_urbanisme_reg.lt_scot_destsurf
(
  code character (2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_scot_destsurf_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_scot_destsurf
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_scot_destsurf TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_scot_destsurf TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_scot_destsurf TO edit_sig;

COMMENT ON TABLE m_urbanisme_reg.lt_scot_destsurf
  IS 'Liste des valeurs permettant de décrire la destination de la surface';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_destsurf.code IS 'Code';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_destsurf.valeur IS 'Valeur';

INSERT INTO m_urbanisme_reg.lt_scot_destsurf(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('01','Habitat'),
    ('02','Activité'),
    ('03','Destination mixte habitat/activité'),
    ('04','Loisirs et tourisme'),
    ('05','Equipement'),
-- liste héritée du standard PLUi du CNIG et restreinte aux occurences adaptées pour la conso de surface au SCOT    
    ('99','Autre');
  
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


-- ################################################################# Domaine valeur - lt_scot_typeajust #############################################

-- Table: m_urbanisme_reg.lt_scot_typeajust

-- DROP TABLE m_urbanisme_reg.lt_scot_typeajust;

CREATE TABLE m_urbanisme_reg.lt_scot_typeajust
(
  code character (2) NOT NULL,
  valeur character varying(80) NOT NULL,
  CONSTRAINT lt_scot_typeajust_pkey PRIMARY KEY (code)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE m_urbanisme_reg.lt_scot_typeajust
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.lt_scot_typeajust TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.lt_scot_typeajust TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.lt_scot_typeajust TO edit_sig;

COMMENT ON TABLE m_urbanisme_reg.lt_scot_typeajust
  IS 'Liste des valeurs permettant de décrire le type d''ajustement opéré sur les hypothèses de surfaces à consommer pour le SCOT';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_typeajust.code IS 'Code';
COMMENT ON COLUMN m_urbanisme_reg.lt_scot_typeajust.valeur IS 'Valeur';

INSERT INTO m_urbanisme_reg.lt_scot_typeajust(
            code, valeur)
    VALUES
    ('00','Non renseigné'),
    ('01','Suppression'),
    ('02','Ajout'),
    ('99','Autre');   
    
  
-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                                        VUES                                                                  ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################
  

-- View: m_urbanisme_reg.geo_v_scot_surf_conso_arcba

-- DROP VIEW m_urbanisme_reg.geo_v_scot_surf_conso_arcba;

CREATE OR REPLACE VIEW m_urbanisme_reg.geo_v_scot_surf_conso_arcba AS
SELECT ('arc' || ltrim(to_char(id,'999')))  as id, insee, commune, sup_ha, observ, src_geom, src_date, date_sai, date_maj, geom
FROM m_urbanisme_reg.geo_scot_surf_conso_arc
UNION
SELECT ('ccba' || ltrim(to_char(id,'999'))) as id, insee, commune, sup_ha, observ, src_geom, src_date, date_sai, date_maj, geom
FROM m_urbanisme_reg.geo_scot_surf_conso_ccba
UNION
SELECT ('lach' || ltrim(to_char(id,'999'))) as id, insee, commune, sup_ha, observ, src_geom, src_date, date_sai, date_maj, geom
FROM m_urbanisme_reg.geo_scot_surf_conso_lach;


ALTER TABLE m_urbanisme_reg.geo_v_scot_surf_conso_arcba
  OWNER TO sig_create;
GRANT ALL ON TABLE m_urbanisme_reg.geo_v_scot_surf_conso_arcba TO sig_create;
GRANT SELECT ON TABLE m_urbanisme_reg.geo_v_scot_surf_conso_arcba TO read_sig;
GRANT SELECT, UPDATE, INSERT, DELETE ON TABLE m_urbanisme_reg.geo_v_scot_surf_conso_arcba TO edit_sig;
								       
COMMENT ON VIEW m_urbanisme_reg.geo_v_scot_surf_conso_arcba
  IS 'Vue étendue à l''ARCBA des surfaces considérées comme consommées au titre des espaces naturels et agricoles lors de l''approbation du SCOT fin 2012 de l''ARC (15 communes)';  



-- ####################################################################################################################################################
-- ###                                                                                                                                              ###
-- ###                                                           FKEY (clé étrangère)                                                               ###
-- ###                                                                                                                                              ###
-- ####################################################################################################################################################


-- Table: m_urbanisme_reg.geo_scot_surf_conso_arc

ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_arc
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Table: m_urbanisme_reg.geo_scot_surf_conso_ccba

ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_ccba
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;

-- Table: m_urbanisme_reg.geo_scot_surf_conso_lach

ALTER TABLE m_urbanisme_reg.geo_scot_surf_conso_lach
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
-- Table: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc

ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
ADD CONSTRAINT lt_scot_destsurf_fkey FOREIGN KEY (destsurf)
      REFERENCES m_urbanisme_reg.lt_scot_destsurf (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_typeconso_fkey FOREIGN KEY (typeconso)
      REFERENCES m_urbanisme_reg.lt_scot_typeconso (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;
      
-- Table: m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc

ALTER TABLE m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
ADD CONSTRAINT lt_scot_destsurf_fkey FOREIGN KEY (destsurf)
      REFERENCES m_urbanisme_reg.lt_scot_destsurf (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_typeconso_fkey FOREIGN KEY (typeconso)
      REFERENCES m_urbanisme_reg.lt_scot_typeconso (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_src_geom_fkey FOREIGN KEY (src_geom)
      REFERENCES r_objet.lt_src_geom (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
ADD CONSTRAINT lt_scot_typeajust_fkey FOREIGN KEY (typeajust)
      REFERENCES m_urbanisme_reg.lt_scot_typeajust (code) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION;             
  
-- Table: m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

ALTER TABLE m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
ADD CONSTRAINT lt_scot_destsurf_fkey FOREIGN KEY (destsurf)
      REFERENCES m_urbanisme_reg.lt_scot_destsurf (code) MATCH SIMPLE
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



-- ####################################################### TRIGGER - surf_conso_arc  #############################################################


-- *** calcul_sup_ha

-- Trigger: t_geo_scot_surf_conso_arc_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_arc

-- DROP TRIGGER t_geo_scot_surf_conso_arc_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_arc;

CREATE TRIGGER t_geo_scot_surf_conso_arc_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_conso_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();
  
-- Trigger: t_geo_scot_surf_conso_ccba_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_ccba

-- DROP TRIGGER t_geo_scot_surf_conso_ccba_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_ccba;

CREATE TRIGGER t_geo_scot_surf_conso_ccba_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_conso_ccba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();
  
-- Trigger: t_geo_scot_surf_conso_lach_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_lach

-- DROP TRIGGER t_geo_scot_surf_conso_lach_sup_ha on m_urbanisme_reg.geo_scot_surf_conso_lach;

CREATE TRIGGER t_geo_scot_surf_conso_lach_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_conso_lach
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();    


-- *** date_maj 

-- Trigger: t_geo_scot_surf_conso_arc_date_maj on m_urbanisme_reg.geo_scot_surf_conso_arc

-- DROP TRIGGER t_geo_scot_surf_conso_arc_date_maj ON m_urbanisme_reg.geo_scot_surf_conso_arc;

CREATE TRIGGER t_geo_scot_surf_conso_arc_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_surf_conso_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();
  
-- Trigger: t_geo_scot_surf_conso_ccba_date_maj on m_urbanisme_reg.geo_scot_surf_conso_ccba

-- DROP TRIGGER t_geo_scot_surf_conso_ccba_date_maj ON m_urbanisme_reg.geo_scot_surf_conso_ccba;

CREATE TRIGGER t_geo_scot_surf_conso_ccba_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_surf_conso_ccba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();
  
-- Trigger: t_geo_scot_surf_conso_lach_date_maj on m_urbanisme_reg.geo_scot_surf_conso_lach

-- DROP TRIGGER t_geo_scot_surf_conso_lach_date_maj ON m_urbanisme_reg.geo_scot_surf_conso_lach;

CREATE TRIGGER t_geo_scot_surf_conso_lach_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_surf_conso_lach
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();  
  


-- ####################################################### TRIGGER - hyp_surf_a_conso_arc  #############################################################

-- *** calcul_sup_ha

-- Trigger: t_geo_scot_hyp_surf_a_conso_arc_sup_ha on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc

-- DROP TRIGGER t_geo_scot_hyp_surf_a_conso_arc_sup_ha on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc;

CREATE TRIGGER t_geo_scot_hyp_surf_a_conso_arc_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();


-- ####################################################### TRIGGER - hyp_surf_a_conso_ajust_arc  #############################################################

-- *** calcul_sup_ha

-- Trigger: t_geo_scot_hyp_surf_a_conso_ajust_arc_sup_ha on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc

-- DROP TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_sup_ha on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc;

CREATE TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();


-- *** insee

/* ***** Attention, à l'échelle cadastrale, problème de calage de geomètrie du referentiel osm, propre topologiquement en revanche *****


-- Trigger: t_geo_scot_hyp_surf_a_conso_ajust_arc_insee on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc

-- DROP TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_insee ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc;

CREATE TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_commune_s(); 

*/  
  
-- *** date_maj 

-- Trigger: t_geo_scot_hyp_surf_a_conso_ajust_arc_date_maj on m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc

-- DROP TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_date_maj ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc;

CREATE TRIGGER t_geo_scot_hyp_surf_a_conso_ajust_arc_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_hyp_surf_a_conso_ajust_arc
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();  
  
  

-- ####################################################### TRIGGER - suivi_conso #############################################################

-- *** calcul_sup_ha

-- Trigger: t_geo_scot_surf_suivi_conso_arcba_sup_ha on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_geo_scot_surf_suivi_conso_arcba_sup_ha on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_geo_scot_surf_suivi_conso_arcba_sup_ha
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_sup_ha_maj();


-- *** insee

/* ***** Attention, à l'échelle cadastrale, problème de calage de geomètrie du referentiel osm, propre topologiquement en revanche *****


-- Trigger: t_geo_scot_surf_suivi_conso_arcba_insee on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_geo_scot_surf_suivi_conso_arcba_insee ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_geo_scot_surf_suivi_conso_arcba_insee
  BEFORE INSERT OR UPDATE OF geom
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_commune_s(); 

*/  
  
-- *** date_maj 

-- Trigger: t_geo_scot_surf_suivi_conso_arcba_date_maj on m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba

-- DROP TRIGGER t_geo_scot_surf_suivi_conso_arcba_date_maj ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba;

CREATE TRIGGER t_geo_scot_surf_suivi_conso_arcba_date_maj
  BEFORE UPDATE
  ON m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba
  FOR EACH ROW
  EXECUTE PROCEDURE public.r_timestamp_maj();  



  
  
  

