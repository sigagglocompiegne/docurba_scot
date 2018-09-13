# docurba_scot

## Définition

Une surface est considérée comme consommée d'un point de vue des espaces naturels et agricoles lorsque celle-ci présente un état de retour irréversible à de tels usages. Dans le cadre du SCOT de l'ARC, cet état de surface est considéré comme consommé à partir du stade d'aménagement où le terrain est acquis, viabilisé et fouillé (archéologie). Ce stade précéde le stade d'artificialisation et d'urbanisation au sens de la construction d'un bâtiment. 

## Méthodologie de détermination des surfaces au SCOT


## Classes d'objet

Initialement, les classes d'objet ne concernaient que le territoire de l'ARC lors de l'approbation du SCOT fin 2012, soit 15 communes.
Avec l'évolution territoriale et l'élargissement à la commune de Lachelle et la CCBA de nouvelles classes se sont ajoutées, ceci afin de ne pas dénaturer les données initiales héritées de ces territoires.
A des fins d'exploitation, les territoires concernés sont rassemblés dans une vue.

L'ensemble des classes d'objets de gestion sont stockés dans le schéma m_urbanisme_reg

---

   `geo_scot_hyp_surf_a_conso_arc` : Table géographique des hypothèses de localisation sommaire des surfaces à consommer approuvées au SCOT fin 2012 de l''ARC (15 communes)

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|id|Identifiant|integer| |
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


---

   `geo_scot_[territoire]_surface_urba` : table géographique des surfaces considérées comme déjà consommées au SCOT.

|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |

---

   `geo_scot_[territoire]_surface_modif` : table géographique des ajustements validés par les élus pour les hypothèses de localisation sommaire des surfaces à consommer entre la phase d'arrêt et l'approbation du SCOT.
  
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|type_modif|Type de modification [SUP;AJOUT]|character varying(10)| |
|type_surf|Type de surface [habitat;activités;renouvellement urbain;infrastructure - équipement]|character varying(30)| |
|insee|Code INSEE|character(5)| |
|sup|Superficie en ha|double precision| |
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |

---
