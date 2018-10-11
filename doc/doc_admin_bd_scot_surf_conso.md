![picto](/doc/img/Logo_web-GeoCompiegnois.png)

# Documentation d'administration #

## Préambule

### Définition

Dans un SCOT, une surface est considérée comme consommée d'un point de vue des espaces naturels et agricoles lorsque celle-ci présente un état de retour irréversible à de tels usages.
Dans le cadre du SCOT de l'ARC, cet état a été considéré comme tel lorsque le terrain est acquis, viabilisé et fouillé (d'un point de vue archéologique) dans une opération d'aménagement. Ce stade précéde le stade d'artificialisation et d'urbanisation au sens de la "construction", qui lui s'évalue plus généralement par la tâche urbaine.

### Méthodologie de détermination des surfaces SCOT

Le type de consommation des surfaces est déterminé de cette façon :

|Type|Description|
|:---|:---|
|Etalement|Consommation de surface par extension de l'urbanisation en zone AU|
|Densification|Consommation de surface de type "dent creuse" en zone U|
|Renouvellement urbain|Surface précédemment consommée et faisant l'objet d'une opération de renouvellement urbain, en zone U ou AU|

Ce sont donc les documents de planifications locaux, le plan cadastral (PCI vecteur) et des orthophotoplans qui ont servis principalement d'appui pour constituer l'enveloppe de la zone déjà consommée en 2012.
En plus des zones d'habitat et d'activités, les secteurs d'équipements publics (ex : cimetière) y compris sportifs (terrain) ou de loisirs (parc) ont été intégrés dans les surfaces consommées au titre des espaces naturels et agricoles.


## Schéma fonctionnel

![schema_fonctionnel](img/schema_fonctionnel_****.png)

## Classes d'objet

L'ensemble des classes d'objets de gestion est stocké dans le schéma m_urbanisme_reg

--

Initialement, les classes d'objet ne concernaient que le territoire de l'ARC lors de l'approbation du SCOT fin 2012, soit 15 communes.
Avec l'évolution territoriale et l'élargissement à la commune de Lachelle et la CCBA de nouvelles classes se sont ajoutées pour ces territoires, afin de ne pas mélanger des informations constituées.
A des fins d'exploitation, les territoires concernés sont rassemblés dans une vue.

--

 `geo_scot_hyp_surf_a_conso_arc` : Table géographique des hypothèses de localisation sommaire des surfaces à consommer approuvées au SCOT fin 2012 de l'ARC (15 communes).

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant|bigint| |
|ope_amgt|Nom de l'opération d'aménagement|character varying(80)| |
|destsurf|Destination d'usage de la surface à consommer|character varying(2)|'00'::bpchar|
|typeconso|Type de consommation de surface|character varying(2)|'00'::bpchar|
|insee|Code INSEE|character(5)| |
|commune|Libellé de la commune|character varying(150)| |
|sup_ha|Superficie en ha|real| |
|src_geom|Référentiel de saisie|character varying(2)|'00'::bpchar|
|src_date|Année du millésime du référentiel de saisie|character varying(4)|'0000'::bpchar|
|date_sai|Horodatage de l'intégration en base de l'objet|timestamp without time zone|now()|
|date_maj|Horodatage de la mise à jour en base de l'objet|timestamp without time zone| |
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |

---

 `geo_scot_hyp_surf_a_conso_ajust_arc` : Table géographique des ajustements des hypothèses de localisation sommaire des surfaces à consommer entre l'arrêt et l'approbation du SCOT de l'ARC (15 communes).

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant|bigint| |
|ope_amgt|Nom de l'opération d'aménagement|character varying(80)| |
|destsurf|Destination d'usage de la surface à consommer|character varying(2)|'00'::bpchar|
|typeconso|Type de consommation de surface|character varying(2)|'00'::bpchar|
|typeajust|Type d'ajustement des surfaces entre l'arrêt et l'approbation du SCOT de l'ARC|character varying(2)|'00'::bpchar|
|insee|Code INSEE|character(5)| |
|commune|Libellé de la commune|character varying(150)| |
|sup_ha|Superficie en ha|real| |
|src_geom|Référentiel de saisie|character varying(2)|'00'::bpchar|
|src_date|Année du millésime du référentiel de saisie|character varying(4)|'0000'::bpchar|
|date_sai|Horodatage de l'intégration en base de l'objet|timestamp without time zone|now()|
|date_maj|Horodatage de la mise à jour en base de l'objet|timestamp without time zone| |
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |


---

   `geo_scot_surf_suivi_conso_arcba` : Table géographique du suivi de la consommation des surfaces sur l'ARCBA depuis l'approbation du SCoT (2012).

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|gid|Identifiant|bigint NOT NULL| DEFAULT nextval('m_urbanisme_reg.geo_scot_surf_suivi_conso_arcba_gid_seq'::regclass)|
|insee|Code INSEE|character(5)| |
|commune|Libellé de la commune|character varying(150)| |
|date_sai|Horodatage de l'intégration en base de l'objet|timestamp without time zone|now()|
|date_maj|Horodatage de la mise à jour en base de l'objet|timestamp without time zone| |
|op_sai|Personne ayant saisie ou modifié les données |character varying(50)| |
|destdomi|Destination d'usage dominant de la surface à consommer|character varying(2)|'00'|
|a_conso_d|Année de début de période de consommation de la surface|integer||
|a_conso_d|Année de fin de période de consommation de la surface|integer||
|typeconso|Type de consommation de surface|character varying(2)|'00'|
|a_dru_d|Année de début de période de consommation de la surface dans le cas d'une densification ou d'un renouvellement urbain|integer||
|a_dru_d|Année de fin de période de consommation de la surface dans le cas d'une densification ou d'un renouvellement urbain|integer||
|src_geom|Référentiel de saisie|character varying(2)|'00'|
|src_date|Année du millésime du référentiel de saisie|integer NOT NULL||
|sup_ha|Superficie en ha|double precision| |
|ope_amgt|Nom de l'opération d'aménagement|character varying(80)| |
|observ|Observations|character varying(254)| |
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |

Cette classe d'objet est destinée à être modifiée contrairement aux précédentes, ceci afin d'effectuer le suivi de la consommation des surfaces du SCOT.

---

## Liste de valeurs

`m_urbanisme_reg.lt_scot_destsurf` : Liste des valeurs permettant de décrire la destination de la surface

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code|character varying(2)| |
|valeur|Valeur|character varying(80)| |

Valeurs possibles (héritées du standard PLU du CNIG et restreintes aux occurences adaptées pour la conso de surface au SCOT)

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|01|Habitat|
|02|Activité|
|03|Destination mixte habitat/activité|
|04|Loisirs et tourisme|
|05|Equipement|
|99|Autre|

---

`m_urbanisme_reg.lt_scot_typeconso` : Liste des valeurs permettant de décrire le type de consommation de la surface

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code|character varying(2)| |
|valeur|Valeur|character varying(80)| |
|definition|Définition|character varying(254)| |

Valeurs possibles :

|Code|Valeur|Definition|
|:---|:---|:---|
|00|Non renseigné| |
|01|Etalement|Consommation de surface par extension de l'urbanisation en zone AU|
|02|Densification|Consommation de surface de type "dent creuse" en zone U|
|03|Renouvellement urbain|Surface précédemment consommée et faisant l'objet d'une opération de renouvellement urbain, en zone U ou AU|
|99|Autre| |
|ZZ|Non concerné| |

---

`m_urbanisme_reg.lt_scot_typeajust` : Liste des valeurs permettant de décrire le type d'ajustement opéré sur les hypothèses de surfaces à consommer pour le SCOT

|Nom attribut | Définition | Type  | Valeurs par défaut |
|:---|:---|:---|:---|    
|code|Code|character varying(2)| |
|valeur|Valeur|character varying(80)| |

Valeurs possibles :

|Code|Valeur|
|:---|:---|
|00|Non renseigné|
|01|Suppression|
|02|Ajout|
|99|Autre|

---


## Projet QGIS pour la gestion

Un projet QGIS a été réalisé pour la gestion interne des données. Il est stocké ici :
R:\Projets\Metiers\1809URBA-ARC-SCOT_suivi_surface\SUIVI_CONSO_SCOT_PLUI.qgz

## Traitement automatisé mis en place (Workflow de l'ETL FME)

### Traitement statistique

(à écrire)


## Export Open Data

Sans objet

---

## Modèle conceptuel simplifié

![mcd](img/MCD.png)


