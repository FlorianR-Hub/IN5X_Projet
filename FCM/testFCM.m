%calcul du delta ann�e � partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne �cart age = %.2f\n',delta); 


%age detect� pour une image
% img = imread('...');
% age = decisionFCM([AgeCluster,Cluster],img,2);
