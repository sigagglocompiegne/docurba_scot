# docurba_scot

## Définition

Une surface est considérée comme consommée d'un point de vue des espaces naturels et agricoles lorsque celle-ci présente un état de retour irréversible à des tels usages. Dans le cadre du SCOT de l'ARC, cet état de surface est considéré comme consommé à partir du stade d'aménagement où le terrain est acquis, viabilisé et fouillé (archéologie). Ce stade précéde le stade d'artificialisation et d'urbanisation au sens de la construction d'un bâtiment. 

## Méthodologie de détermination des surfaces au SCOT


## Classes d'objet

L'ensemble des classes d'objets de gestion sont stockés dans le schéma m_urbanisme_reg

   `geo_scot_surface_urba` : table géographique des surfaces considérées comme déjà consommées au SCOT.
 
   
   `geo_scot_surface_t0` : table géographique des hypothèses de localisation sommaire des surfaces à consommer au titre des surfaces approuvées au SCOT.
   
   
   `geo_scot_surface_modif` : table géographique des ajustements validés par les élus des hypothèses de localisation sommaire des surfaces à consommer entre la phase d'arrêt et l'approbation du SCOT.
  
|Nom attribut | Définition | Type | Valeurs par défaut |
|:---|:---|:---|:---|
|type_modif|Type de modification [SUP;AJOUT]|character varying(10)| |
|type_surf|Type de surface [habitat;activités;infrastructure - équipement]|character varying(30)| |
|insee|Code INSEE|character(5)| |
|sup|Superficie en ha|double precision| |
|geom|Géométrie de l'objet|geometry(MultiPolygon,2154)| |
