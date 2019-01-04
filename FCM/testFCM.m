% Test de la détection de la tranche d'âge avec la méthode FCM

% Calcul du delta année à partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne écart age = %.2f\n', delta); 


% Age detecté pour une image
% img = imread('...');
% age = decisionFCM([AgeCluster,Cluster],img,2);
