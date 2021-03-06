![picto](/doc/img/Logo_web-GeoCompiegnois.png)

# Documentation utilisateur de la donnée #

## Définition des termes :

* **Densification** :

|Schéma|Définition|
|:---|:---|
||délimitation de l'emprise foncière de toutes nouvelles constructions dans la tache urbaine existante. Il peut s'agir d'une nouvelle construction sur une parcelle vierge (habitat, activité, ...), d'une division parcellaire avec une nouvelle construction, d'une démolition suivi d'une reconstruction 1+n sur la même emprise foncière (une maison détruite et 2 reconstruites, voire 1 maison détruite pour 1 immeuble construit).

* **Renouvellement urbain** :

|Schéma|Définition|
|:---|:---|
||délimitation de l'emprise foncière d'une requalification urbaine d'un ilôt, d'une friche ou d'un quartier dans la tache urbain existante. Ce renouvellement implique généralement la création d'une nouvelle voirie, de nouveaux bâtiments et d'espace public|

* **Etalement** :

|Schéma|Définition|
|:---|:---|
|||

## Zone urbaine prise en compte :

* **Les infrastructures** :

. les routes et les voie ferrées sont intégrées avec leurs accotements si ils sont clairement identifiables

. les routes et les voies ferrées, si leurs accotements ne sont pas clairement identifiés, correspondent à un tampon de 4m autour du filaire de voie, voire 3m pour les routes en forêt. Les carrefours et limites de communes doivent faire l'objet d'un traitement manuel.

. dans le cas d'une route ou d'une voie ferrée délimitée par un fuseau bien identifiable (par le cadastre par exemple) il est concidéré comme une infrastructure dans son emsemble

* **Les constructions agricoles** :

. les hangars agricoles isolés ne sont pas à intégrer

. l'habitat agricole est pris en compte (ferme ou logement sur parcelle agricole)

## Etapes mises en oeuvre pour compléter les consommations issues du SCoT et réutilisation pour le PLUi :

### 1-De la "tache urbaine" 2012 à la "tache urbaine" 2008 :

* **Principes** :

. réaliser ce travail commune par commune 

. réaffecter les dates de début et fin de consommation des polygones 

. les polygones concernés par une surface calculée au SCoT ne peuvent pas être modifiés (couche Hypothèse de surface à consommer au SCoT dans le projet QGIS)

. si doute, faire une annotation (sera traité par l'équipe SIG)

. si une zone de densification ou de renouvellement urbain est remarquée faire une annotation (sera traité à l'étape 4)

* **Comment** : 

 . avec le support Ortho 2008 de l'IGN

* **Règles** : 

1 - si l'interprétation du contenu du polygone ne montre pas d'évolutions de surface, celui-ci doit prendre la valeur date de fin de consommation = 2008 et rien en date de début de consommation

2 - si l'interprétation du contenu du polygone montre une évolution de surface, aucune modification tant que la commune n'est pas entièrement modifiée

3 - lorsque la commune est traitée, revenir sur les polygones non modifiés (non affectés à la "tache urbaine 2008) et appliquer les règles suivantes :

#### le polygone est entièrement concerné par une consommation entre 2008 et 2012 et une destination unique, pas de découpe et affectation des valeurs suivantes :

Date de début de consommation : 2008

Date de fin de consommation : 2012

Destination : indiquer la valeur correspondante (obligatoire))

Type de consommation : Etalement

Opération d'aménagement : indiquer le nom si nécessaire


#### le polygone n'est pas entièrement concerné par une consommation entre 2008 et 2012 ou une destination unique, une découpe est nécessaire (attention, les limites extérieures de la tache urbaine ne peuvent pas être modifiées) :

- en respectant les limites du cadastre à l'intérieur des polygones de la "tache urbaine 2012"
- affecter les valeurs suivantes pour le polygone consommé entre 2008 et 2012 :

Date de début de consommation : 2008

Date de fin de consommation : 2012

Destination : indiquer la valeur correspondante (obligatoire)

Type de consommation : Etalement

Opération d'aménagement : indiquer le nom si nécessaire

- affecter les valeurs suivantes pour le polygone sans évolution

Date de début de consommation : rien

Date de fin de consommation : 2008

Destination : indiquer la valeur correspondante (si possible)

Type de consommation : non concerné

Opération d'aménagement : rien


**SI UN DOUTE SUBSISTE FAIRE UNE ANNOTATION. CE CAS SERA TRAITE A LA FIN DU TRAITEMENT DE TOUTES LES COMMUNES.**


### 2-Compléter la "tache urbaine 2012" :

### 2.1-par les espaces urbanisés non pris en compte dans la TU 2012 (hors infra) :

* **Principes** : 

. compléter les polygones de consommation non présent dans la "tache urbaine 2012" 

* **Comment** : 

. avec le support Ortho 2013 de GéoPicardie
. avec les zones AU inscrites au PLUi

* **Règles** : 

. les polygones existant ne peuvent pas être modifiés, les compléments ne peuvent s'effectuer qu'avec un ajout de polygones.
. adopter les règles du point 1 pour une cohérence des données


### 2.2-par les infrastructures présentes dans les zones AU inscrites au PLUi et dans le reste de la commune :

* **Principes** : 

. compléter les polygones de consommation non présents dans la "tache urbaine 2012" 

* **Comment** : 

. avec le support Ortho 2013 de GéoPicardie

* **Règles** : 

. les polygones existant ne peuvent pas être modifiés, les compléments ne peuvent s'effectuer qu'avec un ajout de polygones.
. adopter les règles du point 1 pour une cohérence des données


### 2.3-Compléter la "tache urbaine 2012" par les zones de densification et de renouvellement urbain :

* **Principes** : 

. découper la "tache urbaine 2012" par des polygones délimitant les zones de densification et renouvellement urbain 

* **Comment** : 

. revenir sur les annotations inscrites dans l'étape 1


