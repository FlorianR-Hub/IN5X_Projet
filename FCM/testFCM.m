% Test de la d�tection de la tranche d'�ge avec la m�thode FCM

%% Calcul du delta ann�e � partir d'un dossier
classifieur = csvread('apprentissage\FCM.csv');
delta = decisionFCM_tous(classifieur,'database\database_test\', 2);
fprintf('Moyenne �cart age = %.2f\n', delta); 


%% Age detect� pour une image
% classifieur = csvread('apprentissage\FCM.csv');
% img = imread('37_1974_2011_ 12133.jpg');
% age = decisionFCM(classifieur, img, 2);
% fprintf('Age d�tect� = %.2f\n', age);
