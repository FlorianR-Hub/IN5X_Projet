# Projet IN5X - Notice d’utilisation

**Notes :** 
* Avant toute chose, ajoutez les dossier et les sous-dossiers de **apprentissage**, **database**, **FCM** et **KPPV** au *path* de Matlab.
* Tous les scripts sont à exécuter depuis le dossier racine du projet.


## Méthode KPPV

### Apprentissage à partir des images de la base d’apprentissage

Lancer le script apprentissageKPPV.m
Génère les fichiers « tranche_age_XX_.csv » dans le dossier apprentissage.

### Estimer la tranche d’âge d’une personne

Ecrire la requête suivante dans la fenêtre de commande en modifiant nom_image.jpg :
age = detectionKPPV(imread(‘nom_image.jpg’);

### Estimer la tranche d’âge de toutes les images de la base de test

Lancer le script testKPPV.m

## Méthode Fuzzy C Mean

### Apprentissage à partir des images de la base d’apprentissage

Lancer le script apprentissageFCM.m
Génère le fichier FCM.csv dans le dossier apprentissage.

### Estimer l’âge d’une personne

Lancer la section suivante du script testFCM.M, en modifiant nom_image.jpg :

```
%% Age détecté pour une image
classifieur = csvread('apprentissage\FCM.csv');
imgName = 'nom_image.jpg';
A = sscanf(imgName,'%d_%d');
ageDetecte = decisionFCM(classifieur, imread(imgName), 2);
fprintf('Age réel = %d / Age detecté = %.2f\n', A(1), ageDetecte); 
```

### Calcul du delta année moyen entre l’âge réel et l’âge détecté des images de la base de test

Lancer la section suivante du script testFCM.m :

```
%% Calcul du delta année à partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne écart age = %.2f\n', delta);
```
