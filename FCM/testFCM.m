%calcul du delta année à partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne écart age = %.2f\n',delta); 


%age detecté pour une image
% img = imread('...');
% age = decisionFCM([AgeCluster,Cluster],img,2);
